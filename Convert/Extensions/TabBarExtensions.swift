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
        return AnimatedTransition(animationDuration: 1.05,
                                  multiplicationFactor: multiplicationFactor)
    }
}

class AnimatedTransition: NSObject {
    private var multiplicationFactor: Int
    private var animationDuration: Double
    private var animatorForCurrentTransition: UIViewImplicitlyAnimating?
    
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
                          width: to.frame.width, height: to.frame.height)
        let duration = transitionDuration(using: transitionContext)
        let animator = UIViewPropertyAnimator(duration: duration, curve: .linear)
        animator.addAnimations {
            to.alpha = 1
            to.frame = CGRect(x: 0, y: 0,
                              width: to.frame.width, height: to.frame.height)
            from.frame = CGRect(x: from.frame.minX + CGFloat(self.multiplicationFactor * 150),
                                y: from.frame.minY,
                                width: from.frame.width, height: from.frame.height)
        }
        animator.addCompletion { (position) in
            switch position {
                case .end: print("Completion handler called at end of animation")
                case .current: print("Completion handler called mid-way through animation")
                case .start: print("Completion handler called  at start of animation")
            @unknown default:
                fatalError()
            }
            self.animatorForCurrentTransition = nil
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
        self.animatorForCurrentTransition = animator
        return animator
    }
}

extension AnimatedTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return TimeInterval(exactly: animationDuration)!
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        interruptibleAnimator(using: transitionContext).startAnimation()
    }

    func interruptibleAnimator(using transitionContext: UIViewControllerContextTransitioning) -> UIViewImplicitlyAnimating {
        if let animatorForCurrentSession = animatorForCurrentTransition {
            return animatorForCurrentSession
        }
        return self.animator(using: transitionContext)
    }
}
