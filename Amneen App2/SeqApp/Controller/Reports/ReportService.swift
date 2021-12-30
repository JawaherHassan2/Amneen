//
//  ReportService.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 24/04/1443 AH.
//

import UIKit
import FirebaseFirestore


class ReportService {
    static let shared = ReportService()

    let hostelsCollection = Firestore.firestore().collection("Report")

    func addReport(hostels: Report) {
        
        
        hostelsCollection.document(hostels.id).setData([
            "name": hostels.name,
            "id": hostels.id,
            "timestamp": hostels.timestamp
        ])
    }
    
    func listenToReport(completion: @escaping (([Report]) -> Void)) {

        hostelsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }

            var hostels: Array<Report> = []
            for document in documents {
                let data = document.data()
                let criminal = Report(
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

