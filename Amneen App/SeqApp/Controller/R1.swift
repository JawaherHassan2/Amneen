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

class R1: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var users: Array<User> = []
    
    lazy var titleLbl: UILabel = {
        $0.changeUILabel(title: (NSLocalizedString("تسجيل جديد", comment: "")), size: 20)
        return $0
    }(UILabel())
    
    lazy var nameTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("الاسم الاول", comment: ""))
        $0.icon.image = UIImage(named: "user")
        return $0
    }(V1())
    
    lazy var emailTF:V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("البريد الالكتروني", comment: ""))
        $0.icon.image = UIImage(named: "email")
        return $0
    }(V1())
    
    lazy var passwordTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("كلمه السر", comment: ""))
        $0.icon.image = UIImage(named: "password")
        $0.textFiled.isSecureTextEntry = true
        return $0
    }(V1())
    
    lazy var lastNameTF: V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("الاسم الاخير", comment: ""))
        $0.icon.image = UIImage(named: "birthday")
        return $0
    }(V1())
    
    lazy var singUpBtn: UIButton = {
        $0.changeUIButton(title: (NSLocalizedString("تسجيل", comment: "")), color: colors.bcolor)
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
        let background = UIImage(named: "ff")
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
        view.addSubview(singUpBtn)
        //stack
        view.addSubview(stackView)
        stackView.addArrangedSubview(nameTF)
        stackView.addArrangedSubview(lastNameTF)
        stackView.addArrangedSubview(emailTF)
        stackView.addArrangedSubview(passwordTF)
        
        
        NSLayoutConstraint.activate([
            self.titleLbl.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 200),
            self.titleLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stackView.topAnchor.constraint(equalTo: self.titleLbl.bottomAnchor, constant:20),
            self.stackView.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -80),
            
            self.emailTF.heightAnchor.constraint(equalToConstant: 50),
            self.passwordTF.heightAnchor.constraint(equalToConstant: 50),
            self.emailTF.heightAnchor.constraint(equalToConstant: 50),
            self.lastNameTF.heightAnchor.constraint(equalToConstant: 50),
            
            self.singUpBtn.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 30),
            self.singUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.singUpBtn.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.2),
            self.singUpBtn.heightAnchor.constraint(equalToConstant: 50),
            
            self.singInBtn.topAnchor.constraint(equalTo: self.singUpBtn.bottomAnchor, constant: 5),
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
                let vc = UINavigationController(rootViewController: ContainerViewController())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            } else if email == "hotel@hotel.com" {
                let vc = UINavigationController(rootViewController: TabVC())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                
                let vc = UINavigationController(rootViewController: SOSNumbers())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
            //                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
            //                Firestore.firestore().document("users/\(currentUserID)").setData([
            ////                    "name" : self.name.text,
            //                    "id" : currentUserID,
            //                    "email" : self.emailTF.textFiled.text,
            //
            //                ], merge : true)
            //            if error != nil {
            //                print(error as Any)
            //                return
            //            }
        }
        
    }
    
    
    
}

