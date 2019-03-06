//
//  HomeScreenViewController.swift
//  Smart_Art
//
//  Created by Jackson Ho on 2/18/19.
//  Copyright © 2019 Jackson Ho. All rights reserved.
//

import UIKit

// Not currently in use
class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //tabBar.barTintColor = .tabBarColor
        //setupTabBar()
    }
    func setupTabBar() {
        let quizController = UINavigationController(rootViewController: QuizViewController())
        quizController.tabBarItem.title = "Quiz"
        viewControllers = [quizController]
    }
}
