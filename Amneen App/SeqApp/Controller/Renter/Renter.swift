//
//  People.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
//

import Foundation
import UIKit


class Renters: UIViewController {
    var r: Hotel?
    var a: City?
    
    var renters: Array<Renter> = []
   
    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200,height: 20))

   
    private var hotelCV: UICollectionView?
    lazy var addRentersButton: UIButton = {
            let b = UIButton()
            b.addTarget(self, action: #selector(addRenter), for: .touchUpInside)
            b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle(NSLocalizedString("37", comment: "  مستأجر جديد"), for: .normal)
            b.layer.cornerRadius = 25
            b.titleLabel?.textColor = .white
            b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
            b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
            return b
        }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
          self.navigationItem.rightBarButtonItem = leftNavBarButton
       searchBar.searchBarStyle = UISearchBar.Style.default
       searchBar.placeholder = "بحث"
       searchBar.sizeToFit()
       searchBar.isTranslucent = false
       searchBar.delegate = self
       view.addSubview(searchBar)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 320,
                                 height: 150)
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(RenterCell.self, forCellWithReuseIdentifier: "cell")
        hotelCV.dataSource = self
        hotelCV.delegate = self
//        hotelCV.backgroundColor = #colorLiteral(red: 0.6236509499, green: 0.6758033248, blue: 0.6325487966, alpha: 1)
        hotelCV.backgroundColor = UIColor(named: "Color")
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds
        hotelCV.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        
        RenterService.shared.listenToRenters { newRenter in
            self.renters = newRenter
            self.hotelCV!.reloadData()
        }
        
        view.addSubview(searchBar)
        NSLayoutConstraint.activate([
            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        view.addSubview(addRentersButton)
               NSLayoutConstraint.activate([
                addRentersButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
                addRentersButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
                addRentersButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
                addRentersButton.widthAnchor.constraint(equalToConstant: 400),
                addRentersButton.heightAnchor.constraint(equalToConstant: 60),
               ])
    }
    
    @objc func addRenter() {
        let newVC = NewRenter()
        present(newVC, animated: true, completion: nil)
    }
}
var selectedIndex = -1
extension Renters: UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 350, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return renters.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RenterCell
        
        let renter = renters[indexPath.row]
            
            
//        let d =  hotelList[indexPath.row]
        cell.label2.text = "      الاسم:\(renter.name)"
//        cell.label2.text = "\(d.name)    اسم المدينه:"
        cell.label3.text = " الهويه الوطنيه:  \(renter.id)"
        cell.label4.text = "\(renter.getNiceDate())   :وقت الدخول"
        cell.label5.text = " اسم الفندق:  \(r!.name)"
        cell.label6.text = "رقم الشقه:  \(indexPath.row + 1)"
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
        let r = renters[indexPath.row]
        let newVC = RenterInfo()
        newVC.r = r
        navigationController?.pushViewController(newVC,animated: true)
    }

    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchText.isEmpty {
                
                let temp = renters
                renters = temp
                
                RenterService.shared.listenToRenters { newRenter in
                    self.renters = newRenter
                    self.hotelCV!.reloadData()
                }
               
            } else {
                
                renters = renters.filter({ oneProduct in
                    return oneProduct.name.starts(with: searchText)
                })
            }
        hotelCV?.reloadData()
            
        }
}

func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()
    
}

class RenterCell: UICollectionViewCell {
    
    static let identifire = "Cell"
    
    public let label2: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 20)
        return label
    }()
    
    public let label3: UILabel = {
         let label = UILabel()

         label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 18)
         return label
       }()
    
    public let label4: UILabel = {
         let label = UILabel()
   
         label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
         label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 18)
        label.textAlignment = .right
         return label
       }()
    public let label5: UILabel = {
         let label = UILabel()

         label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
         label.textColor = .black
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 18)
         return label
       }()
    public let label6: UILabel = {
         let label = UILabel()
         label.text = "a"
        label.textAlignment = .right
         label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
         label.textColor = .black

        label.font = UIFont(name: "Avenir-Light", size: 18)
         return label
        
       }()
    
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
            contentView.clipsToBounds = true
            contentView.backgroundColor = #colorLiteral(red: 1, green: 0.9926941103, blue: 0.9993625388, alpha: 1)
            contentView.layer.cornerRadius = 13
         
  
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(label5)
        contentView.addSubview(label6)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

//left right
        label2.frame = CGRect(x: 18,
                              y: -40,
                              width: 300,
                              height: contentView.frame.size.height-30)
    
    
        label3.frame = CGRect(x: 40,
                              y: 10,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        
        label6.frame = CGRect(x: 30,
                              y: 60,
                              width: 300,
                              height: contentView.frame.size.height-30)
      
      
        label4.frame = CGRect(x:  -168,
                              y: 90,
                              width: 500,
                              height: contentView.frame.size.height-30)
        label5.frame = CGRect(x: -165,
                              y: 40,
                              width: 500,
                              height: contentView.frame.size.height-30)
        

    }

}



    
