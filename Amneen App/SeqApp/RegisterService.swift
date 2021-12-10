//
//  RegisterService.swift
//  MyApp
//
//  Created by Amal on 03/05/1443 AH.
//
////
//import UIKit
//import FirebaseFirestore
//
//class RegisterService {
//
//    static let shared = RegisterService()
//
//    let usersCollection = Firestore.firestore().collection("usersa")
//
//    // Add user to firestor
//    func addUser(user: User) {
//        usersCollection.document(user.id).setData([
//            "name": user.name,
//            "id": user.id,
//
//        ])
//    }
//
//    func listenToUsers(completion: @escaping (([User]) -> Void)) {
//
//        usersCollection.addSnapshotListener { snapshot, error in
//            if error != nil { // اذا فيه ايرور
//                return
//            }
//            guard let documents = snapshot?.documents else { return }
//
//            var users: Array<User> = []
//            for document in documents {
//                let data = document.data()
//                let user = User(
//                    name: (data["name"] as? String) ?? "No name",
//                    id: (data["id"] as? String) ?? "No id"
//                )
//                users.append(user)
//            }
//
//            completion(users)
//        }
//    }
//    func updateUserInfo(user: User) {
//        usersCollection.document(user.id).setData([
//            "id": user.id,
//            "name": user.name,
//        ], merge: true)
//    }
//
//}
