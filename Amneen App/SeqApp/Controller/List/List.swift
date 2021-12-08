//
//  TerList.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.

import UIKit

class List: UIViewController {
    
    //    var criminals: Array<TPeople> = []
    var criminals: Array<People> = []
    
    lazy var criminalsTV: UITableView = {
        let t = UITableView()
        t.translatesAutoresizingMaskIntoConstraints = false
        t.delegate = self
        t.dataSource = self
        t.register(CriminalCell.self, forCellReuseIdentifier: "Cell")
        return t
    }()
    
    
    
    lazy var addButton: UIButton = {
        let b = UIButton()
        b.addTarget(self, action: #selector(report), for: .touchUpInside)
        b.translatesAutoresizingMaskIntoConstraints = false
        //        b.setTitle("اضافه ⚠️", for: .normal)
        b.setTitle("تنبيهات البلاغات", for: .normal)
        
        b.layer.cornerRadius = 25
        b.titleLabel?.textColor = .white
        b.titleLabel?.font = UIFont(name: "Avenir-Light", size: 23)
        b.backgroundColor = #colorLiteral(red: 0.7697768338, green: 0.1510920047, blue: 0.07888098135, alpha: 1)
        return b
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "القائمه السوداء "
        view.addSubview(criminalsTV)
        NSLayoutConstraint.activate([
            criminalsTV.topAnchor.constraint(equalTo: view.topAnchor),
            criminalsTV.leftAnchor.constraint(equalTo: view.leftAnchor),
            criminalsTV.rightAnchor.constraint(equalTo: view.rightAnchor),
            criminalsTV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
//        view.addSubview(addButton)
//        NSLayoutConstraint.activate([
//            addButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
//            addButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5),
//            addButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -90),
//            addButton.widthAnchor.constraint(equalToConstant: 500),
//            addButton.heightAnchor.constraint(equalToConstant: 60),
//        ])
    }
    
   
    
    @objc func report() {
        
        var newVC = Reports()
        newVC.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(newVC,animated: true)
    }
}

extension List: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return criminals.count
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CriminalCell
        
        //        let criminal = criminals[indexPath.row]
        let criminal = list[indexPath.row]
        
        
        cell.label2.text = " الاسم:  \(criminal.name)"
        cell.label3.text = " الهويه الوطنيه:  \(criminal.id) "
        cell.label4.text = " التهمه:  \(criminal.crime) "
        cell.Image.image = UIImage(named: criminal.image)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == selectedIndex {
            return 354
        }else {
            return 160
        }
    }
    
   
}

class CriminalCell: UITableViewCell {
    
    static let identifire = "Cell"
    
    public let label2: UILabel = {
        let label = UILabel()
        //     label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.font = UIFont(name: "Avenir-Light", size: 21)
//        label.textColor = .black
        label.textColor = UIColor(named: "Color11")
        label.textAlignment = .right
        
        return label
    }()
    
    public let label3: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 18)
//        label.textColor = #colorLiteral(red: 0.4788181631, green: 0.4788181631, blue: 0.4788181631, alpha: 1)
        label.textColor = UIColor(named: "Color1")
        return label
    }()
    public let label4: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont(name: "Avenir-Light", size: 18)
//        label.textColor = #colorLiteral(red: 0.4788181631, green: 0.4788181631, blue: 0.4788181631, alpha: 1)
        label.textColor = UIColor(named: "Color1")
        return label
    }()
    
    let Image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.contentMode = .scaleAspectFill
        
        return imageView
        
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .white
        contentView.addSubview(label2)
        contentView.addSubview(label3)
        contentView.addSubview(label4)
        contentView.addSubview(Image)
//        contentView.backgroundColor = #colorLiteral(red: 0.8914818384, green: 0.8685067299, blue: 0.8232201155, alpha: 1)
        contentView.backgroundColor = UIColor(named: "Color")
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //left right
        label2.frame = CGRect(x: -20,
                              y: -20,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        
        label3.frame = CGRect(x: -19,
                              y: 17,
                              width: 300,
                              height: contentView.frame.size.height-30)
        label4.frame = CGRect(x: -19,
                              y: 60,
                              width: 300,
                              height: contentView.frame.size.height-30)
        
        Image.frame = CGRect(x: 290,
                             y: 16,
                             width: 110,
                             height:130)
        
    }
    
}
