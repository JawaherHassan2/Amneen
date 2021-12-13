//
//  SettingViewController.swift
//  sidebar
//
//  Created by Jawaher🌻 on 29/04/1443 AH.
//


import UIKit

class SettingViewController: UIViewController {

    public let label: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
//        label.text = Loc.l1
        label.text =  NSLocalizedString("53", comment:"الوضع الليلي")
        label.font = UIFont(name: "Avenir-Light", size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        return label
    }()
    
    lazy var sButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(changrLa), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("54", comment: "تبديل اللغه"), for: .normal)
        b.layer.cornerRadius = 25
        b.titleLabel?.textColor = .black
        b.setTitleColor(.black, for: .normal)
        b.titleLabel?.textAlignment = .right
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 24)
//        b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
        return b
    }()
    
    var switchController: UISwitch!


   @objc func changrLa() {
        let currentLa = Locale.current.languageCode
        let newLan = currentLa == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
        exit(0)
    }
    func assignbackground(){
          let background = UIImage(named: "z2")
          var imageView : UIImageView!
          imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
          imageView.clipsToBounds = true
          imageView.image = background
          imageView.center = view.center
          view.addSubview(imageView)
          self.view.sendSubviewToBack(imageView)
      }
        
      
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignbackground()
title = NSLocalizedString("72", comment:"الإعدادات ")
        view.backgroundColor = .white
        
        
        
        
        view.addSubview(sButton)
        
        view.addSubview(label)
        let switchDemo = UISwitch(frame:CGRect(x: 210, y: 320, width: 100, height: 100))
               switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
               switchDemo.setOn(true, animated: false)
        switchDemo.onTintColor = #colorLiteral(red: 0.5284338714, green: 0.6214312929, blue: 0.5309254308, alpha: 1)
               self.view.addSubview(switchDemo)
        
        NSLayoutConstraint.activate([
          sButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
//          sButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
          sButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -670),
          sButton.widthAnchor.constraint(equalToConstant: 160),
          sButton.heightAnchor.constraint(equalToConstant: 60),
        ])
        NSLayoutConstraint.activate([
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
//          sButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -530),
            label.widthAnchor.constraint(equalToConstant: 160),
            label.heightAnchor.constraint(equalToConstant: 60),
        ])
        // Do any additional setup after loading the view.
    }
    
    @objc func switchStateDidChange (_ sender: UISwitch) {
        if #available(i0S 13.0, *) {
           let appDelegate = UIApplication.shared.windows.first
            let vc = Home()
           if sender.isOn {
             appDelegate?.backgroundColor = .black
//             view.backgroundColor = .gray
             return
           }
//            vc.view.backgroundColor = .red
          appDelegate?.backgroundColor = .white
           return
         } else {
      }
       }
    


}

