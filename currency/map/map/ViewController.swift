//
//  ViewController.swift
//  map
//
//  Created by mymac on 23.11.2017.
//  Copyright © 2017 mymac. All rights reserved.
//


import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
     var plass:[ExchangePlace] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jsonApiPrivatBank()
        
    }
   
    func jsonApiPrivatBank(){
        
        let urlString = "https://api.privatbank.ua/p24api/infrastructure?json&tso&address=&city="
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let jsonprint = try JSONDecoder().decode(JsonPrivat.self, from: data)
                
                
                for item in [jsonprint] {
                    for devices in jsonprint.devices{
                        if item.city == "Днепропетровск"{
                        let cordinate = CLLocationCoordinate2D(latitude: Double(String(describing: devices.latitude))!, longitude: Double(String(describing: devices.longitude))!)
                        let ex = ExchangePlace(city: item.city!, address: item.address!, type: devices.type!, cityRU: devices.cityRU!, fullAddressRu: devices.fullAddressRu!, placeUa: devices.placeUa!, cordinate: cordinate)
                        self.plass.append(ex)
                        }
                    }
                    
                }
                print(self.plass)
                self.geoCodAllPlace()
            } catch let error{
                print(error)
            }
            }.resume()
    }
   
    func geoCodAllPlace(){
        mapView.addAnnotation(plass)
        print(plass)
    }
//    func updateUI(){
//        print(plass)
//    }
//
//    func converterPlacemarkArray(placemark:[CLPlacemark]?){
//        var location: CLLocation?
//
//        location = placemark?.first?.location
//
//            if let location = location {
//                let cordinate = location.coordinate
//                locationArray.append(cordinate)
//                print(locationArray)
//                print("\(cordinate.latitude), \(cordinate.longitude)")
//            }else{
//                print("No location")
//            }
//
//        }
}


