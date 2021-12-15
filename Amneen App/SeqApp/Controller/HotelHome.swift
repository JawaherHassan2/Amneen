//
//  HotelHome.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 08/05/1443 AH.
//




import Foundation
import UIKit
import ShimmerSwift
protocol HomeHViewControllerDelegate: AnyObject {
    
    func didTapMenuButton()
}

class HotelHome: UIViewController {
   
    weak var delegate: HomeHViewControllerDelegate?

    let shimmerView = ShimmeringView(frame: CGRect(x: 75, y: 520, width: 450, height: 450))
    let Image1: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius =
//        imageView.frame =  shimmerView2.bounds
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "g1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
        
        view.backgroundColor = .white

        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.04864486824, green: 0.3906074293, blue: 0.3516095239, alpha: 1)
        
        
        shimmerView.isShimmering = true
        self.view.addSubview(shimmerView)
        shimmerView.contentView = Image1
//
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTapMenuButton))
       title = NSLocalizedString("31", comment:"الصفحه الرئيسية")
        
        
        shimmerView.translatesAutoresizingMaskIntoConstraints = false
        shimmerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        shimmerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        shimmerView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        shimmerView.widthAnchor.constraint(equalToConstant: 500).isActive = true
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

