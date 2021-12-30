//
//  SOSNumbers.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 24/04/1443 AH.
//


import Foundation
import UIKit


protocol SNumbers : class {
    
}

class SOSNumbers: UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    
    
    private var hCV: UICollectionView?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 395, height: 90)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.title = NSLocalizedString("90", comment:"ارقام الطوارئ")
        
        title =  NSLocalizedString("32", comment:"ارقام تهمك")
        //        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.dash"), style: .done, target: self, action: #selector(didTab))
        //        navigationController?.title = "lllist"
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 340,
                                 height: 150)
        hCV = UICollectionView(frame: .zero,
                               collectionViewLayout: layout)
        
        
        guard let hCV = hCV else {
            return
        }
        
        hCV.register(Cell.self, forCellWithReuseIdentifier: "Cell")
        //        hCV.backgroundColor = #colorLiteral(red: 0.3015365687, green: 0.2941023976, blue: 0.3276381059, alpha: 1)
        hCV.backgroundColor = UIColor(named: "Color")
        
        
        
        hCV.dataSource = self
        hCV.delegate = self
        
        
        view.addSubview(hCV)
        hCV.frame = view.bounds
        
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listNumber.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! Cell
        
        
        
        let criminal = listNumber[indexPath.row]
        
        
        cell.label2.text = "  \(criminal.name)"
        cell.label3.text = "   \(criminal.number) "
        cell.label4.text = "  \(criminal.purpose) "
        cell.Image.image = UIImage(named: criminal.image)
        
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4.0
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let num = listNumber[indexPath.row]
        
        if indexPath.row == 0 {
            
            if let url = URL(string: "tel://\(999)") {
                UIApplication.shared.openURL(url)
            }
        }else if indexPath.row == 1 {
            
            if let url = URL(string: "tel://\(995)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 2 {
            
            if let url = URL(string: "tel://\(998)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 3 {
            
            if let url = URL(string: "tel://\(997)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 4 {
            
            if let url = URL(string: "tel://\(994)") {
                UIApplication.shared.openURL(url)
            }
            
        } else if indexPath.row == 5 {
            
            if let url = URL(string: "tel://\(92000560)") {
                UIApplication.shared.openURL(url)
            }
            
            
        } else if indexPath.row == 6 {
            
            if let url = URL(string: "tel://\(993)") {
                UIApplication.shared.openURL(url)
            }
        } else if indexPath.row == 7 {
            
            if let url = URL(string: "tel://\(112)") {
                UIApplication.shared.openURL(url)
            }
        }  else if indexPath.row == 8 {
            
            if let url = URL(string: "tel://\(996)") {
                UIApplication.shared.openURL(url)
            }
        }   else if indexPath.row == 9 {
            
            if let url = URL(string: "tel://\(991)") {
                UIApplication.shared.openURL(url)
            }
        }
        
        
        
    }
}

class Cell: UICollectionViewCell {
    
    static let identifire = "Cell"
    
    public let label2: UILabel = {
        let label = UILabel()
        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = UIFont(name: "Avenir-Light", size: 20)
        label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        
        label.textAlignment = .right
        
        return label
    }()
    
    public let label3: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text
        label.font = UIFont(name: "Avenir-Light", size: 19)
        label.textColor = #colorLiteral(red: 0.793621466, green: 0.1623592303, blue: 0.08043256966, alpha: 1)
        return label
    }()
    
    public let label4: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 15)
        label.textColor = .gray
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 250
        label.sizeToFit()
        return label
    }()
    
    let Image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let StackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill // .leading .firstBaseline .center .trailing .lastBaseline
        stackView.distribution = .fill // .fillEqually .fillProportionally .equalSpacing .equalCentering
        
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.image = UIImage(systemName: "phone.fill")
        imageView.tintColor =  #colorLiteral(red: 0.2585300233, green: 0.5443104234, blue: 0.1161680287, alpha: 1)
        stackView.addArrangedSubview(imageView)
        
        
        return stackView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(Image)
        contentView.addSubview(StackView)
        contentView.layer.cornerRadius = 45
        contentView.backgroundColor = .white
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //left right
        label2.frame = CGRect(x: -1,
                              y: -8,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        
        label3.frame = CGRect(x: -15,
                              y: 16,
                              width: 300,
                              height: contentView.frame.size.height-30)
        label4.frame = CGRect(x: 1,
                              y: 38,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        Image.frame = CGRect(x: 310,
                             y: 10,
                             width: 75,
                             height: 75)
        
        StackView.frame = CGRect(x: 18,
                                 y: 28,
                                 width: 35,
                                 height: 35)
        
        
    }
    
}

