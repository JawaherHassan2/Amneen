//
//  RenterInfo.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 21/04/1443 AH.
//

import Foundation
import UIKit

class RenterInfo: UIViewController {
   
    var r: Renter?
    var h: Hotel?
    
  lazy var Label1: UILabel = {
        let label = UILabel()
      label.textAlignment = .center
        label.textColor = .black
      label.font = UIFont(name: "Avenir-Light", size: 25)
      label.numberOfLines = 10
      label.preferredMaxLayoutWidth = 700
      label.sizeToFit()
        return label
    }()
    lazy var Label2: UILabel = {
          let label = UILabel()
        label.textAlignment = .right
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    lazy var Label3: UILabel = {
          let label = UILabel()
        label.textAlignment = .left
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    lazy var Label4: UILabel = {
          let label = UILabel()
        label.textAlignment = .left
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.textAlignment = .right
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    lazy var Label5: UILabel = {
          let label = UILabel()
        label.textAlignment = .left
          label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 25)
        label.numberOfLines = 10
        label.preferredMaxLayoutWidth = 700
        label.sizeToFit()
          return label
      }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "معلومات المستأجر"
        view.addSubview(Label1)
        view.addSubview(Label2)
        view.addSubview(Label3)
        view.addSubview(Label4)
        view.addSubview(Label5)

        
        
        Label1.text = "  اسم المستأجر:   \(r!.name) "
        Label2.text = " الهويه الوطنيه:  \(r!.id)"
        Label3.text = "\(r!.getNiceDate())   :وقت الدخول"
//        Label4.text = " اسم الفندق:  \(h?.name)"
//        Label5.text = "رقم الشقه:  \(indexPath.row + 1)"
        
       
        
        view.backgroundColor = #colorLiteral(red: 0.9397228853, green: 0.9187412842, blue: 0.8807310973, alpha: 1)
        

        Label1.frame = CGRect(x: 120,
                              y: 140,
                              width: 300,
                              height: 100)
        
        
        Label2.frame = CGRect(x: 120,
                              y: 190,
                              width: 300,
                              height: 100)
        Label3.frame = CGRect(x: 120,
                              y: 230,
                              width: 400,
                              height: 100)
        Label4.frame = CGRect(x: 100,
                              y: 270,
                              width: 400,
                              height: 100)
        Label5.frame = CGRect(x: 100,
                              y: 270,
                              width: 400,
                              height: 100)

               

       
        
    }
    
    
    
    
}
