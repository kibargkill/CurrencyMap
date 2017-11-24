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
                _ = try JSONDecoder().decode(JsonFinanceUA.self, from: data)
                
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

