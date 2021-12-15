//
//  AppUInfo.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 11/05/1443 AH.
//

import UIKit
import FirebaseAuth
import ShimmerSwift
class AppUInfo: UIViewController {
    let shimmerView = ShimmeringView(frame: CGRect(x: 75, y: 520, width: 250, height: 50))
    let shimmerView2 = ShimmeringView(frame: CGRect(x: 170, y: 200, width: 300, height: 300 ))
    let Image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius =
//        imageView.frame =  shimmerView2.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "g2")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var Label1: UILabel = {
          let label = UILabel(frame: shimmerView.bounds)
        label.textAlignment = .center
          label.textColor = .black
        
        label.font = UIFont(name: "Avenir-Light", size: 30)
        label.numberOfLines = 10
        label.text = "اهلا بك في تطبيق امنين "
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    
    
    lazy var Label: UILabel = {
          let label = UILabel()
//        label.textAlignment = .right
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.text = "التطبيق الامني الخاص بالمستخدمين يساعد على تعزيز الامن وتقديم المساعده للمستخدم حيث يتيح امكانيه عرض مواقع المراكز الامنيه وعرض ارقام الطوارئ المهمه وامكانيه الاتصال بها مباشره. "
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    func assignbackground(){
          let background = UIImage(named: "z1")
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
        self.tabBarController?.title = NSLocalizedString("55", comment: "عن التطبيق")
        assignbackground()
        super.viewDidLoad()
        self.view.addSubview(shimmerView)
//
        shimmerView.contentView = Label1
        shimmerView.isShimmering = true
        self.view.addSubview(shimmerView2)

        shimmerView2.contentView = Image
        shimmerView2.isShimmering = true
        view.addSubview(Label)
//        view.addSubview(Image)
        
        shimmerView2.translatesAutoresizingMaskIntoConstraints = false
        shimmerView2.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
//        Image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerView2.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        Label.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -30).isActive = true
//        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerView2.heightAnchor.constraint(equalToConstant: 350).isActive = true
        shimmerView2.widthAnchor.constraint(equalToConstant: 350).isActive = true
        
        
        Label.translatesAutoresizingMaskIntoConstraints = false
        Label.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        Label.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -30).isActive = true
//        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Label.heightAnchor.constraint(equalToConstant: 300).isActive = true
        Label.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        shimmerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        Label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
//        Label.rightAnchor.constraint(equalTo: view.leftAnchor, constant: -30).isActive = true
//        Label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        shimmerView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        
        
        
    }

}

