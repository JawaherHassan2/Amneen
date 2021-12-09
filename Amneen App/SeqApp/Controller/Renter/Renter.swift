//
//  People.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
//
//import Foundation
//import UIKit
//
//var renters: Array<Renter> = []
//var c: Renter?
//class Renters: UIViewController {
//    var r: Hotel?
//    var a: City?
//
//
//    var renters: Array<Renter> = []
//
//    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200,height: 20))
//
//
//    private var hotelCV: UICollectionView?
//    lazy var addRentersButton: UIButton = {
//        let b = UIButton()
//        b.addTarget(self, action: #selector(addRenter), for: .touchUpInside)
//        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle(NSLocalizedString("37", comment: "  مستأجر جديد"), for: .normal)
//        b.layer.cornerRadius = 25
//        b.titleLabel?.textColor = .white
//        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
//        b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
//        return b
//    }()
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
//        self.navigationItem.rightBarButtonItem = leftNavBarButton
//        searchBar.searchBarStyle = UISearchBar.Style.default
//        searchBar.placeholder = "بحث"
//        searchBar.sizeToFit()
//        searchBar.isTranslucent = false
//        searchBar.delegate = self
//        view.addSubview(searchBar)
//
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .vertical
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
//        layout.itemSize = CGSize(width: 320,
//                                 height: 150)
//        hotelCV = UICollectionView(frame: .zero,
//                                   collectionViewLayout: layout)
//
//        guard let hotelCV = hotelCV else {
//            return
//        }
//
//        hotelCV.register(RenterCell.self, forCellWithReuseIdentifier: "cell")
//        hotelCV.dataSource = self
//        hotelCV.delegate = self
//        //        hotelCV.backgroundColor = #colorLiteral(red: 0.6236509499, green: 0.6758033248, blue: 0.6325487966, alpha: 1)
//        hotelCV.backgroundColor = UIColor(named: "Color")
//        view.addSubview(hotelCV)
//        hotelCV.frame = view.bounds
//        hotelCV.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
//
//        RenterService.shared.listenToRenters { newRenter in
//            self.renters = newRenter
//            self.hotelCV!.reloadData()
//        }
//
//        view.addSubview(searchBar)
//        NSLayoutConstraint.activate([
//            searchBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            searchBar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//        ])
//
//        view.addSubview(addRentersButton)
//        NSLayoutConstraint.activate([
//            addRentersButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -80),
//            addRentersButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 80),
//            addRentersButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
//            addRentersButton.widthAnchor.constraint(equalToConstant: 400),
//            addRentersButton.heightAnchor.constraint(equalToConstant: 60),
//        ])
//    }
//
//    @objc func addRenter() {
//        let newVC = NewRenter()
//        present(newVC, animated: true, completion: nil)
//    }
//}
//var selectedIndex = -1
//extension Renters: UICollectionViewDelegate  , UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate  {
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 350, height: 200)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return renters.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RenterCell
//
//        let renter = renters[indexPath.row]
//
//
//        //        let d =  hotelList[indexPath.row]
//        cell.label2.text = "      الاسم:\(renter.name)"
//        //        cell.label2.text = "\(d.name)    اسم المدينه:"
//        cell.label3.text = " الهويه الوطنيه:  \(renter.id)"
//        cell.label4.text = "\(renter.getNiceDate())   :وقت الدخول"
//        cell.label5.text = " اسم الفندق:  \(r!.name)"
//        cell.label6.text = "رقم الشقه:  \(indexPath.row + 1)"
//
////        cell.trailingSwipeActionsConfiguration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Delete", handler: { (_,_,
////        completion) in
////            print("J")
////            completion(true)
////        }), UIContextualAction(style: .normal, title: "JJ", handler: { (_,_, completion) in
////            completion(true)
////        })])
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//
//        let r = renters[indexPath.row]
//        let newVC = RenterInfo()
//        newVC.r = r
//        navigationController?.pushViewController(newVC,animated: true)
//    }
//
//
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchText.isEmpty {
//
//            let temp = renters
//            renters = temp
//
//            RenterService.shared.listenToRenters { newRenter in
//                self.renters = newRenter
//                self.hotelCV!.reloadData()
//            }
//
//        } else {
//
//            renters = renters.filter({ oneProduct in
//                return oneProduct.name.starts(with: searchText)
//            })
//        }
//        hotelCV?.reloadData()
//
//    }
//}
//
//func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//    searchBar.resignFirstResponder()
//
//}
//
//class RenterCell: UICollectionViewCell {
//
//    static let identifire = "Cell"
//
//    public let label2: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
//        label.textColor = .black
//        label.textAlignment = .right
//        label.font = UIFont(name: "Avenir-Light", size: 20)
//        return label
//    }()
//
//    public let label3: UILabel = {
//        let label = UILabel()
//
//        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .black
//        label.textAlignment = .right
//        label.font = UIFont(name: "Avenir-Light", size: 18)
//        return label
//    }()
//
//    public let label4: UILabel = {
//        let label = UILabel()
//
//        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir-Light", size: 18)
//        label.textAlignment = .right
//        return label
//    }()
//    public let label5: UILabel = {
//        let label = UILabel()
//
//        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .black
//        label.textAlignment = .right
//        label.font = UIFont(name: "Avenir-Light", size: 18)
//        return label
//    }()
//    public let label6: UILabel = {
//        let label = UILabel()
//        label.text = "a"
//        label.textAlignment = .right
//        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.textColor = .black
//        label.font = UIFont(name: "Avenir-Light", size: 18)
//        return label
//
//    }()
//    let deleteb: UIButton = {
//        let b = UIButton()
//        b.addTarget(self, action: #selector(deletR), for: .touchUpInside)
//        b.translatesAutoresizingMaskIntoConstraints = false
//        b.setTitle("حذف", for: .normal)
//        //        b.setImage(UIImage(named: "x"), for: .normal)
//        b.layer.cornerRadius = 25
//        b.setTitleColor(.red, for: .normal)
//        b.titleLabel?.textColor = .red
//        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
//        //        b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
//        return b
//    }()
////    let hostels: Renter!
//    @objc func deletR() {
//        print("delete...")
////        "١٠٩٩١١٢٢١٠"
////        RenterService.shared.hostelsCollection.document(c!.id ?? "\()" ).delete()
//
////        RenterService.shared.deletRe(
////            hostels: Renter(name: c!.name, id: c!.id,timestamp: c!.timestamp)
////              )
//    }
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//        contentView.clipsToBounds = true
//        contentView.backgroundColor = #colorLiteral(red: 1, green: 0.9926941103, blue: 0.9993625388, alpha: 1)
//        contentView.layer.cornerRadius = 13
//
//        contentView.addSubview(label2)
//        contentView.addSubview(label3)
//        contentView.addSubview(label4)
//        contentView.addSubview(label5)
//        contentView.addSubview(label6)
//        contentView.addSubview(deleteb)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        //left right
//        label2.frame = CGRect(x: 18,
//                              y: -40,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//
//
//        label3.frame = CGRect(x: 40,
//                              y: 10,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//
//
//        label6.frame = CGRect(x: 30,
//                              y: 60,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//
//
//        label4.frame = CGRect(x:  -168,
//                              y: 90,
//                              width: 500,
//                              height: contentView.frame.size.height-30)
//        label5.frame = CGRect(x: -165,
//                              y: 40,
//                              width: 500,
//                              height: contentView.frame.size.height-30)
//        deleteb.frame = CGRect(x: 2,
//                               y: 10,
//                               width: 100,
//                               height: 100)
//
//
//    }
//
//}
//
//

import Foundation
import UIKit
import FirebaseFirestore

var renters: Array<Renter> = []
var c: Renter?
class Renters: UIViewController {
    var r: Hotel?
    var a: City?


    var renters: Array<Renter> = []

    lazy   var searchBar:UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: 200,height: 20))


    lazy var sTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(RenterCell.self, forCellReuseIdentifier: "Cell")
        t.backgroundColor = .white
        return t
    }()
    
    
    
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

        view.addSubview(sTV)
               NSLayoutConstraint.activate([
                  sTV.topAnchor.constraint(equalTo: view.topAnchor),
                   sTV.leftAnchor.constraint(equalTo: view.leftAnchor),
                  sTV.rightAnchor.constraint(equalTo: view.rightAnchor),
                  sTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
               ])

        RenterService.shared.listenToRenters { newRenter in
            self.renters = newRenter
            self.sTV.reloadData()
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
extension Renters: UITableViewDelegate  , UITableViewDataSource, UISearchBarDelegate  {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 350, height: 200)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return renters.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RenterCell

        let renter = renters[indexPath.row]
        //        let d =  hotelList[indexPath.row]
        cell.label2.text = "      الاسم:\(renter.name)"
        //        cell.label2.text = "\(d.name)    اسم المدينه:"
        cell.label3.text = " الهويه الوطنيه:  \(renter.id)"
        cell.label4.text = "\(renter.getNiceDate())   :وقت الدخول"
        cell.label5.text = " اسم الفندق:  \(r!.name)"
        cell.label6.text = "رقم الشقه:  \(indexPath.row + 1)"
        cell.backgroundColor = .gray
        cell.contentView.backgroundColor = .gray
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 370
        }else {
            return 240
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         
          
          let cell = renters[indexPath.row]
          let alertcontroller = UIAlertController(title: "Delete Favorite Book"
                                                  , message: "Are you sure you want to delete this Book?"
                                                  , preferredStyle: UIAlertController.Style.alert
          )
                alertcontroller.addAction(
                        UIAlertAction(title: "cancel",
                                      style: UIAlertAction.Style.default,
                                      handler: { Action in print("...")
              })
          )
          alertcontroller.addAction(
              UIAlertAction(title: "Delete",
                            style: UIAlertAction.Style.destructive,
                            handler: { Action in
                                
                                
                  if editingStyle == .delete {
                      
                      
                   
                          Firestore.firestore().collection("Hostels").document(cell.id).delete()
                      
                      
                  }
                  self.sTV.reloadData()
              })
          )
          self.present(alertcontroller, animated: true, completion: nil)
      }
  }

   


