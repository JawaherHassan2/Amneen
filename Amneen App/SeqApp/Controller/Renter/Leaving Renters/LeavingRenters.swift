//
//  LeavingRenters.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 07/05/1443 AH.
//


import UIKit
var leaving: Array<LeavingRenter> = []
class LeavingRenters: UIViewController {
 
    var leaving: Array<LeavingRenter> = []
   
    private var leavCV: UICollectionView?
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = NSLocalizedString("69", comment:"المستأجرين المغادرين ")
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 340,
                                 height: 150)
        leavCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        guard let leavCV = leavCV else {
            return
        }
        
        leavCV.register(CellL.self, forCellWithReuseIdentifier: "cell")
        leavCV.dataSource = self
        leavCV.delegate = self
        view.addSubview(leavCV)
        leavCV.frame = view.bounds
        
        LeavingService.shared.listenToLeaving { newRenter in
            self.leaving = newRenter
            self.leavCV!.reloadData()
        }
    }
    
}
var selectedIndexx = -1
extension LeavingRenters: UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           return CGSize(width: 370, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return leaving.count
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CellL
        
        let renter = leaving[indexPath.row]
        cell.label2.text = "تم مغادره المستأجر    \(renter.name)"
        cell.label3.text = " الذي يحمل رقم الهويه \(renter.id)"
        cell.label4.text = "  حيث استأجر في:\(renter.getNiceDate())     "
        cell.label5.text = "وغادر في:   \(renter.getNiceDate1()  )"

        return cell
    }

   
}


class CellL: UICollectionViewCell {
    
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
    
      
        contentView.layer.cornerRadius = 13
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(label5)
        contentView.backgroundColor = #colorLiteral(red: 0.6123598444, green: 0.7686617946, blue: 0.685389577, alpha: 1)
       
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



    

