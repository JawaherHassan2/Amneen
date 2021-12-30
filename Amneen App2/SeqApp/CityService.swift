//
//  HostelService.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.

import UIKit
import FirebaseFirestore


class CityService {
    static let shared = CityService()
    
    let hostelsCollection = Firestore.firestore().collection("City")
    
    func addH(hostels: City1) {
        hostelsCollection.document(hostels.name).setData([
            "name": hostels.name,
            "id": hostels.id,
        ])
    }
  
    func listenToCities(completion: @escaping (([City1]) -> Void)) {
        
        hostelsCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }
            
            var hostels: Array<City1> = []
            for document in documents {
                let data = document.data()
                
                let criminal = City1(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id"
                  
                )
                hostels.append(criminal)
            }
            completion(hostels)
        }
    }
    
    func listenToDay(name: String, completion: @escaping ((City1?) -> Void)) {
        hostelsCollection.document(name).addSnapshotListener { document, error in
            if error != nil {
                completion(nil)
                return
            }
            guard let data = document?.data() else {
                completion(nil)
                return
            }
            
            let day = City1(
                name: (data["name"] as? String) ?? "No name",
                id: (data["id"] as? String) ?? "No id"
              
            )
            completion(day)
        }
    }
    
}


