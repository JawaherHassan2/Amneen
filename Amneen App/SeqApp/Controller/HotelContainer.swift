//
//  HotelContainer.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 08/05/1443 AH.
//



import UIKit

class HotelContainer: UIViewController {
    
    enum MenuState {
        case opend
        case closed
    }
    private var menuState: MenuState = .closed
    
    let menuVC = HotelMenu()
    let homeVC = HotelHome()
    var navVC: UINavigationController?
    
    lazy var infoVC = Reports()
    lazy var settin =  SOSNumbers()
    lazy var list =  List()
    lazy var cityy =  Cities()
    lazy var center = CentersLocations()
    lazy var newRenter = NewRenter()
    lazy var newleav = LeavingRenters()
    lazy var profile = Profile()
    lazy var banned = BannedRenters()
    lazy var report = ReportRenters()
    lazy var setting = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        addChildVCs()
    }
    private func addChildVCs() {
        menuVC.delegate = self
        addChild(menuVC)
        view.addSubview(menuVC.view)
        menuVC.didMove(toParent: self)
        
        //--
        homeVC.delegate = self
        let navVC = UINavigationController(rootViewController: homeVC)
        addChild(navVC)
        view.addSubview(navVC.view)
        navVC.didMove(toParent: self)
        self.navVC = navVC
    }
    
    
}
extension HotelContainer: HomeHViewControllerDelegate{
    func didTapMenuButton() {
        toggleMenu(completion: nil)
        
    }
    func toggleMenu(completion: (() -> Void)?) {
        switch menuState {
            
        case .closed:
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromRight) {
                self.navVC?.view.frame.origin.x =  self.homeVC.view.frame.size.width-50
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .opend
                    
                }
                
            }
            
        case .opend:
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .transitionFlipFromRight) {
                
                self.navVC?.view.frame.origin.x =  0
                
            } completion: { [weak self] done in
                if done {
                    self?.menuState = .closed
                    DispatchQueue.main.async {
                        completion?()
                    }
                    
                    
                }
                
            }
            
            
        }
        
        
    }
}

extension HotelContainer: MenuHViewControllerDelegate{
    func didSelect(menuItem: HotelMenu.MenuOPtions) {
        
        toggleMenu(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHom()
        case .profile:
            self.addProfil()
//        case .info:
//            self.addInf()
//        case .reportRenter:
//            self.addreport()
        case .appRating:
            self.addcit()
        case .newRenter:
            self.addrente()
            
        case .leaving:
            self.addlea()
        case .banned:
            self.addbanne()
            
//        case .shareApp:
//            self.addlis()
//        case .settings:
//            self.addSe()
//        case .centers:
//            self.addCe()
//        case .dark:
//            self.addCe()
//        case .language:
//            self.changrLa()
        case .about:
            self.addCe()
        case .settt:
            self.adds()
        }
    }
    func addInf() {
        let vc = infoVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func adds() {
        let vc = setting
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addreport() {
        let vc = report
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addProfil() {
        let vc = profile
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addrente() {
        let vc = newRenter
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addlea() {
        let vc = newleav
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addbanne() {
        let vc = banned
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }

    func dark() {
        let appDelegate = UIApplication.shared.windows.first
        appDelegate?.backgroundColor = .black
    }
    
    func  addcit() {
        let vc = cityy
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addSe() {
        let vc = settin
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addlis() {
        let vc = list
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func  addCe() {
        let vc = center
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func resetToHom() {
        infoVC.view.removeFromSuperview()
        settin.view.removeFromSuperview()
        cityy.view.removeFromSuperview()
        list.view.removeFromSuperview()
        center.view.removeFromSuperview()
        newRenter.view.removeFromSuperview()
        newleav.view.removeFromSuperview()
        profile.view.removeFromSuperview()
        banned.view.removeFromSuperview()
        report.view.removeFromSuperview()
        setting.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        homeVC.title =  NSLocalizedString("31", comment:"الصفحه الرئيسية")
    }
    func changrLa() {
        let currentLa = Locale.current.languageCode
        let newLan = currentLa == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
        exit(0)
    }
}
