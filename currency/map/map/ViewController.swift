//
//  ViewController.swift
//  map
//
//  Created by mymac on 23.11.2017.
//  Copyright © 2017 mymac. All rights reserved.
//


import UIKit
import MapKit

class ViewController: UIViewController {
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "http://resources.finance.ua/ru/public/currency-cash.json"
        guard let url = URL(string: urlString) else { return }
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error)  in
            
            guard let data = data else { return }
            guard error == nil else { return }
            do {
                let jsonprint = try JSONDecoder().decode(JsonFinanceUA.self, from: data)
                print(jsonprint)
//                Could not inset legal attribution from corner 4
//                typeMismatch(Swift.Dictionary<Swift.String, Any>, Swift.DecodingError.Context(codingPath: [map.JsonFinanceUA.(CodingKeys in _AE1FDAE83CA4EB0C0F893358FDBA18EC).organizations], debugDescription: "Expected to decode Dictionary<String, Any> but found an array instead.", underlyingError: nil))

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

