import UIKit
import Firebase

class Profile: UIViewController, UIImagePickerControllerDelegate , UINavigationControllerDelegate{
    
    
    
    lazy var img: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        //        image.backgroundColor = .yellow
        image.image = UIImage(named: "p11")
        image.layer.cornerRadius = 20
        image.layer.borderColor = #colorLiteral(red: 0.3955914783, green: 0.5126042842, blue: 0.517450081, alpha: 1)
        image.layer.borderWidth = 2
        image.isUserInteractionEnabled = true
        return image
    }()
    lazy var imagePicker : UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        return imagePicker
    }()
    
    let firstName : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Write your First name"
        //        $0.text.font = UIFont(name: "Avenir-Light", size: 20)
        $0.textAlignment = .center
        $0.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        //        $0.backgroundColor = .init(white: 0.85, alpha: 1)
        $0.layer.cornerRadius = 18
        return $0
    }(UITextField())
    
    let lastName : UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Write your last Name"
        $0.textAlignment = .center
        $0.textColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        //        $0.backgroundColor = .init(white: 0.85, alpha: 1)
        $0.layer.cornerRadius = 18
        return $0
    }(UITextField())
    
    let Button : UIButton = {
        //        $0.backgroundColor = UIColor(red: (170/255), green: (127/255), blue: (176/255), alpha: 1)
        //        $0.setTitle("Save", for: .normal)
        $0.titleLabel?.textColor = .black
        $0.setImage(UIImage(systemName:"pencil"), for: .normal)
        $0.tintColor = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
        //        $0.titleColor(for: .)
        
        //        $0.layer.cornerRadius = 25
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(B), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    let Button1 : UIButton = {
        $0.backgroundColor = .white
        
        //        $0.setTitle("sign out", for: .normal)
        //        $0.backgroundColor = #colorLiteral(red: 0.8315088153, green: 0.3571410775, blue: 0.3587501645, alpha: 1)
        $0.changeUIButton1(title: (NSLocalizedString("تسجيل خروج", comment: "")), color: colors.bcolor)
        $0.layer.cornerRadius = 25
        $0.titleLabel?.font = UIFont(name: "Avenir-Light", size: 20)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(A), for: .touchUpInside)
        return $0
    }(UIButton())
    
    
    func assignbackground(){
        let background = UIImage(named: "q33")
        var imageView : UIImageView!
        imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = background
        imageView.center = view.center
        view.addSubview(imageView)
        self.view.sendSubviewToBack(imageView)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        setUpImage()
        img.layer.cornerRadius = 19
        //        navigationController?.navigationBar.backgroundColor = .red
        //
        
        navigationController?.navigationBar.tintColor = #colorLiteral(red: 0.04864486824, green: 0.3906074293, blue: 0.3516095239, alpha: 1)
        
        
        assignbackground()
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        img.addGestureRecognizer(tapRecognizer)
        self.tabBarController?.title =  NSLocalizedString("68", comment: "الملف الشخصي ")
        title = NSLocalizedString("68", comment: "الملف الشخصي ")
        
        view.backgroundColor = .white
        
        view.addSubview(img)
        NSLayoutConstraint.activate([
            img.topAnchor.constraint(equalTo: view.topAnchor, constant: 170),
            img.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            img.heightAnchor.constraint(equalToConstant: 80),
            img.widthAnchor.constraint(equalTo: img.heightAnchor,multiplier: 100/100)])
        
        
        
        firstName.font = .boldSystemFont(ofSize: 19)
        lastName.font = .boldSystemFont(ofSize: 19)
        firstName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(firstName)
        NSLayoutConstraint.activate([
            
            firstName.topAnchor.constraint(equalTo: view.topAnchor,constant: 170),
            //            firstName.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 100),
            firstName.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -120),
            firstName.heightAnchor.constraint(equalToConstant: 40),
            firstName.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        
        lastName.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lastName)
        NSLayoutConstraint.activate([
            
            lastName.topAnchor.constraint(equalTo: view.topAnchor,constant: 170),
            //            lastName.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 100),
            lastName.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -174),
            //            lastName.rightAnchor.constraint(equalTo: view.rightAnchor , constant: 150),
            
            lastName.heightAnchor.constraint(equalToConstant: 40),
            lastName.widthAnchor.constraint(equalToConstant: 80),
        ])
        
        
        
        view.addSubview(Button)
        
        NSLayoutConstraint.activate([
            Button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 21),
            //            Button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            //            Button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            //            Button.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 130),
            Button.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -230),
            Button.heightAnchor.constraint(equalToConstant: 60),
            Button.widthAnchor.constraint(equalToConstant: 60),
        ])
        
        view.addSubview(Button1)
        NSLayoutConstraint.activate([
            Button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 570),
            //            Button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            //            Button1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            //            Button1.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 30),
            //            Button1.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -30),
            //            Button1.heightAnchor.constraint(equalToConstant: 50),
            //            Button1.widthAnchor.constraint(equalToConstant: 290),
            
            Button1.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            Button1.widthAnchor.constraint(equalToConstant: self.view.frame.width / 1.2),
            Button1.heightAnchor.constraint(equalToConstant: 50),
            
        ])
        
        
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore()
            .document("users/\(currentUserID)")
            .addSnapshotListener{ doucument, error in
                if error != nil {
                    print (error)
                    return
                }
                
                self.firstName.text = doucument?.data()?["First Name"] as? String
                self.lastName.text = doucument?.data()?["Last Name"] as? String
                
                
            }
        
    }
    @objc func B() {
        guard let currentUserID = Auth.auth().currentUser?.uid else {return}
        Firestore.firestore().document("users/\(currentUserID)").updateData([
            "First Name" : firstName.text,
            "uID" : currentUserID,
            "Last Name" :lastName.text,
            
        ])
        let alert1 = UIAlertController(
            title: ("Saved"),
            message: "Saved update data",
            preferredStyle: .alert)
        
        alert1.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    print("OK")
                }
            )
        )
        
        
        present(alert1, animated: true, completion: nil)
        
        
    }
    
    @objc func imageTapped() {
        print("Image tapped")
        presentPhotoInputActionsheet()
//        present(imagePicker, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] ?? info [.originalImage] as? UIImage
        img.image = image as? UIImage
        dismiss(animated: true)
    }
    @objc func A() {
        
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            dismiss(animated: true, completion: nil)
        } catch let signOutError as NSError {
            print ("Error signing out: \(signOutError.localizedDescription)")
        }
        
        let vc = UINavigationController(rootViewController: L1())
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    @objc private func presentPhotoInputActionsheet() {
        let actionSheet = UIAlertController(title: "تغيير الصوره",
                                            message: " تغيير صوره الملف الشخصي من",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "الكاميرا📷 ", style: .default, handler: { [weak self] _ in
       
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            picker.allowsEditing = true
            self?.present(picker, animated: true)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "مكتبه الصور🌄", style: .default, handler: { [weak self] _ in
            
            let picker = UIImagePickerController()
            picker.sourceType = .photoLibrary
            picker.delegate = self
            picker.allowsEditing = true
            self?.present(picker, animated: true)
            
        }))
        actionSheet.addAction(UIAlertAction(title: "إلغاء", style: .cancel, handler: nil))
        
        present(actionSheet, animated: true)
        //            setupImagePicker()
    }
   
    func setUpImage() {
        
        img.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(presentPhotoInputActionsheet))
       
        img.addGestureRecognizer(tapRecognizer)
        
        view.addSubview(img)
    }
}
