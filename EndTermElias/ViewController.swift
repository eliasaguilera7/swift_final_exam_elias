//
//  ViewController.swift
//  EndTermElias
//
//  Created by Elias Aguilera Yambay on 2020-07-29.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      let urlString = "http://newsapi.org/v2/everything?q=bitcoin&from=2020-06-29&sortBy=publishedAt&apiKey=API_KEY"
        
        let url = URL(string: urlString)
        guard url != nil else {
            return
        }
        let session = URLSession.shared
        
        //let dataTask = session.dataTask(with: url!){ (data, response, error) } in
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            if error == nil && data != nil {
            // Parse JSON
                let decoder = JSONDecoder()
                
                    do{
                        let newsFeed = try decoder.decode(NewsFeed.self, from: data! )
                        print(newsFeed)
                    }
                    catch {
                        print("Error in JSON Parsing")
                    }
                    
                }
                       }
         dataTask.resume()
        }
    
           
    
    
    }
        
     