//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//        if searchText.isEmpty {
//
//            let temp = renters
//            renters = temp
//
//            RenterService.shared.listenToRenters { newRenter in
//                self.renters = newRenter
//                self.sTV.reloadData()
//            }
//
//        } else {
//
//            renters = renters.filter({ oneProduct in
//                return oneProduct.name.starts(with: searchText)
//            })
//        }
//        sTV.reloadData()
//
//    }
//}

func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
    searchBar.resignFirstResponder()

}

class RenterCell: UITableViewCell {

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
    let deleteb: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(deletR), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        b.setTitle("حذف", for: .normal)
        // b.setImage(UIImage(named: "x"), for: .normal)
        b.layer.cornerRadius = 25
        b.setTitleColor(.red, for: .normal)
        b.titleLabel?.textColor = .red
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 18)
        //        b.backgroundColor = #colorLiteral(red: 0.397809267, green: 0.4797546268, blue: 0.4178932905, alpha: 1)
        return b
    }()
//    let hostels: Renter!
    @objc func deletR() {
        print("delete...")
//        "١٠٩٩١١٢٢١٠"
//        Firestore.firestore().collection("Hostels")
        
        
        RenterService.shared.hostelsCollection.document(c!.id).delete()
        
//        RenterService.shared.deletRe: Renter(name: c!.name, id: c!.id,timestamp: c!.timestamp)
//              )(
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.clipsToBounds = true
        contentView.backgroundColor = #colorLiteral(red: 1, green: 0.9926941103, blue: 0.9993625388, alpha: 1)
        contentView.layer.cornerRadius = 13

        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(label5)
        contentView.addSubview(label6)
        contentView.addSubview(deleteb)
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
        deleteb.frame = CGRect(x: 2,
                               y: 10,
                               width: 100,
                               height: 100)


    }

}


