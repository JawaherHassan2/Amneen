//
//  HotelService1.swift
//  SeqApp
//  Created by Jawaher🌻 on 24/05/1443 AH.
//


import UIKit
import FirebaseFirestore

var aq: City1?
class HotelService1 {
    static let shared = HotelService1()

    let hostelsCollection = Firestore.firestore().collection("City")
    let hostelsCollection1 = Firestore.firestore().collection("City").document(aq?.name ?? "Abha").collection("Hotels")

    var hostels1: Hotel1?
    func addH(hostels: Hotel1) {
        var  hostels2: City1?
        hostelsCollection.document(
           "Abha").collection("Hotels").document(hostels.name).setData([
            "name": hostels.name,
            "id": hostels.id,
          
        ])
    }
   
    
    
    func listenToHotels(completion: @escaping (([Hotel1]) -> Void)) {
        
        hostelsCollection1.addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            guard let documents = snapshot?.documents else { return }
            
            var hostels: Array<Hotel1> = []
            for document in documents {
                let data = document.data()
                
                let criminal = Hotel1(
                    name: (data["name"] as? String) ?? "No name",
                    id: (data["id"] as? String) ?? "No id"
                  
                )
                hostels.append(criminal)
            }
            completion(hostels)
        }
    }
    
}


