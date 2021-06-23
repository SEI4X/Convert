//
//  ViewController.swift
//  Convert
//
//  Created by Alexei Mashkov on 09.06.2021.
//

import UIKit
import RxSwift
import RxCocoa

class TabBarController: UITabBarController {
    private let imageConfig = UIImage.SymbolConfiguration(weight: .medium)
    private var chatTabBarItem = UITabBarItem()
    private var searchTabBarItem = UITabBarItem()
    private var profileTabBarItem = UITabBarItem()
    private var searchViewController = UINavigationController()
    private var chatListViewController = UINavigationController()
    private var profileViewController = UINavigationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //  Bar items config
        chatTabBarItem = configBarItem(title: "Chats", imageName: "paperplane",
                                       selectedImageName: "paperplane.fill")
        searchTabBarItem = configBarItem(title: "Search", imageName: "house",
                                         selectedImageName: "house.fill")
        profileTabBarItem = configBarItem(title: "Profile", imageName: "person",
                                          selectedImageName: "person.fill")
        
        //  Controllers
        searchViewController = configureController(rootVC: SearchViewController(),
                                                   barItem: searchTabBarItem)
        chatListViewController = configureController(rootVC: ChatListViewController(),
                                                     barItem: chatTabBarItem)
        profileViewController = configureController(rootVC: ProfileViewController(),
                                                    barItem: profileTabBarItem)
        
        //  Tab bar config
        configureTabBar()
        viewControllers = [searchViewController, chatListViewController, profileViewController]
        selectedIndex = 1
    }
    
    // MARK: - Configurating functions
    private func configBarItem(title ttl: String, imageName img: String,
                               selectedImageName sImg: String) ->UITabBarItem {
        
        UITabBarItem(title: ttl, image: UIImage(systemName: img,withConfiguration: imageConfig)?
                        .withRenderingMode(UIImage.RenderingMode.alwaysTemplate),
                     selectedImage: UIImage(systemName: sImg, withConfiguration: imageConfig))
    }
    
    // Confugurating navigation controllers
    private func configureController(rootVC: UIViewController,
                                     barItem: UITabBarItem) -> UINavigationController {
        
        let navCont = UINavigationController(rootViewController: rootVC)
        navCont.tabBarItem = barItem
        navCont.navigationBar.shadowImage = UIImage()
        navCont.navigationBar.backgroundColor = .white
        navCont.navigationBar.isTranslucent = false
        navCont.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        return navCont
    }
    
    // Configurating tab bar
    private func configureTabBar() {
        tabBar.shadowImage = UIImage()
        tabBar.backgroundImage = UIImage()
        tabBar.backgroundColor = .white
        tabBar.unselectedItemTintColor = UIColor(red: 0.16, green: 0.30, blue: 0.37, alpha: 1.00)
        tabBar.tintColor = UIColor(red: 0.00, green: 0.68, blue: 1.00, alpha: 1.00)
    }
}

