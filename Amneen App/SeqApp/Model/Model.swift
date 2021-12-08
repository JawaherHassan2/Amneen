//
//  Hotel.swift
//  SeqApp
//  Created by Jawaher🌻 on 18/04/1443 AH.
import Foundation
import UIKit
import FirebaseFirestore


struct City {
    let name: String
    let image: String
    
    
    let Hotels: Array<Hotel>
}


struct Hotel {
    let name: String
}

let hotelList = [ City(name:  NSLocalizedString("12", comment: "ابها"), image: "ab2",
    
                        Hotels: [
                            Hotel(name: NSLocalizedString("24", comment:"فندق السروات")),
                            Hotel(name: NSLocalizedString("25", comment:"فندق بلو إن")),
                            Hotel(name: NSLocalizedString("26", comment:"فندق شفا ابها")),
                            Hotel(name: NSLocalizedString("27", comment:"فندق قصر السلام")),
                            Hotel(name: NSLocalizedString("28", comment:"فندق قصر ابها")),
                            Hotel(name: NSLocalizedString("29", comment:"ابها كراون")),
                            Hotel(name: NSLocalizedString("30", comment:"فندق السحاب "))
                                ]
                       ),
                  
                  City(name: NSLocalizedString("13", comment:"الرياض"), image: "ra2", Hotels: [
                    Hotel(name: "هيلتون الرياض"),
                    Hotel(name: "ريتز كارلتون"),
                    Hotel(name: "فندق ماريوت الرياض"),
                    Hotel(name: "فندق موتيارا"),
                    Hotel(name: "فندق راديسون بلو "),
                    Hotel(name: "فندق الوفت"),
                    Hotel(name: "الفيصليه")
                    ]  ),
                  City(name: NSLocalizedString("14", comment:"جدة"), image: "je2", Hotels: [
                    Hotel(name: "فندق انتركونتيننتال"),
                    Hotel(name: "فندق كراون بلازا"),
                    Hotel(name: "ريتز كارلتون"),
                    Hotel(name: "شيراتون"),
                    Hotel(name: "فندق رسيس"),
                    Hotel(name: "فندق راديسون بلو"),
                    Hotel(name: "فندق غاليريا")
                    ]),
                  City(name: NSLocalizedString("15", comment: "الدمام"), image: "da2", Hotels: [
                    Hotel(name: "فندق اورينتال رزيدنس"),
                    Hotel(name: "فندق شيراتون"),
                    Hotel(name: "فندق نورمينا"),
                    Hotel(name: "فندق نوفوتيل "),
                    Hotel(name: "فندق اوبن"),
                    Hotel(name: "فندق لافونا"),
                    Hotel(name: "فندق بودل")
                    ]),
                  City(name:  NSLocalizedString("16", comment:"الأحساء"), image: "ah2", Hotels: [
                    Hotel(name: "فندق قاردن بلازا"),
                    Hotel(name: "فندق انتركونتننتال"),
                    Hotel(name: "دروازه النخيل"),
                    Hotel(name: "سولار"),
                    Hotel(name: "فندق كورال"),
                    Hotel(name: "فندق لينا"),
                    Hotel(name: "فندق لي لي")
                    ]),
                  City(name: NSLocalizedString("17", comment:"الخبر"), image: "kh2", Hotels: [
                    Hotel(name: " لاريسا"),
                    Hotel(name: "كراون بلازا"),
                    Hotel(name: "جولدن بوجاري"),
                    Hotel(name: "وريزيدنس"),
                    Hotel(name: "مريديان"),
                    Hotel(name: "موفنبيك الخبر"),
                    Hotel(name: "ورويك الخبر")
                    ]),
                  City(name: NSLocalizedString("18", comment: "مكه"), image: "mk2", Hotels: [
                    Hotel(name: "فندق هيلتون"),
                    Hotel(name: "فندق لو مريديان"),
                    Hotel(name: "فندق دار التوحيد"),
                    Hotel(name: "فندق موفنبيك"),
                    Hotel(name: "فندق انجم"),
                    Hotel(name: "فندق فيوليت"),
                    Hotel(name: "فندق روشان الدار")
                    ]),
                  City(name: NSLocalizedString("19", comment:"حائل"), image: "ha2", Hotels: [
                    Hotel(name: "اروناني"),
                    Hotel(name: "ترامونتان"),
                    Hotel(name: "ميلينيوم"),
                    Hotel(name: "بودل"),
                    Hotel(name: "جولدن توليب"),
                    Hotel(name: "تميز الاقامه"),
                    Hotel(name: "ترحال")
                    ]),
                  City(name: NSLocalizedString("20", comment:"المدينة"), image: "md2", Hotels: [
                    Hotel(name: "انوار المدينه"),
                    Hotel(name: "لو مريديان"),
                    Hotel(name: "ماريوت"),
                    Hotel(name: "سيزون ستار"),
                    Hotel(name: "ارتال طيبه"),
                    Hotel(name: "روف"),
                    Hotel(name: "فيردان")
                    ]),
                  City(name: NSLocalizedString("21", comment: "تبوك"), image: "ta2", Hotels: [
                    Hotel(name: "بادن"),
                    Hotel(name: "هيدرا"),
                    Hotel(name: "ريلاكس داي"),
                    Hotel(name: "الحياه بيتا"),
                    Hotel(name: "رونزا"),
                    Hotel(name: "الحياه المارينا"),
                    Hotel(name: "تبوك ريزيدنس")
                    ]),
                  City(name: NSLocalizedString("22", comment: "الطائف"), image: "taa2", Hotels: [
                    Hotel(name: "انتركونتيننال "),
                    Hotel(name: "رماج"),
                    Hotel(name: "فيلارا ان"),
                    Hotel(name: "روهارا"),
                    Hotel(name: "الريف دايموند "),
                    Hotel(name: "اولاف انترناشونال"),
                    Hotel(name: "اريديوم")
                    ]),
                  City(name: NSLocalizedString("23", comment:"جازان"), image: "je2", Hotels: [
                    Hotel(name: "نوفوتيل جازان"),
                    Hotel(name: "رفايا"),
                    Hotel(name: "ماريوت جازان"),
                    Hotel(name: "انتور"),
                    Hotel(name: "اوج"),
                    Hotel(name: "زهره فيولا"),
                    Hotel(name: "الرست ان")
                    ])
]


