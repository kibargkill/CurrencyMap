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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.privatbank.ua/p24api/pboffice?json&city=&address="
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let jsonprint = try JSONDecoder().decode([JsonPrivat].self, from: data)
                print(jsonprint)

                
               
//                let geoCoder = CLGeocoder()
//                geoCoder.geocodeAddressString("524 Ct St,Brooklyn, NY 11231", completionHandler: { placemarks, error in
//                    let coordinate = placemarks.location?.cordinate
//                })
            

            } catch let error{
                print(error)
            }
        }.resume()
        
       
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}