//
//
//import UIKit
//
//class List1: UIViewController {
//
//    //    var criminals: Array<TPeople> = []
//    var criminals: Array<People> = []
//
//    lazy var criminalsTV: UITableView = {
//        let t = UITableView()
//        t.translatesAutoresizingMaskIntoConstraints = false
//        t.delegate = self
//        t.dataSource = self
//        t.register(CriminalCell.self, forCellReuseIdentifier: "Cell")
//        return t
//    }()
//
//
//
//    lazy var addButton: UIButton = {
//        let b = UIButton()
//        b.addTarget(self, action: #selector(report), for: .touchUpInside)
//        b.translatesAutoresizingMaskIntoConstraints = false
//        //        b.setTitle("اضافه ⚠️", for: .normal)
//        b.setTitle("تنبيهات البلاغات", for: .normal)
//
//        b.layer.cornerRadius = 25
//        b.titleLabel?.textColor = .white
//        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 23)
//        b.backgroundColor = #colorLiteral(red: 0.7697768338, green: 0.1510920047, blue: 0.07888098135, alpha: 1)
//        return b
//    }()
//
//
//
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        title = "القائمه السوداء "
//        view.addSubview(criminalsTV)
//        NSLayoutConstraint.activate([
//            criminalsTV.topAnchor.constraint(equalTo: view.topAnchor),
//            criminalsTV.leftAnchor.constraint(equalTo: view.leftAnchor),
//            criminalsTV.rightAnchor.constraint(equalTo: view.rightAnchor),
//            criminalsTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//        ])
//
////        view.addSubview(addButton)
////        NSLayoutConstraint.activate([
////            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
////            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
////            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
////            addButton.widthAnchor.constraint(equalToConstant: 500),
////            addButton.heightAnchor.constraint(equalToConstant: 60),
////        ])
//    }
//
//
//
//    @objc func report() {
//
//        var newVC = Reports()
//        newVC.navigationItem.largeTitleDisplayMode = .never
//        navigationController?.pushViewController(newVC,animated: true)
//    }
//}
//
//extension List1: UITableViewDataSource, UITableViewDelegate {
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        //        return criminals.count
//        return list.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CriminalCell1
//
//        //        let criminal = criminals[indexPath.row]
//        let criminal = list[indexPath.row]
//
//
//        cell.label2.text = " الاسم:  \(criminal.name)"
//        cell.label3.text = " الهويه الوطنيه:  \(criminal.id) "
//        cell.label4.text = " التهمه:  \(criminal.crime) "
//        cell.Image.image = UIImage(named: criminal.image)
//
//        return cell
//    }
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if indexPath.row == selectedIndex {
//            return 354
//        }else {
//            return 160
//        }
//    }
//
//
//}

//class CriminalCell1: UITableViewCell {
//
//    static let identifire = "Cell"
//
//    public let label2: UILabel = {
//        let label = UILabel()
//        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
//        label.font = UIFont(name: "Avenir-Light", size: 21)
////        label.textColor = .black
//        label.textColor = UIColor(named: "Color11")
//        label.textAlignment = .right
//
//        return label
//    }()
//
//    public let label3: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .right
//        label.font = UIFont(name: "Avenir-Light", size: 18)
////        label.textColor = #colorLiteral(red: 0.4788181631, green: 0.4788181631, blue: 0.4788181631, alpha: 1)
//        label.textColor = UIColor(named: "Color1")
//        return label
//    }()
//    public let label4: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .right
//        label.font = UIFont(name: "Avenir-Light", size: 18)
////        label.textColor = #colorLiteral(red: 0.4788181631, green: 0.4788181631, blue: 0.4788181631, alpha: 1)
//        label.textColor = UIColor(named: "Color1")
//        return label
//    }()
//
//    let Image: UIImageView = {
//        let imageView = UIImageView()
//        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius = 20
//        imageView.contentMode = .scaleAspectFill
//
//        return imageView
//
//    }()
//
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        contentView.backgroundColor = .white
//        contentView.addSubview(label2)
//        contentView.addSubview(label3)
//        contentView.addSubview(label4)
//        contentView.addSubview(Image)
////        contentView.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
//        contentView.backgroundColor = UIColor(named: "Color")
//    }
//
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        //left right
//        label2.frame = CGRect(x: -20,
//                              y: -20,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//
//
//        label3.frame = CGRect(x: -19,
//                              y: 17,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//        label4.frame = CGRect(x: -19,
//                              y: 60,
//                              width: 300,
//                              height: contentView.frame.size.height-30)
//
//        Image.frame = CGRect(x: 290,
//                             y: 16,
//                             width: 110,
//                             height:130)
//
//    }
//
//}
