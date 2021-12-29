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
    var h: Hotel1?
    
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
        b.backgroundColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        return b
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: #selector(addRentert)
        )
//        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
//        self.navigationItem.rightBarButtonItem = leftNavBarButton
//        searchBar.searchBarStyle = UISearchBar.Style.default
//        searchBar.placeholder = "بحث"
//        searchBar.sizeToFit()
//        searchBar.isTranslucent = false
//        searchBar.delegate = self
//        view.addSubview(searchBar)
        
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
        cell.label2.text = "      الاسم: \(renter.name)"
        //        cell.label2.text = "\(d.name)    اسم المدينه:"
        cell.label3.text = " الهويه الوطنيه:  \(renter.id)"
//        cell.label4.text = "وقت الدخول: \(renter.getNiceDate()) "
//        cell.label5.text = " اسم الفندق:  \(r!.name)"
        cell.label6.text = "رقم الشقه:  \(indexPath.row + 1)"
//        cell.backgroundColor = .gray
        cell.contentView.backgroundColor = #colorLiteral(red: 0.5575026482, green: 0.6737594539, blue: 0.7071654279, alpha: 1)
        cell.contentView.layer.borderWidth = 3
        cell.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        cell.layer.cornerRadius = 40
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 370
        }else {
            return 225
        }
    }
            @objc func addRentert() {
                let newVC = NewRenter()
                present(newVC, animated: true, completion: nil)
            }
    
     func tapToAdd(){

        let alert = UIAlertController(title: "بلاغ اشتباه", message: "ارسال بلاغ اشتباه في :", preferredStyle: .alert )
        
        let save = UIAlertAction(title: "إرسال بلاغ", style: .default) { (alertAction) in
            let textField = alert.textFields![0] as UITextField
            guard  let text = textField.text, !text.isEmpty else {
                       return
                   }
//
//            self.data.append(StudentList(name: textField.text!))
//            self.tabelView.reloadData()
        }

        alert.addTextField { (textField) in
            textField.placeholder = "اشتباه في:"
            textField.textColor = .purple
        }
        alert.addAction(save)
        let cancel = UIAlertAction(title: "إلغاء", style: .default) { (alertAction) in }
        alert.addAction(cancel)
        self.present(alert, animated:true, completion: nil)

    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            
            if searchText.isEmpty {
                let temp = renters
                renters = temp
                
                RenterService.shared.listenToRenters { newRenter in
                    self.renters = newRenter
                    self.sTV.reloadData()
                }
               
            } else {
                
                renters = renters.filter({ oneProduct in
                    return oneProduct.name.starts(with: searchText)
                })
            }
        sTV.reloadData()
            
        }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let cell = self.renters[indexPath.row]
        let editAction = UITableViewRowAction(style: .normal, title: "بلاغ") { (rowAction, indexPath) in
            
//            self.tapToAdd()
            let alert = UIAlertController(title: "بلاغ اشتباه", message: "ارسال بلاغ اشتباه في :", preferredStyle: .alert )
            
            let save = UIAlertAction(title: "إرسال بلاغ", style: .default) { (alertAction) in
                
                
                let textField = alert.textFields![0] as UITextField
                guard  let text = textField.text, !text.isEmpty else {
                           return
                       }
                let name = cell.name
                let id = cell.id
//                let date = cell.timestamp
                let reason = textField.text!
                
              
                ReportRenterService.shared.addReport(hostels: ReportRenter(name: name, id: id, reason: reason))

    //
    //            self.data.append(StudentList(name: textField.text!))
    //            self.tabelView.reloadData()
            }

            alert.addTextField { (textField) in
                textField.placeholder = "اشتباه في:"
                textField.textColor = .blue
            }
            alert.addAction(save)
            let cancel = UIAlertAction(title: "إلغاء", style: .default) { (alertAction) in }
            alert.addAction(cancel)
            self.present(alert, animated:true, completion: nil)
            
        }
        editAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)

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
                                          
                                          
                                          let name = cell.name
                                          let id = cell.id
                                          let date = cell.timestamp
                                          let nowdate = Timestamp()
                                          
                                        
                                          LeavingService.shared.addLeaving(leaving: LeavingRenter(name: name, id: id,timestamp: date, date: nowdate))
                                          
                                              Firestore.firestore().collection("Hostels").document(cell.id).delete()
                                          
                                          
                                          self.sTV.reloadData()
                                      })
                    )
                    self.present(alertcontroller, animated: true, completion: nil)
            
            
            
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.2912973366, green: 0.3988350792, blue: 0.7644492128, alpha: 1)

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
        
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        
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
