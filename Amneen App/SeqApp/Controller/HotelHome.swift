//
//  HotelHome.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 08/05/1443 AH.
//




import Foundation
import UIKit

protocol HomeHViewControllerDelegate: AnyObject {
    
    func didTapMenuButton()
}

class HotelHome: UIViewController {
   
    weak var delegate: HomeHViewControllerDelegate?

    
    public let label33: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
//        label.text = Loc.l1
        label.text =  NSLocalizedString("1", comment: "ن")
        label.font = UIFont(name: "Avenir-Light", size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        return label
    }()
    let Image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius =
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "imag")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

//        let switchDemo = UISwitch(frame:CGRect(x: 80, y: 400, width: 100, height: 100))
//        switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
//        switchDemo.setOn(true, animated: false)
//        self.view.addSubview(switchDemo)
//
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
       title = NSLocalizedString("31", comment:"الصفحه الرئيسية")
        
        
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
//        view.addSubview(label33)
//        view.addSubview(Image)
//        NSLayoutConstraint.activate([
//            Image.topAnchor.constraint(equalTo: view.topAnchor),
//            Image.leftAnchor.constraint(equalTo: view.leftAnchor),
//            Image.rightAnchor.constraint(equalTo: view.rightAnchor),
//            Image.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//
//        ])
    }
    @objc func goToCitiesVC() {
        var newVC = Cities()
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
    }
    @objc func goToListVC() {
        var newVC = List()
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
    }
    
    
    @objc func didTapMenuButton() {
        delegate?.didTapMenuButton()
        
    }
    
    @objc func switchStateDidChange (_ sender: UISwitch) {
        if #available(i0S 13.0, *) {
           let appDelegate = UIApplication.shared.windows.first
            let vc = Home()
           if sender.isOn {
             appDelegate?.backgroundColor = .black
//             view.backgroundColor = .gray
             return
           }
//            vc.view.backgroundColor = .red
          appDelegate?.backgroundColor = .white
           return
         } else {
      }
       }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
     
    
 

}