//__________________


struct TPeople {
    let name: String
    let id: String
}

//var allRenter: Renters?
struct Renter {
    let name: String
    let id: String
    let timestamp: Timestamp
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: timestamp.dateValue())
    }

}


struct People {
    let name: String
    let id: String
    let image: String
    let crime: String
}
let list = [ People(name: "فهد علي", id: "١٠٤٣٢٣١٠٠٩", image: "i1", crime: "سرقه اموال"),
             People(name: "خالد سعود", id: "١٠٩٩١١٩٩٨٠", image: "i2", crime: "سرقه اموال"),
             People(name: "بدر عبدالله", id: "١٠٩٦١٢٣١٢١", image: "i3", crime: "سرقه اموال"),
             People(name: " بندر سعد", id: "١٠٠٢٣١٠١٢١", image: "i4", crime: "سرقه اموال"),
             People(name: " تركي فهد ", id: "١٠٩٩١١٢١٢٠", image: "i1", crime: "سرقه اموال")]


class Numbers {
    let name: String
    let number: Int
    let purpose: String
    let image: String
    
    init(name:String , number: Int , purpose: String , image: String) {
    self.name = name
    self.number = number
    self.purpose = purpose
    self.image = image
    }
}

let listNumber = [Numbers(name:  NSLocalizedString("2", comment: "الشرطه"), number: 999, purpose: "لجميع البلاغات ولطلب المساعده", image: "sh"),
                  Numbers(name: NSLocalizedString("3", comment: "مكافحة المخدرات"), number: 995, purpose: "لبلاغات جرائم المخدرات", image: "mkk"),
                  Numbers(name: NSLocalizedString("4", comment: "الدفاع المدني"), number: 998, purpose: "لبلاغات الحرائق والحوادث والغرق", image: "d"),
                  Numbers(name: NSLocalizedString("5", comment: "الهلال الأحمر "), number: 997, purpose: " لطلب المساعده للحالات المرضيه والحوادث ", image: "hl"),
                  Numbers(name: NSLocalizedString("6", comment: "حرس الحدود "), number: 994, purpose: "لبلاغات امن الحدود ومخالفي انظمه الاقامه", image: "hd"),
                  Numbers(name: NSLocalizedString("7", comment: "نجم  "), number: 920000560, purpose: "لبلاغات الحوادث وإجرائات مابعد الحادث", image: "nj"),
                  Numbers(name: NSLocalizedString("8", comment: "المرور"), number: 993, purpose: "في حال وجود مشكله مروريه",image: "mr"),
                  Numbers(name: NSLocalizedString("9", comment: "الطوارئ  "), number: 112, purpose: "لطلب المساعده والاتصال بالطوارئ دون الحاجه لوجود شريحه", image: "t"),
                  Numbers(name: NSLocalizedString("10", comment: "أمن الطرق"), number: 996, purpose: " لبلاغات انعدام امن الطرق ",image: "tr1"),
                  Numbers(name: NSLocalizedString("11", comment: " العمليات الامنيه الموحده"), number: 911, purpose: "لتقديم بلاغ او معلومه لوزارة الداخلية", image: "am")
                
]
struct Report {
    
    let name: String
    let id: String
    let timestamp: Timestamp
    
    func getNiceDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .medium
        return dateFormatter.string(from: timestamp.dateValue())
    }
    
}


var d: [String : Int] = ["Ahmad" : 21 ,
                         "Saad" : 34,
                         "Rami" : 32 ,
                         
]
let a: Set = ["a", "b"]
