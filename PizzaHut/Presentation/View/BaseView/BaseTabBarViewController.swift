//
//  BaseTabBarViewController.swift
//  PizzaHut
//
//  Created by Putra on 05/10/22.
//

import UIKit

class BaseTabBarViewController: UITabBarController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        
        let tabHome = HomeViewController()
        let tabInbox = InboxViewController()

        
        tabInbox.viewModel = InboxViewModel()
        
        let navTabHome = UINavigationController(rootViewController: tabHome)
        let navTabInbox = UINavigationController(rootViewController: tabInbox)
        
        navTabHome.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house.circle.fill"), tag: 1)
        navTabInbox.tabBarItem = UITabBarItem(title: "Inbox", image: UIImage(systemName: "envelope.open.fill"), tag: 2)
        self.hidesBottomBarWhenPushed = true
        setViewControllers([navTabHome, navTabInbox], animated: false)

        // Do any additional setup after loading the view.
    }
    

}
