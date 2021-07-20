//
//  TabBarExtensions.swift
//  Convert
//
//  Created by Alexei Mashkov on 19.07.2021.
//

import UIKit

extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController,
                          animationControllerForTransitionFrom fromVC: UIViewController,
                          to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let fromIndex = viewControllers?.firstIndex(of: fromVC) ?? 0
        let toIndex = viewControllers?.firstIndex(of: toVC) ?? 0
        let multiplicationFactor = Int(fromIndex - toIndex) > 0 ? 1 : -1
        return AnimatedTransition(animationDuration: 0.05,
                                  multiplicationFactor: multiplicationFactor)
    }
}

class AnimatedTransition: NSObject {
    private let multiplicationFactor: Int
    private let animationDuration: Double
    
    init(animationDuration: Double, multiplicationFactor: Int) {
        self.animationDuration = animationDuration
        self.multiplicationFactor = multiplicationFactor
    }
    
    private func animator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        let to = transitionContext.view(forKey: .to)!
        let from = transitionContext.view(forKey: .from)!
        transitionContext.containerView.addSubview(to)
        to.clipsToBounds = true
        to.alpha = 0.4
        to.frame = CGRect(x: to.frame.minX - CGFloat(multiplicationFactor * 150),
                                     y: to.frame.minY,
                                     width: to.frame.width,
                                     height: to.frame.height)
        let duration = transitionDuration(using: transitionContext)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
            to.alpha = 1
            to.frame = CGRect(x: 0,
                              y: 0,
                              width: to.frame.width,
                              height: to.frame.height)
            from.frame = CGRect(x: from.frame.minX + CGFloat(self.multiplicationFactor * 150),
                                y: from.frame.minY,
                                width: from.frame.width,
                                height: from.frame.height)
        }
        
        animator.addCompletion { (position) in
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            transitionContext.containerView.willRemoveSubview(to)
        }
        return animator
    }
}

extension AnimatedTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration)!
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let animator = self.animator(using: transitionContext)
        animator.startAnimation()
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        return self.animator(using: transitionContext)
    }
}
