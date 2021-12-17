//
//  LeavingService.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 07/05/1443 AH.
//


import UIKit
import FirebaseFirestore


class LeavingService {
    static let shared = LeavingService()
    
    let leavingCollection = Firestore.firestore().collection("Leaving Renters")
    
    func addLeaving(leaving: LeavingRenter) {
        
        
        leavingCollection.document(leaving.id).setData([
            "name": leaving.name,
            "id": leaving.id,
            "timestamp": leaving.timestamp,
            "date": leaving.date
        ])
    }
    
    func listenToLeaving(completion: @escaping (([LeavingRenter]) -> Void)) {
        
        leavingCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }
            
            var hostels: Array<LeavingRenter> = []
            for document in documents {
                let data = document.data()
                let criminal = LeavingRenter(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id",
                    timestamp: (data["timestamp"] as? Timestamp) ?? Timestamp(),
                    date: (data["date"] as? Timestamp) ?? Timestamp()
                )
                hostels.append(criminal)
            }
            completion(hostels)
        }
    }
    
}


