//
//  TabBarVC.swift
//  UI Design
//
//  Created by Admin on 15/03/24.
//

import UIKit

class TabBarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the selected tab item color to yellow
        tabBar.tintColor = .systemYellow
                
        // Set the unselected tab items color to gray
        tabBar.unselectedItemTintColor = .white
        
    }

}
