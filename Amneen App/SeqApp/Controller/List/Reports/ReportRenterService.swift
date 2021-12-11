//
//  ReportRenterService.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 07/05/1443 AH.
//


import UIKit
import FirebaseFirestore


class ReportRenterService {
    static let shared = ReportRenterService()

    let hostelsCollection = Firestore.firestore().collection("ReportRenter")

    func addReport(hostels: ReportRenter) {
        
        
        hostelsCollection.document(hostels.id).setData([
            "name": hostels.name,
            "id": hostels.id,
            "reason": hostels.reason
//            "timestamp": hostels.timestamp
        ])
    }
    
    func listenToReport(completion: @escaping (([ReportRenter]) -> Void)) {

        hostelsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }

            var hostels: Array<ReportRenter> = []
            for document in documents {
                let data = document.data()
                let criminal = ReportRenter(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id",
                    reason: (data["reason"] as? String) ?? "No reason"
//                    timestamp: (data["timestamp"] as? Timestamp) ?? Timestamp()
                )
                hostels.append(criminal)
            }
            completion(hostels)
        }
    }

}


