//
//  R1.swift
//  
//
//  Created by Jawaher🌻 on 05/05/1443 AH.
//
//

import UIKit
import Firebase
import FirebaseAuth
import ShimmerSwift

class R1: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var users: Array<User> = []
    let shimmerView = ShimmeringView(frame: CGRect(x: 75, y: 520, width: 250, height: 50))
    lazy var titleLbl: UILabel = {
        $0.changeUILabel(title: (NSLocalizedString("تسجيل جديد", comment: "")), size: 20)
        
        return $0
    }(UILabel())
    
    lazy var nameTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("الاسم الاول", comment: ""))
        $0.icon.image = UIImage(named: "p22")
       
        
        return $0
    }(V1())
    
    lazy var emailTF:V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("البريد الالكتروني", comment: ""))
        $0.icon.image = UIImage(named: "m1")
        $0.icon.image?.withTintColor(.red)
        return $0
    }(V1())
    
    lazy var passwordTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("كلمه السر", comment: ""))
        $0.icon.image = UIImage(named: "p1")
        $0.textFiled.isSecureTextEntry = true
        return $0
    }(V1())
    
    lazy var lastNameTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("الاسم الاخير", comment: ""))
        $0.icon.image = UIImage(named: "p22")
        return $0
    }(V1())
    
    lazy var singUpBtn: UIButton = {
        $0.changeUIButton1(title: (NSLocalizedString("تسجيل", comment: "")), color: colors.bcolor)
        singUpBtn = UIButton(frame: shimmerView.bounds)
        $0.addTarget(self, action:#selector(startSignUp), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var singInBtn: UIButton = {
        $0.changeUIButton(title: (NSLocalizedString("هل لديك حساب؟", comment: "")) , color: .clear)
        $0.addTarget(self, action:#selector(didPresssignInButton), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var stackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .fillEqually
        return $0
    }(UIStackView())
    
    
    func assignbackground(){
        let background = UIImage(named: "wal6")
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
        
        //      view.backgroundColor = .red
        view.addSubview(titleLbl)
        view.addSubview(singInBtn)
        
        self.view.addSubview(shimmerView)
        self.view.addSubview(singInBtn)
        shimmerView.contentView = singUpBtn
        shimmerView.isShimmering = true
//        view.addSubview(singUpBtn)
        //stack
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTF)
        stackView.addArrangedSubview(lastNameTF)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        
        
        NSLayoutConstraint.activate([
            self.titleLbl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 168),
            self.titleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant:20),
            self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -80),
            
            self.emailTF.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTF.heightAnchor.constraint(equalToConstant: 50),
            self.emailTF.heightAnchor.constraint(equalToConstant: 50),
            self.lastNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            self.shimmerView.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 30),
            self.shimmerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.shimmerView.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.2),
            self.shimmerView.heightAnchor.constraint(equalToConstant: 50),
            
            self.singInBtn.topAnchor.constraint(equalTo: self.singUpBtn.bottomAnchor, constant: 14),
            self.singInBtn.widthAnchor.constraint(equalToConstant: self.view.frame.width),
            self.singInBtn.heightAnchor.constraint(equalToConstant: 30),
            self.singInBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
        ])
    }
    
    @objc func didPresssignInButton(_ sender : UIButton ){
        let VC = TabVC()
        VC.modalPresentationStyle = .fullScreen
        dismiss(animated: true, completion: nil)
        print("move")
        
    }
    
    
    @objc func startSignUp() {
        let email = emailTF.textFiled.text ?? ""
        let password = passwordTF.textFiled.text ?? ""
        let firstNam = nameTF.textFiled.text ?? ""
        let lastNam = lastNameTF.textFiled.text ?? ""
        let uuid = UUID().uuidString
        
        if email.isEmpty || password.isEmpty || firstNam.isEmpty || lastNam.isEmpty {
            print("something is empty")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            
            if email == "securityagency@moi.gov.sa" {
//                let vc = UINavigationController(rootViewController: ContainerViewController())
//                vc.modalTransitionStyle = .crossDissolve
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
                let refreshAlert = UIAlertController(title: "أهلا بك 🤝", message: "في تطبيق آمنين الخاص بالجهات الامنيه", preferredStyle: UIAlertController.Style.alert)
                refreshAlert.view.tintColor = UIColor.systemGreen
                  
                refreshAlert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action: UIAlertAction!) in
                    let vc = UINavigationController(rootViewController: SecurityContainer())
                    vc.modalTransitionStyle = .crossDissolve
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
//                            print("Handle Ok logic here")
                   }))
                
            } else if email == "alsrawat@hotel.com" {
                
                
//                let vc = UINavigationController(rootViewController: TabVC())
//                vc.modalTransitionStyle = .crossDissolve
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
                
                let Alert = UIAlertController(title: "أهلا بك \(firstNam) \(lastNam) 🤝", message:  "في تطبيق آمنين الخاص بالفنادق ", preferredStyle: UIAlertController.Style.alert)
                Alert.view.tintColor = UIColor.systemGreen
               Alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action: UIAlertAction!) in
                   
                  
                   let vc = UINavigationController(rootViewController: HotelContainer())
                   vc.modalTransitionStyle = .crossDissolve
                   vc.modalPresentationStyle = .fullScreen
                   self.present(vc, animated: true, completion: nil)
//                            print("Handle Ok logic here")
                   }))
                self.present(Alert, animated: true, completion: nil)
                
            } else {
                let Alert = UIAlertController(title: "أهلا بك \(firstNam) \(lastNam) 🤝", message: "في تطبيق آمنين   ", preferredStyle: UIAlertController.Style.alert)
                Alert.view.tintColor = UIColor.systemGreen
               Alert.addAction(UIAlertAction(title: "حسنا", style: .default, handler: { (action: UIAlertAction!) in
                   
                  
                   let vc = UINavigationController(rootViewController: HotelContainer())
                   vc.modalTransitionStyle = .crossDissolve
                   vc.modalPresentationStyle = .fullScreen
                   self.present(vc, animated: true, completion: nil)
//                            print("Handle Ok logic here")
                   }))
                self.present(Alert, animated: true, completion: nil)
//                self.present(Alert, animated: true, completion: nil)
//                let vc = UINavigationController(rootViewController: HotelContainer())
//                vc.modalTransitionStyle = .crossDissolve
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
//                let vc = UINavigationController(rootViewController: HotelContainer())
//                vc.modalTransitionStyle = .crossDissolve
//                vc.modalPresentationStyle = .fullScreen
//                self.present(vc, animated: true, completion: nil)
            }
            
                            guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                            Firestore.firestore().document("users/\(currentUserID)").setData([
            //                    "name" : self.name.text,
                                "Id" : currentUserID,
                                "Email" : self.emailTF.textFiled.text,
                                "First Name": self.nameTF.textFiled.text,
                                "Last Name": self.lastNameTF.textFiled.text
            
                            ], merge : true)
                        if error != nil {
                            print(error as Any)
                            return
                        }
        }
        
    }
    
    
    
}

