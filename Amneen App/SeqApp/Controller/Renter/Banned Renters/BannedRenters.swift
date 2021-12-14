//
//  BannedRenters.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 07/05/1443 AH.
//
//
import UIKit

class BannedRenters: UIViewController {
 
    var banned: Array<Report> = []
   
    private var bannedCV: UICollectionView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("71", comment:" مستأجرين تم منعهم")
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 340,
                                 height: 150)
        bannedCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        guard let bannedCV = bannedCV else {
            return
        }
        
        bannedCV.register(CellB.self, forCellWithReuseIdentifier: "cell")
        bannedCV.dataSource = self
        bannedCV.delegate = self
            bannedCV.backgroundColor = #colorLiteral(red: 0.8992940602, green: 0.8936767668, blue: 0.8912667796, alpha: 1)
        view.addSubview(bannedCV)
        bannedCV.frame = view.bounds
        
        ReportService.shared.listenToReport { newRenter in
            self.banned = newRenter
            self.bannedCV!.reloadData()
        }
    }
    
}
var selectedIndee = -1
extension BannedRenters: UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 370, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return banned.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellB
        
        let renter = banned[indexPath.row]
        cell.label2.text = "  لقد تم منع  \(renter.name)  من دخول الفندق "
        cell.label3.text = " الذي يحمل رقم الهويه \(renter.id)"
        cell.label4.text = "في \(renter.getNiceDate())     "
        cell.label5.text = "بسبب وجوده في القائمه السوداء"

        return cell
    }

   
}


class CellB: UICollectionViewCell {
    
    static let identifire = "Cell"

 public let label2: UILabel = {
      let label = UILabel()
      label.font = UIFont.systemFont(ofSize: 19, weight: .regular)
     label.textColor = .black
     label.textAlignment = .right
     label.font = UIFont(name: "Avenir-Light", size: 19)
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
        label.font = UIFont(name: "Avenir-Light", size: 17)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 250
        label.sizeToFit()
         return label
       }()
    
    public let label5: UILabel = {
         let label = UILabel()
         label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
         label.textColor = .black
        label.font = UIFont(name: "Avenir-Light", size: 17)
        label.textAlignment = .right
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.frame.size.width = 250
        label.sizeToFit()
         return label
       }()
 
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.clipsToBounds = true
        contentView.clipsToBounds = true
    
//        contentView.backgroundColor = #colorLiteral(red: 0.6864822151, green: 0.8622206013, blue: 1, alpha: 1)
        contentView.layer.cornerRadius = 13
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(label5)
        contentView.backgroundColor = #colorLiteral(red: 0.6803148389, green: 0.7489489913, blue: 0.7700426579, alpha: 1)
       
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

//left right
        label2.frame = CGRect(x: 33,
                              y: -35,
                              width: 300,
                              height: contentView.frame.size.height-30)
    
        label3.frame = CGRect(x: 40,
                              y: 17,
                              width: 300,
                              height: contentView.frame.size.height-30)
        label4.frame = CGRect(x: -167,
                              y: 58,
                              width: 500,
                              height: contentView.frame.size.height-30)
        
        label5.frame = CGRect(x: -167,
                              y: 83,
                              width: 500,
                              height: contentView.frame.size.height-30)
    }

}



    

