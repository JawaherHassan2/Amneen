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
            let item1 = Profile()
            let item2 = SOSNumbers()
            let item3 = CentersLocations()
            let item4 = AppUInfo()
            let item5 = SettingViewController()
//            let item6 = SOSNumbers()
            let icon1 = UITabBarItem(title: NSLocalizedString("68", comment: "الملف الشخصي "), image: UIImage(systemName: "person"), selectedImage: UIImage(systemName: "person.fill"))
            
            let icon2 = UITabBarItem(title: NSLocalizedString("90", comment:"مواقع الطوارئ"), image: UIImage(systemName: "phone"), selectedImage: UIImage(systemName: "phone.fill"))
            let icon3 = UITabBarItem(title: NSLocalizedString("91", comment:"ارقام الطوارئ"), image: UIImage(systemName: "location"), selectedImage: UIImage(systemName: "location.fill"))
            let icon4 = UITabBarItem(title: NSLocalizedString("55", comment: "عن التطبيق"), image: UIImage(systemName: "info.circle"), selectedImage: UIImage(systemName: "info.circle.fill"))
            let icon5 = UITabBarItem(title: NSLocalizedString("56", comment: "الإعدادات"), image: UIImage(systemName: "gearshape"), selectedImage: UIImage(systemName: "gearshape.fill"))
     
         
            item1.tabBarItem = icon1
            item2.tabBarItem = icon2
            item3.tabBarItem = icon3
            item4.tabBarItem = icon4
            item5.tabBarItem = icon5
            
            let controllers = [item1, item2, item3,  item4, item5]  //array of the root view controllers displayed by the tab bar interface
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
