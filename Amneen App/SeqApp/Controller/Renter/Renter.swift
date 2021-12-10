//
//  People.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
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
        cell.layer.cornerRadius = 40
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 370
        }else {
            return 240
        }
    }
    
   

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {

        let editAction = UITableViewRowAction(style: .normal, title: "Edit") { (rowAction, indexPath) in
            
        }
        editAction.backgroundColor = .blue

        let deleteAction = UITableViewRowAction(style: .normal, title: "مغادره") { [self] (rowAction, indexPath) in
  
            
            
            let cell = self.renters[indexPath.row]
                    let alertcontroller = UIAlertController(title: "مغادره المستأجر"
                                                            , message: "هل انت متأكد بمغادره المستأجر؟ "
                                                            , preferredStyle: UIAlertController.Style.alert
                    )
                    alertcontroller.addAction(
                        UIAlertAction(title: "لا",
                                      style: UIAlertAction.Style.default,
                                      handler: { Action in print("...")
                                      })
                    )
                    alertcontroller.addAction(
                        UIAlertAction(title: "مغادره",
                                      style: UIAlertAction.Style.destructive,
                                      handler: { Action in
                                       
                                              Firestore.firestore().collection("Hostels").document(cell.id).delete()
                                          
                                          self.sTV.reloadData()
                                      })
                    )
                    self.present(alertcontroller, animated: true, completion: nil)
            
            
            
        }
        deleteAction.backgroundColor = .red

        return [editAction,deleteAction]
    }
    
}


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
