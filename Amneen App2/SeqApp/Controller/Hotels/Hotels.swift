//
//  HotelsCity.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 18/04/1443 AH.

import Foundation
import UIKit


class Hotels: UIViewController, UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    var h: City?
    
    private var hotelCV: UICollectionView?
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 70)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 20
        layout.itemSize = CGSize(width: 280,
                                 height: 100)
        hotelCV = UICollectionView(frame: .zero,
                                   collectionViewLayout: layout)
        
        
        guard let hotelCV = hotelCV else {
            return
        }
        
        hotelCV.register(HotelCell1.self, forCellWithReuseIdentifier: HotelCell.identifier)
        hotelCV.backgroundColor = UIColor(named: "Color")
        
        hotelCV.dataSource = self
        hotelCV.delegate = self
        hotelCV.backgroundColor = #colorLiteral(red: 0.8992940602, green: 0.8936767668, blue: 0.8912667796, alpha: 1)
        
        view.addSubview(hotelCV)
        hotelCV.frame = view.bounds
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return h?.Hotels.count ?? 0
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HotelCell1.identifier, for: indexPath) as! HotelCell1
        
        
        
        
        let hotels = h!.Hotels[indexPath.item]
        
        cell.myLabel.text = hotels.name
        
        cell.layer.shadowColor = #colorLiteral(red: 0.7152663793, green: 0.7774887856, blue: 0.764106984, alpha: 1)
        cell.layer.shadowOffset = CGSize(width: 0, height: 2)
        cell.layer.shadowOpacity = 1
        cell.layer.shadowRadius = 4.0
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let newVC = Renters()
        
        newVC.title = h?.Hotels[indexPath.row].name
        newVC.r = h?.Hotels[indexPath.row]
        newVC.a = hotelList[indexPath.row]
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
        
    }
}

class HotelCell1: UICollectionViewCell {
    
    static let identifier = "cell"
    
    
    let myLabel: UILabel = {
        let label = UILabel()
        label.text = "آبها"
        label.font = UIFont(name: "Avenir-Light", size: 25.0)
        label.textColor = #colorLiteral(red: 0.7820800306, green: 0.849202474, blue: 0.8412316655, alpha: 1)
        label.textAlignment = .center
        return label
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myLabel)
        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 0.357890688, green: 0.4412518331, blue: 0.4643064771, alpha: 1)
        contentView.layer.cornerRadius = 15
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: has not implement>>>")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myLabel.frame = CGRect(x: 0,
                               y: contentView.frame.size.height-70 ,
                               width: contentView.frame.size.width-10,
                               height: 50)
    }
}

