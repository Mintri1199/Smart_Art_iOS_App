//
//  HomeScreenViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.barTintColor = UIColor.green
        setupTabBar()
    }
    
    
    func setupTabBar(){
        let quizController = UINavigationController(rootViewController: QuizViewController())
        
        quizController.tabBarItem.title = "Quiz"
        
        viewControllers = [quizController]
    }
}
