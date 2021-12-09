//
//  LogIn.swift
//  
//
//  Created by Jawaher🌻 on 05/05/1443 AH.
//


import UIKit
import Firebase
import AVFoundation
import FirebaseFirestore
import FirebaseAuth


class LoginVC: UIViewController {
    
    
    
//    var name = UITextField()
    var conf = UITextField()
    let segmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
//
//        name.placeholder = "Name"
//        name.textAlignment = .center
//        name.translatesAutoresizingMaskIntoConstraints = false
//        name.textColor = .black
//        name.font = UIFont.systemFont(ofSize: 18)
//        name.backgroundColor = .systemGray5
//        name.layer.cornerRadius = 8
        
        
        conf.placeholder = "Conf Password"
        conf.textAlignment = .center
        conf.translatesAutoresizingMaskIntoConstraints = false
        conf.textColor = .black
        conf.font = UIFont.systemFont(ofSize: 18)
        conf.backgroundColor = .systemGray5
        conf.layer.cornerRadius = 8
     
    }
    
   
    var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let email : UITextField = {
        $0.placeholder = "email"
        //$0.text = "mssomf@hotmail.com"
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 8
        return $0
    }(UITextField())
    
    
    
    let password : UITextField = {
        $0.placeholder = "password"
       // $0.text = "123456"
        $0.isSecureTextEntry = true
        $0.textAlignment = .center
        $0.backgroundColor = .init(white: 0.90, alpha: 1)
        $0.layer.cornerRadius = 8
        return $0
    }(UITextField())
    
    
    let logInButton : UIButton = {
        $0.setTitle("LogIn", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 15
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(login), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    let signUp : UIButton = {
        $0.setTitle("Sign Up", for: .normal)
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 22)
        $0.backgroundColor = .systemRed
        $0.layer.cornerRadius = 15
        $0.tintColor = .white
        $0.addTarget(self, action: #selector(SignupVC), for: .touchUpInside)
        return $0
    }(UIButton(type: .system))
    
    
    let stackView : UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 10
        return $0
    }(UIStackView())
    
    
    @objc func login() {
        
        let email = email.text ?? ""
        let password = password.text ?? ""
        
        
        if email.isEmpty ||  password.isEmpty {
            print("Faild login ")
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) {result,error in
            
            
            if email == "user@gmail.com"  {
                
            let vc = UINavigationController(rootViewController: TabVC())
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
                
                
                
            } else if email == "Security@gmail.com" {
                let vc = UINavigationController(rootViewController: ContainerViewController())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }

        
        }
        
    }
    
        
    
    @objc func SignupVC(_ sender: Any) {
       
        let email = email.text ?? ""
        let password = password.text ?? ""
        
        
        if email.isEmpty ||  password.isEmpty {
            print("Faild login ")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) {result,error in
            
            if email == "Security@gmail.com" {
            let vc = UINavigationController(rootViewController: ContainerViewController())
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
                
            } else if email == "user@gmail.com" {
                let vc = UINavigationController(rootViewController: SOSNumbers())
                vc.modalTransitionStyle = .crossDissolve
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }

                guard let currentUserID = Auth.auth().currentUser?.uid else {return}
                Firestore.firestore().document("users/\(currentUserID)").setData([
//                    "name" : self.name.text,
                    "id" : currentUserID,
                    "email" : self.email.text,
                   
                ], merge : true)
            }
        }
        
    }
    


extension LoginVC {
    
    func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(segmentedControl)
//        stackView.addArrangedSubview(name)
        stackView.addArrangedSubview(email)
        stackView.addArrangedSubview(password)
        stackView.addArrangedSubview(conf)
        stackView.addArrangedSubview(logInButton)
        stackView.addArrangedSubview(signUp)
        
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor,constant: 90),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 90),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
        ])
        
        
        segmentedControl.insertSegment(withTitle: "Rigester", at: 0, animated: true)
        segmentedControl.setTitle("Rigester", forSegmentAt: 0)
        segmentedControl.insertSegment(withTitle: "Login", at: 1, animated: true)
        segmentedControl.setTitle("Login", forSegmentAt: 1)
        segmentedControl.addTarget(self, action: #selector(Segment), for: .valueChanged)
        
        
                NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 250),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.heightAnchor.constraint(equalToConstant: 270)
        ])
        
        
    }
    @objc func Segment(_ sender: Any) {
        
        switch segmentedControl.selectedSegmentIndex {
        case 0:
//            name.isHidden = false
            conf.isHidden = false
            signUp.isHidden = false
            logInButton.isHidden = true
        case 1:
//            name.isHidden = true
            conf.isHidden = true
            signUp.isHidden = true
            logInButton.isHidden = false
        default:
            break;
        }
    }
}

