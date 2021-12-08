//
//  TabVC.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
//

import Foundation
import UIKit

class TabVC: UITabBarController , UITabBarControllerDelegate{

   
        override func viewDidLoad() {
            super.viewDidLoad()
            delegate = self
        }

        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            let item1 = Cities()
            let item2 = List()
            let item3 = SOSNumbers()
            let icon1 = UITabBarItem(title: "الفنادق", image: UIImage(systemName: "house"), selectedImage: UIImage(systemName: "house"))
            
            let icon2 = UITabBarItem(title: "القائمه السوداء", image: UIImage(systemName: "person.fill.xmark"), selectedImage: UIImage(systemName: "person.fill.xmark"))
            let icon3 = UITabBarItem(title: "ارقام تهمك", image: UIImage(systemName: "phone"), selectedImage: UIImage(systemName: "phone"))
            item1.tabBarItem = icon1
            item2.tabBarItem = icon2
            item3.tabBarItem = icon3
            let controllers = [item1, item2, item3]  //array of the root view controllers displayed by the tab bar interface
            self.viewControllers = controllers
         
            
            UITabBar.appearance().backgroundColor = #colorLiteral(red: 0.8499056909, green: 0.8528930617, blue: 0.861855174, alpha: 1)
            UITabBar.appearance().unselectedItemTintColor = #colorLiteral(red: 0.6526222096, green: 0.6526222096, blue: 0.6526222096, alpha: 1)
            UITabBar.appearance().selectedImageTintColor = #colorLiteral(red: 0.2312878684, green: 0.4024465292, blue: 0.1205395112, alpha: 1)
        }

        //Delegate methods
        func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
            print("Should select viewController: \(viewController.title ?? "") ?")
            return true;
        }
    }
