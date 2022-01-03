//
//  NewHotel1.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 24/05/1443 AH.
//
import UIKit
import FirebaseFirestore

class NewHotel1: UIViewController, UITextFieldDelegate {
    
    
    lazy var studentNameTF: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = NSLocalizedString("38", comment:"ادخل اسم المستأجر")
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
        b.setTitle(NSLocalizedString("40", comment:"إضافه"), for: .normal)
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 27.0)
        b.layer.cornerRadius = 25
        b.backgroundColor = UIColor(red: (87/255), green: (107/255), blue: (96/255), alpha: 1)
        return b
    }()
    
    public let LabelN: UILabel = {
        let label = UILabel()
        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = UIColor(named: "Color2")
        label.text = NSLocalizedString("41", comment:"اسم المستأجر:")
        label.textAlignment = .right
        
        return label
    }()

    @objc  func callNumber() {
        
        if let url = URL(string: "tel://\(999)") {
            UIApplication.shared.openURL(url)
        }
        
    }
    
    
    @objc func add() {
        let name = studentNameTF.text ?? ""
//        let id = studentNameTF2.text ?? ""
//        let date = datePicker.date
        let uuid = UUID().uuidString
        
        
        HotelService1.shared.addH(
            hostels: Hotel1(name: name, id: uuid)
        )
        
        
                dismiss(animated: true, completion: nil)
    }
    
    
   
    
    private func setupGradientView() {
        let _ = GradientView(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupGradientView()
        
        view.addSubview(LabelN)
      
        view.backgroundColor = UIColor(named: "Color")
        view.addSubview(addButton)
        view.addSubview(studentNameTF)
        
        
        LabelN.frame = CGRect(x: 290,
                              y: 70,
                              width: 110,
                              height:130)
        
      
        NSLayoutConstraint.activate([
            studentNameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            studentNameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            studentNameTF.heightAnchor.constraint(equalToConstant: 48),
            studentNameTF.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -48)
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
