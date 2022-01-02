//
//  Cities.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 18/04/1443 AH.
import UIKit
//
class Cities: UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    private var hotelCV: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 200, height: 90)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = NSLocalizedString("33", comment:"الفنادق")
        view.backgroundColor = UIColor(named: "Color")
        
        //        navigationItem.title = "الفنادق"
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 14
        layout.minimumInteritemSpacing = 1
        
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(HotelCell.self, forCellWithReuseIdentifier: HotelCell.identifier)
        hotelCV.dataSource = self
        hotelCV.delegate = self
        //        hotelCV.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
        hotelCV.backgroundColor = UIColor(named: "Color")
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds
        hotelCV.backgroundColor = #colorLiteral(red: 0.8992940602, green: 0.8936767668, blue: 0.8912667796, alpha: 1)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return hotelList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCell.identifier, for: indexPath) as! HotelCell
        cell.layer.cornerRadius = 22
        cell.myLabel.text = hotelList[indexPath.row].name
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4.0
        cell.clipsToBounds = false
        cell.layer.masksToBounds = false
        
        return cell
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        var newVC = Hotels()
        newVC.title = hotelList[indexPath.row].name
        newVC.h = hotelList[indexPath.row]
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
        
    }
    
    
}

class HotelCell: UICollectionViewCell {
    
    static let identifier = "cell"
    
    let myImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        return imageView
        
    }()
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir-Light", size: 27.0)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2.0)
        layer.shadowRadius = 6.0
        layer.shadowOpacity = 1.0
        contentView.backgroundColor = #colorLiteral(red: 0.3255151016, green: 0.4531929313, blue: 0.4515190841, alpha: 1)
        contentView.layer.cornerRadius = 34
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myImage.frame = CGRect(x: 1,
                               y: 3 ,
                               width: 200,
                               height: 120)
        
        
        //يمين او يسار X
        myLabel.frame = CGRect(x: 6,
                               //يرتفع او ينزل y
                               y: contentView.frame.size.height-60 ,
                               //العرض
                               width: contentView.frame.size.width-10,
                               //الطول
                               height: 50)
        
        
    }
    
}
