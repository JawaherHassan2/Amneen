//
//  CentersLocations.swift
//  SeqApp
//
//  Created by Jawaher🌻 on 01/05/1443 AH.
//



import UIKit
 import MapKit

 class CentersLocations: UIViewController {
    
     let mapV : MKMapView = {
         let map = MKMapView()
         map.overrideUserInterfaceStyle = .light
         return map
     }()

     override func viewDidLoad() {
         super.viewDidLoad()

         mapV.delegate = self
         self.placePins()
         self.configureMap()
         
         view.addSubview(mapV)
         mapV.translatesAutoresizingMaskIntoConstraints = false
         NSLayoutConstraint.activate([
            mapV.topAnchor.constraint(equalTo: view.topAnchor),
            mapV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mapV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapV.trailingAnchor.constraint(equalTo: view.trailingAnchor)
         ])
        }
     
     func placePins() {
         let coords = [CLLocationCoordinate2D(latitude: 18.228034600624262, longitude: 42.53531466849262),
                       CLLocationCoordinate2D(latitude: 18.258049238668637, longitude: 42.554787286197666),
                       CLLocationCoordinate2D(latitude: 18.199531060040876, longitude: 42.538826124144336),
                       CLLocationCoordinate2D(latitude: 18.257746086423168, longitude: 42.48647351260942),
                       CLLocationCoordinate2D(latitude: 18.206202519625343, longitude: 42.521907292367814),
                       CLLocationCoordinate2D(latitude: 18.216597093089852, longitude: 42.490657647171304),
         
                       CLLocationCoordinate2D(latitude: 18.22376130088823, longitude: 42.50321800611629),
                       CLLocationCoordinate2D(latitude: 18.203544029246693, longitude: 42.50285025435469),
                       CLLocationCoordinate2D(latitude: 18.224282012613937, longitude: 42.52018976262652),
                       CLLocationCoordinate2D(latitude: 18.231208482590667, longitude: 42.488072181930626),
                       CLLocationCoordinate2D(latitude: 18.23713572646167, longitude: 42.498049543215124),
                       CLLocationCoordinate2D(latitude: 18.22580600492419, longitude: 42.56095497418447),
                    
                       
         ]
         let titles = [  NSLocalizedString("57", comment:"مركز شرطه شرق ابها"),
                         NSLocalizedString("58", comment:"مديريه شرطه منطقه عسير") ,
                         NSLocalizedString("59", comment:"مركز المعلومات الوطني ابها"),
                         NSLocalizedString("60", comment:"مركز شرطه غرب ابها")  ,
                         NSLocalizedString("61", comment:"مركز الشرطه المدنيه")
                         ,NSLocalizedString("62", comment:"مركز شرطه وسط ابها")
                         
                         ,NSLocalizedString("63", comment:"مركز دفاع مدني شمسان")
                         ,NSLocalizedString("64", comment:"الدفاع المدني بغرب ابها")
                         ,NSLocalizedString("65", comment:"مديريه الدفاع المدني بمنطقه عسير")
                         ,NSLocalizedString("66", comment:"الشعبه الميدانيه للدفاع المدني غرب ابها")
                         ,NSLocalizedString("67", comment:"مركز الهلال الاحمر")
                         ,NSLocalizedString("67", comment:"مركز الهلال الاحمر")
                         //                       ,""
//                       ,""
//                       ,""
         ]
         for i in coords.indices {
             let annotation = MKPointAnnotation()
             annotation.coordinate = coords[i]
             annotation.title = titles[i]
             mapV.addAnnotation(annotation)
         }
     }
     func configureMap() {
       
         let center = CLLocationCoordinate2D(latitude:  18.222302509549063, longitude: 42.51460111562375)
         let span = MKCoordinateSpan(latitudeDelta: 0.125, longitudeDelta: 0.125)
         let region = MKCoordinateRegion(center: center, span: span)
         mapV.setRegion(region, animated: true)
         self.placePins()
     }
     
     
     
     func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
         let annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "MyMarker")

         
        
         switch annotation.title!! {
             case  NSLocalizedString("57", comment:"مركز شرطه شرق ابها"):
                 annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
                 annotationView.glyphImage = UIImage(named: "2")
//        
             case   NSLocalizedString("58", comment:"مديريه شرطه منطقه عسير") :
                 annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
                 annotationView.glyphImage = UIImage(named: "2")
        case  NSLocalizedString("59", comment:"مركز المعلومات الوطني ابها"):
                 annotationView.markerTintColor = UIColor(red: (102/255), green: (126/255), blue: (145/255), alpha: 1.0)
                 annotationView.glyphImage = UIImage(named: "center3")
             case  NSLocalizedString("60", comment:"مركز شرطه غرب ابها"):
                 annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
                 annotationView.glyphImage = UIImage(named: "2")
         case  NSLocalizedString("61", comment:"مركز الشرطه المدنيه"):
             annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
             annotationView.glyphImage = UIImage(named: "2")
         case NSLocalizedString("62", comment:"مركز شرطه وسط ابها"):
             annotationView.markerTintColor = UIColor(red: (52.0/255), green: (114.0/255), blue: (1.0/255), alpha: 1.0)
             annotationView.glyphImage = UIImage(named: "2")
     
   
         case NSLocalizedString("63", comment:"مركز دفاع مدني شمسان"):
             annotationView.markerTintColor =  #colorLiteral(red: 0.7770078778, green: 0.7983751893, blue: 0.1321480274, alpha: 1)
             annotationView.glyphImage = UIImage(named: "06")
         case NSLocalizedString("64", comment:"الدفاع المدني بغرب ابها"):
             annotationView.markerTintColor =  #colorLiteral(red: 0.7770078778, green: 0.7983751893, blue: 0.1321480274, alpha: 1)
             annotationView.glyphImage = UIImage(named: "06")
         case NSLocalizedString("65", comment:"مديريه الدفاع المدني بمنطقه عسير"):
             annotationView.markerTintColor =  #colorLiteral(red: 0.7770078778, green: 0.7983751893, blue: 0.1321480274, alpha: 1)
         annotationView.glyphImage = UIImage(named: "06")
     case NSLocalizedString("66", comment:"الشعبه الميدانيه للدفاع المدني غرب ابها"):
         annotationView.markerTintColor =  #colorLiteral(red: 0.7770078778, green: 0.7983751893, blue: 0.1321480274, alpha: 1)
         annotationView.glyphImage = UIImage(named: "06")
             
             
         case NSLocalizedString("67", comment:"مركز الهلال الاحمر"):
         annotationView.markerTintColor =  #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
         annotationView.glyphImage = UIImage(named: "09")
         case NSLocalizedString("67", comment:"مركز الهلال الاحمر"):
         annotationView.markerTintColor =  #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
         annotationView.glyphImage = UIImage(named: "09")
             
             default:
                 annotationView.markerTintColor = UIColor.blue
         }
         return annotationView
     }
     }

extension CentersLocations: MKMapViewDelegate, CLLocationManagerDelegate {
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView){
        guard let annotation = view.annotation as? MKPointAnnotation else {
            return
        }
    

        print(annotation.title)
//        switch annotation.title {
//
//        case: .
//        }
//        if let url = URL(string: "https://www.google.com/maps/place//data=!4m2!3m1!1s0x15fcab31969e6d91:0xf3806fdd52d95002?entry=s&sa=X&hl=ar-sa&ved=2ahUKEwje7NiO0s70AhUfQvEDHccyBJ4Q4kB6BAgcEAI") {
//            UIApplication.shared.open(url)
//        }
        
    }
    
}

