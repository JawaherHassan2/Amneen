//
//  SecurityMenu.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 08/05/1443 AH.
//


import UIKit
protocol MenuSViewControllerDelegate: AnyObject{
    
    func didSelect(menuItem: SecurityMenu.MenuOPtions)
}
class SecurityMenu: UIViewController, UITableViewDelegate, UITableViewDataSource {

    weak var delegate: MenuSViewControllerDelegate?
    
    enum MenuOPtions: String, CaseIterable {
        case home
        case info
        case reportRenter
        case shareApp
        case about
        case settt
        

   var localized: String {
                    switch self {
                    case .home:
                        return NSLocalizedString("47", comment: "الصفحة الرئيسية")
                        
                    case .info:
                        return NSLocalizedString("48", comment: "البلاغات")
                    case .reportRenter:
                        return NSLocalizedString("بلاغات الاشتباه", comment: "")
                    case .shareApp:
                        return NSLocalizedString("50", comment: "القائمه السوداء")
//                    case .settings:
//                        return NSLocalizedString("51", comment: "ارقام الطوارئ")
//                    case .centers:
//                        return NSLocalizedString("52", comment: "مواقع المراكز")
//                    case .dark:
//                        return NSLocalizedString("53", comment:"الوضع الليلي")
//                    case .language:
//                        return NSLocalizedString("54", comment: "تبديل اللغه")
                    case .about:
                        return NSLocalizedString("55", comment: "عن التطبيق")
                    case .settt:
                        return NSLocalizedString("56", comment: "الإعدادات")
                    }
                }
//
        var imageName: String {
            switch self {
            case .home:
                return "house"
//            case .profile:
//                return "house"
            case .info:
                return "doc.plaintext"
            case .reportRenter:
                return "doc.richtext"
//            case .appRating:
//                return "house.circle.fill"
//            case .newRenter:
//                return "person"
//            case .leaving:
//                return "person"
//            case .banned:
//                return "person"
            case .shareApp:
                return "person.fill.xmark"
            case .about:
                return "lanyardcard"
            case .settt:
                return "gear"
            }
        }
        
    }
    var switchController: UISwitch!
 
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.backgroundColor = #colorLiteral(red: 0.9762478471, green: 0.9803959727, blue: 0.9844033122, alpha: 1)
        return table
    }()
    
    let Image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
//        imageView.layer.cornerRadius =
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "o1")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let switchDemo = UISwitch(frame:CGRect(x: 60, y: 500, width: 100, height: 100))
//        switchDemo.addTarget(self, action: #selector(self.switchStateDidChange(_:)), for: .valueChanged)
//        switchDemo.setOn(true, animated: false)
//        self.view.addSubview(switchDemo)
        
        view.addSubview(Image)
        view.addSubview(tableView)
       
        tableView.delegate = self
        tableView.dataSource = self
        
        view.backgroundColor = #colorLiteral(red: 0.9762478471, green: 0.9803959727, blue: 0.9844033122, alpha: 1)
        title = NSLocalizedString("31", comment:"الصفحه الرئيسية")
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        Image.frame = CGRect(x: 0, y: 0, width: 400, height: 250)
        tableView.frame = CGRect(x: 0, y: 250, width: view.bounds.size.width, height: view.bounds.size.height)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MenuOPtions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = MenuOPtions.allCases[indexPath.row].localized
        cell.textLabel?.textColor = #colorLiteral(red: 0.1401828367, green: 0.3361562391, blue: 0.2719624596, alpha: 1)
        cell.imageView?.image = UIImage(systemName: MenuOPtions.allCases[indexPath.row].imageName)
        cell.imageView?.tintColor = #colorLiteral(red: 0.3525104821, green: 0.6645560861, blue: 0.6123059392, alpha: 1)
        cell.backgroundColor = #colorLiteral(red: 0.9762478471, green: 0.9803959727, blue: 0.9844033122, alpha: 1)
        cell.contentView.backgroundColor = #colorLiteral(red: 0.9762478471, green: 0.9803959727, blue: 0.9844033122, alpha: 1)
        
        

//           if cell.isSelected == true {
//               cell.contentView.backgroundColor = .yellow
//
//           } else if cell.isSelected == false{
               cell.contentView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
//           }
    
//        cell.selectionStyle = .blue
        return cell
    }
    
   

     func setSelected(_ selected: Bool, animated: Bool) {
        setSelected(selected, animated: animated)

        if selected {
            // visual updates (with a small animation)
        } else {
            // visual updates
        }
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let item = MenuOPtions.allCases[indexPath.row]
        delegate?.didSelect(menuItem: item)
        
//        let selectedCell:UITableViewCell = tableView.cellForRow(at: indexPath)!
//              selectedCell.contentView.backgroundColor = .gray
        

    }
   
}

