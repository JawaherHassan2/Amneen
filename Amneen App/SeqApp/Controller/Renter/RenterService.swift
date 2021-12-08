//
//  HostelService.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.

import UIKit
import FirebaseFirestore


class RenterService {
    static let shared = RenterService()

    let hostelsCollection = Firestore.firestore().collection("Hostels")

    func addH(hostels: Renter) {
        hostelsCollection.document(hostels.id).setData([
            "name": hostels.name,
            "id": hostels.id,
            "timestamp": hostels.timestamp
        ])
    }
    
    func listenToRenters(completion: @escaping (([Renter]) -> Void)) {

        hostelsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }

            var hostels: Array<Renter> = []
            for document in documents {
                let data = document.data()
                
                let criminal = Renter(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id",
                    timestamp: (data["timestamp"] as? Timestamp) ?? Timestamp()
                )
                hostels.append(criminal)
            }
            completion(hostels)
        }
    }

}


