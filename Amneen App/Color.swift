//
//  Color.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 06/05/1443 AH.
//


import UIKit
import Foundation

//enum or stract


enum colors {
    static let button = UIColor(red:0.58, green:0.26, blue:0.25, alpha:1.0)
    static let bcolor = UIColor(red: (196/255), green: (24/255), blue: (24/255), alpha: 1)
    
    
    static let backgroundDarckcolor = UIColor(red: (76/255), green: (133/255), blue: (104/255), alpha: 1)
    static let backgroundLightcolor = UIColor(red: (143/255), green: (204/255), blue: (173/255), alpha: 1)
    static let textFieldsBorder = UIColor(red:0.80, green:0.80, blue:0.80, alpha:1.0)
    static let textFieldsBackground = UIColor(red:1.00, green:1.00, blue:1.00, alpha:0.1)
    static let titlesColor = UIColor(red:0.89, green:0.89, blue:0.89, alpha:1.0)
}

// Gradiant background


extension UIView {
    
    //  all these must be add in the extionsion ^
    
    func setGradiantView() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = [colors.backgroundLightcolor.cgColor, colors.backgroundDarckcolor.cgColor]
        layer.insertSublayer(gradientLayer, at: 0)
    }
}



// textfield icons :)

extension UIImageView {
    func iconsImageView (){
        self.contentMode = .scaleAspectFit
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

//all lbls
extension UILabel {
    func changeUILabel( title: String , size: CGFloat ){
        self.text = title
        self.textColor = colors.titlesColor
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = UIFont(name: "Futura", size: size)
        
        
}
}

extension UIButton {
    func changeUIButton (title : String , color : UIColor){
        self.setTitle(title, for: .normal)
        self.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
        self.backgroundColor = color
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 25
        self.setTitleColor(colors.titlesColor, for: .normal)
  
    }
    
  
}
