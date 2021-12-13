//
//  SettingViewController.swift
//  sidebar
//
//  Created by Jawaher🌻 on 29/04/1443 AH.
//


import UIKit

class SettingViewController: UIViewController {

    
    
    lazy var sButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(changrLa), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("54", comment: "تبديل اللغه"), for: .normal)
        b.layer.cornerRadius = 25
        b.titleLabel?.textColor = .black
        b.titleLabel?.textAlignment = .right

        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
        b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
        return b
    }()
   @objc func changrLa() {
        let currentLa = Locale.current.languageCode
        let newLan = currentLa == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
        exit(0)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
title = NSLocalizedString("72", comment:"الإعدادات ")
        view.backgroundColor = .white
        
        view.addSubview(sButton)
        
        NSLayoutConstraint.activate([
          sButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
//          sButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
          sButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -670),
          sButton.widthAnchor.constraint(equalToConstant: 160),
          sButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        // Do any additional setup after loading the view.
    }
    


}

