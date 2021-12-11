//
//  ViewController.swift
//  sidebar
//
//  Created by Jawaher🌻 on 29/04/1443 AH.
//

import UIKit

class ContainerViewController: UIViewController {
    
    enum MenuState {
        case opend
        case closed
    }
    private var menuState: MenuState = .closed
    
    let menuVC = MenuViewController()
    let homeVC = Home()
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
extension ContainerViewController: HomeViewControllerDelegate{
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

extension ContainerViewController: MenuViewControllerDelegate{
    func didSelect(menuItem: MenuViewController.MenuOPtions) {
        
        toggleMenu(completion: nil)
        switch menuItem {
        case .home:
            self.resetToHome()
        case .profile:
            self.addProfile()
        case .info:
            self.addInfo()
        case .reportRenter:
            self.addreportR()
        case .appRating:
            self.addcity()
        case .newRenter:
            self.addrenter()
            
        case .leaving:
            self.addleav()
        case .banned:
            self.addbanned()
            
        case .shareApp:
            self.addlist()
        case .settings:
            self.addSet()
        case .centers:
            self.addCen()
        case .dark:
            self.addCen()
        case .language:
            self.changrLan()
        case .about:
            self.addCen()
        case .settt:
            self.addCen()
        }
    }
    func addInfo() {
        let vc = infoVC
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addreportR() {
        let vc = report
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addProfile() {
        let vc = profile
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addrenter() {
        let vc = newRenter
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addleav() {
        let vc = newleav
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addbanned() {
        let vc = banned
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }

    func darkk() {
        let appDelegate = UIApplication.shared.windows.first
        appDelegate?.backgroundColor = .black
    }
    
    func  addcity() {
        let vc = cityy
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func addSet() {
        let vc = settin
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func addlist() {
        let vc = list
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    func  addCen() {
        let vc = center
        homeVC.addChild(vc)
        homeVC.view.addSubview(vc.view)
        vc.view.frame = view.frame
        vc.didMove(toParent: homeVC)
        homeVC.title = vc.title
    }
    
    func resetToHome() {
        infoVC.view.removeFromSuperview()
        settin.view.removeFromSuperview()
        cityy.view.removeFromSuperview()
        list.view.removeFromSuperview()
        center.view.removeFromSuperview()
        infoVC.didMove(toParent: nil)
        homeVC.title =  NSLocalizedString("31", comment:"الصفحه الرئيسية")
    }
    func changrLan() {
        let currentLa = Locale.current.languageCode
        let newLan = currentLa == "en" ? "ar" : "en"
        UserDefaults.standard.setValue([newLan], forKey: "AppleLanguages")
        exit(0)
    }
}
