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
    
    var addressOfficePlaces: [CLPlacemark] = []
    let geocoder = CLGeocoder()
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.privatbank.ua/p24api/pboffice?json&city=&address="
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let jsonprint = try JSONDecoder().decode([JsonPrivat].self, from: data)
//                        print(jsonprint)
                for item in jsonprint {
                    let addres = "\(item.country!), \(item.city!), \(item.address!)"
                   
                    self.geocoder.geocodeAddressString(addres, completionHandler: { (placemark, error) in
                        self.converterPlacemarkArray(placemark: placemark)
                    })
                    
                }
                
                
                
            } catch let error{
                print(error)
            }
        }.resume()
       
    }
    func converterPlacemarkArray(placemark:[CLPlacemark]?){
        var location: CLLocation?
        
        location = placemark?.first?.location
        
            if let location = location {
                let cordinate = location.coordinate
                print("\(cordinate.latitude), \(cordinate.longitude)")
            }else{
                print("No location")
            }
            
        }
    
    


}


