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


    let containerView: UIView = {
          let view = UIView()
          view.backgroundColor = #colorLiteral(red: 0.8957773326, green: 0.8957773326, blue: 0.8957773326, alpha: 1)
          view.layer.borderWidth = 3
          view.layer.borderColor = #colorLiteral(red: 0.6712911889, green: 0.7063205604, blue: 0.620322791, alpha: 1)
          view.layer.cornerRadius = 20
          view.clipsToBounds = true
          return view
      }()
    
    let containerView2: UIView = {
          let view = UIView()
          view.backgroundColor = #colorLiteral(red: 0.8957773326, green: 0.8957773326, blue: 0.8957773326, alpha: 1)
        
          view.layer.borderWidth = 3
          view.layer.borderColor = #colorLiteral(red: 0.6712911889, green: 0.7063205604, blue: 0.620322791, alpha: 1)
          view.layer.cornerRadius = 20
          view.clipsToBounds = true
          return view
      }()
   @objc func changrLa() {
        let currentLa = Locale.current.languageCode
        let newLan = currentLa == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
        exit(0)
    }
    func assignbackground(){
          let background = UIImage(named: "Image-1")
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
//        view.backgroundColor = UIColor(named: "Color1")
        
        
        
        
        view.addSubview(sButton)
        
        view.addSubview(label)
        
//        let switchDemo = UISwitch()
//        switchDemo.addTarget(self, action: #selector(setDarkModeCell), for: .valueChanged)
//        switchDemo.isOn = false
//        switchDemo.isUserInteractionEnabled = true
//        switchDemo.translatesAutoresizingMaskIntoConstraints = false
//        switchDemo.onTintColor = #colorLiteral(red: 0.5284338714, green: 0.6214312929, blue: 0.5309254308, alpha: 1)
//        switchDemo.isOn = false
               self.view.addSubview(switchDemo)
        
//        NSLayoutConstraint.activate([
////          sButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10),
//          sButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 230),
//          sButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -670),
//          sButton.widthAnchor.constraint(equalToConstant: 200),
//          sButton.heightAnchor.constraint(equalToConstant: 60),
//        ])
//        NSLayoutConstraint.activate([
////            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40),
//            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 170),
//            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -550),
//            label.widthAnchor.constraint(equalToConstant: 200),
//            label.heightAnchor.constraint(equalToConstant: 60),
//        ])
        
        
//        view.backgroundColor = #colorLiteral(red: 0.924799293, green: 0.9050951827, blue: 0.7832662686, alpha: 1)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView)
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
        containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
//        containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView.widthAnchor.constraint(equalToConstant: 350).isActive                                         = true
        containerView.heightAnchor.constraint(equalToConstant: 100).isActive                                        = true
       
        
        sButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(sButton)
        sButton.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        sButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sButton.heightAnchor.constraint(equalToConstant: 100).isActive = true
        sButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        //====
//        view.backgroundColor = #colorLiteral(red: 0.924799293, green: 0.9050951827, blue: 0.7832662686, alpha: 1)
        containerView2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(containerView2)
        containerView2.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive                                = true
        containerView2.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive                                = true
        containerView2.widthAnchor.constraint(equalToConstant: 350).isActive                                         = true
        containerView2.heightAnchor.constraint(equalToConstant: 100).isActive                                        = true
       
        
        label.translatesAutoresizingMaskIntoConstraints = false
        containerView2.addSubview(label)
        label.topAnchor.constraint(equalTo: containerView2.topAnchor, constant: 0).isActive = true
        label.leftAnchor.constraint(equalTo: containerView2.leftAnchor, constant: 0).isActive = true
//        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 100).isActive = true
        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        switchDemo.translatesAutoresizingMaskIntoConstraints = false
        containerView2.addSubview(switchDemo)
        switchDemo.topAnchor.constraint(equalTo: containerView2.topAnchor, constant: 40).isActive = true
        switchDemo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        switchDemo.heightAnchor.constraint(equalToConstant: 100).isActive = true
        switchDemo.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
//        label.translatesAutoresizingMaskIntoConstraints = false
//        containerView.addSubview(label)
//        label.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -40).isActive = true
//        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        label.heightAnchor.constraint(equalToConstant: 170).isActive = true
//        label.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        // Do any additional setup after loading the view.
    }
    
    lazy var switchDemo : UISwitch = {
        let mode = UISwitch()
        mode.addTarget(self, action: #selector(setDarkModeCell), for: .valueChanged)
        mode.isOn = false
        mode.onTintColor = #colorLiteral(red: 0.5284338714, green: 0.6214312929, blue: 0.5309254308, alpha: 1)
        mode.isUserInteractionEnabled = true
        mode.translatesAutoresizingMaskIntoConstraints = false
        return mode
      }()
    
      @objc func setDarkModeCell (_ sender: UISwitch) {
        if switchDemo.isOn == true {
    
           overrideUserInterfaceStyle = .dark
            
          } else  if switchDemo.isOn == false  {
              
         overrideUserInterfaceStyle = .light
              
          }
      }
    



}


