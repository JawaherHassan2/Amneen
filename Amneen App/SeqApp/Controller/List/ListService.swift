//
//  NewHostel.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 19/04/1443 AH.
//


import UIKit
import FirebaseFirestore


class CriminalService {
    static let shared = CriminalService()
    
    let criminalCollection = Firestore.firestore().collection("criminals")
    
    
    func addC(criminals: TPeople) {
        criminalCollection.document(criminals.id).setData([
            "name": criminals.name,
            "id": criminals.id
        ])
    }
 
    
    func listenToNotes(completion: @escaping (([TPeople]) -> Void)) {
        
        criminalCollection.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let documents = snapshot?.documents else { return }
            
            var criminals: Array<TPeople> = []
            for document in documents {
                let data = document.data()
                let criminal = TPeople(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id"
                )
                criminals.append(criminal)
            }
            
            completion(criminals)
        }
    }
    
}


