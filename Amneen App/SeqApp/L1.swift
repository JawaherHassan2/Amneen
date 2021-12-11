//
//  L1.swift
//  
//
//  Created by Jawaher🌻 on 05/05/1443 AH.
//


import UIKit
import FirebaseAuth

class L1: UIViewController {
    
    
    //MARK: Step 1
    lazy var titlelbl: UILabel = {
        $0.changeUILabel(title: (NSLocalizedString("تسجيل الدخول", comment: "")), size: 20)
        return $0
    }(UILabel())

    lazy var singInBtn : UIButton = {
        $0.changeUIButton(title:(NSLocalizedString("دخول", comment: "")), color: colors.bcolor)
        
        $0.addTarget(self, action:#selector(tapToSignIn), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var signUpBtn : UIButton = {
        $0.changeUIButton(title: (NSLocalizedString("ليس لديك حساب؟", comment: "")), color: .clear)
        $0.addTarget(self, action:#selector(didPresssignUpButton), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    lazy var emailTextFiled :  V1 = {
        $0.textFiled.placeholder = (NSLocalizedString("البريد الالكتروني", comment: ""))
        $0.icon.image = UIImage(named: "email")
        return $0
    }(V1())
    
    
    lazy var passwordTextFiled : V1  = {
        $0.textFiled.placeholder  = (NSLocalizedString("كلمه السر", comment: ""))
        $0.icon.image = UIImage(named: "password")
        $0.textFiled.isSecureTextEntry = true
        return $0
    }(V1())
    
    
    
    
    lazy var stack : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 20
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

        
        self.view.addSubview(titlelbl)
        self.view.addSubview(signUpBtn)
        self.view.addSubview(singInBtn)

        self.view.addSubview(stack)
        self.stack.addArrangedSubview(emailTextFiled)
        self.stack.addArrangedSubview(passwordTextFiled)
        
        //MARK: step 3
        NSLayoutConstraint.activate([
            //***
            self.titlelbl.topAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.topAnchor, constant: 250),
            self.titlelbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            

            //***
            self.stack.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.stack.topAnchor.constraint(equalTo: self.titlelbl.bottomAnchor, constant: 20),
            self.stack.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -100),

            //singInBtn btn
            self.singInBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.singInBtn.topAnchor.constraint(equalTo: self.stack.bottomAnchor, constant: 20),
            self.singInBtn.heightAnchor.constraint(equalToConstant: 50),
            //frame
            self.singInBtn.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.2),
            
            //signUpBtn BTN
            self.signUpBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.signUpBtn.topAnchor.constraint(equalTo: self.singInBtn.bottomAnchor, constant: 5),
            self.signUpBtn.heightAnchor.constraint(equalToConstant: 30),
            self.signUpBtn.widthAnchor.constraint(equalToConstant: self.view.frame.width),
        ])
        
    }
    
    @objc func didPresssignUpButton(_ sender: UIButton){
        let vc = R1()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    
    }
    @objc func PresssignUpButton(_ sender: UIButton){
        let vc = TabVC()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
}
    
    @objc private func tapToSignIn() {
        let email = self.emailTextFiled.textFiled.text ?? ""
        let password = self.passwordTextFiled.textFiled.text ?? ""
        
        if email.isEmpty || password.isEmpty {
            return self.alertUserLoginError()
        }
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                print(error as Any)
                return
            }
            if email == "securityagency@moi.gov.sa"  {
            let vc = UINavigationController(rootViewController: ContainerViewController())
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            } else if email == "hotel@hotel.com" {
                let vc = UINavigationController(rootViewController: ContainerViewController())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            } else {
                let vc = UINavigationController(rootViewController: SOSNumbers())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
        }
    }
    func alertUserLoginError() {
        let alert = UIAlertController(title: "Woops",
         message: "Please enter your emile.",
                                preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Dismiss",
                                      style: .cancel, handler: nil))
        present(alert, animated: true)
    
}
}

