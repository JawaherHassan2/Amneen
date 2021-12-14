//
//  AppInfo.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 10/05/1443 AH.
//


import UIKit
import FirebaseAuth

class AppInfo: UIViewController {
    
    
    lazy var Label: UILabel = {
          let label = UILabel()
//        label.textAlignment = .right
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.text = "اهلا بك في تطبيق امنين الامني الخاص بالفنادق ، "
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(Label)
        view.backgroundColor = .gray
        
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        Label.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -30).isActive = true
//        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Label.heightAnchor.constraint(equalToConstant: 300).isActive = true
        Label.widthAnchor.constraint(equalToConstant: 400).isActive = true
    }

}
