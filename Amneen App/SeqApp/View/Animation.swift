////
////  Animation.swift
////  SeqApp
////
////  Created by Jawaher🌻 on 01/05/1443 AH.
////
//
//import UIKit
//class AnimationLaunch: UIViewController {
//    private let imageView: UIImageView = {
//        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
//        imageView.image = UIImage(named: "da2")
//        return imageView
//    }()
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .systemBackground
//        view.addSubview(imageView)
//    }
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        imageView.center = view.center
//        DispatchQueue.main.asyncAfter(deadline: .now()+0.5) {
//            self.animate()
//        }
//    }
//    private func animate() {
//        UIView.animate(withDuration: 1) {
//            let size = self.view.frame.size.width * 2
//            let diffX = size - self.view.frame.size.width
//            let diffY = self.view.frame.size.height - size
//            self.imageView.frame = CGRect(
//                x: -(diffX/2),
//                y: diffY/2,
//                width: size,
//                height: size
//            )
//        }
//        UIView.animate(withDuration: 1.5, animations: {
//            self.imageView.alpha = 0
//        }, completion: { done in
//            if done {
//                DispatchQueue.main.asyncAfter(deadline: .now()+0.3) {
//                    let viewControlller = Home()
//                    viewControlller.modalTransitionStyle = .crossDissolve
//                    viewControlller.modalPresentationStyle = .fullScreen
//                    self.present(viewControlller, animated: true)
//                }
//            }
//        })
//    }
//}
