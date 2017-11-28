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
    
    var addressOfficePlaces: [String] = []
    var geocoder = CLGeocoder()
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
//                print(jsonprint)
               
                for item in jsonprint{
                    self.addressOfficePlaces = ["\(item.country!), \(item.city!), \(item.address!)"]
//                    print(self.addressOfficePlaces)
                    for base in self.addressOfficePlaces{
                        self.geocoder.geocodeAddressString(base, completionHandler: { (placemarks, error) in
                            print("\(String(describing: placemarks?.count))")
                        })
                        print("\(base)")
                       
                    }
                }
//                let geoCoder = CLGeocoder()

            } catch let error{
                print(error)
            }
        }.resume()
        
        
    }
    func arrayPlacemarks(placemarks: [CLPlacemark]?, error: Error?){
      
      
    }
    

}


