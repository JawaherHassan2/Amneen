//
//  AddNewC.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.

import UIKit

class AddNewC: UIViewController, UITextFieldDelegate {
    
    lazy var studentNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "ادخل الاسم"
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var studentNameTF2: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "ادخل رقم الهويه الوطنيه"
        tf.backgroundColor = .white
        tf.textAlignment = .right
        tf.delegate = self
        tf.layer.cornerRadius = 20
        return tf
    }()
    
    lazy var addButton: UIButton = {
            let b = UIButton()
            b.addTarget(self, action: #selector(add), for: .touchUpInside)
            b.translatesAutoresizingMaskIntoConstraints = false
            b.setTitle("إضافه", for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
            b.layer.cornerRadius = 25

        b.backgroundColor = UIColor(red: (87/255), green: (107/255), blue: (96/255), alpha: 1)
            return b
        }()
    
    @objc func add() {
        
        
        let name = studentNameTF.text ?? ""
              let id = studentNameTF2.text ?? ""
      
      
              CriminalService.shared.addC(
                criminals: TPeople(name: name, id: id)
              )
    }
    private func setupGradientView() {
        let _ = GradientView(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
       
        view.backgroundColor = UIColor(red: (206/255), green: (222/255), blue: (211/255), alpha: 1) 
        view.addSubview(addButton)
        view.addSubview(studentNameTF)
        NSLayoutConstraint.activate([
            studentNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 90),
            studentNameTF.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
        view.addSubview(studentNameTF2)
        NSLayoutConstraint.activate([
            studentNameTF2.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            studentNameTF2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF2.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF2.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
        ])
        NSLayoutConstraint.activate([
            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -300),
            addButton.widthAnchor.constraint(equalToConstant: 400),
            addButton.heightAnchor.constraint(equalToConstant: 60),
        ])

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        

        
        dismiss(animated: true, completion: nil)
        return true
    }
    
}
