//
//  Container.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 29/04/1443 AH.
//

//import Foundation
//import UIKit
//class Containerv: UIViewController {
//    
//    let menuVC1 = menuVC()
//    let homeVC = Home()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        
//        view.backgroundColor = .gray
//        addChilds()
//        
//    }
//    private func addChilds() {
//           addChild(menuVC1)
//        view.addSubview(menuVC1.view)
//           menuVC1.didMove(toParent: self)
//        
//        homeVC.delegate = self
//        let navVC = UINavigationController(rootViewController: homeVC)
//        addChild(navVC)
//        view.addSubview(navVC.view)
//        navVC.didMove(toParent: self)
//           
//       }
// 
//}
//extension Containerv: hDelegate {
//    func didTab() {
//        print("donnnne")
//    }
//   
//}
