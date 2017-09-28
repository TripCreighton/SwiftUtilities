//
//  JSONManager.swift
//  My15Seconds
//
//  Created by Trip Creighton on 5/5/17.
//  Copyright © 2017 Trip Creighton. All rights reserved.
//

import Foundation
import SystemConfiguration

class JSONManager {
    private static var url:URLRequest? = nil,
                       session:URLSession? = nil
    
    static func makeRequest(forURL: String, method: String = "GET", completion: @escaping (NSDictionary) -> ()) {
        self.url = URLRequest(url: URL(string: forURL)!)
        
        // Setup session:
        session = URLSession(configuration: URLSessionConfiguration.default, delegate: nil, delegateQueue: nil)
        self.url?.httpMethod = method
        
        // Start fetch:
        session?.dataTask(with: self.url!, completionHandler: { data, response, error in
             if data == nil { return }
            DispatchQueue.main.async {
                do {
                    let jsonObject = try? JSONSerialization.jsonObject(with: data!, options: [])
                    if let dict = jsonObject as? NSDictionary {
                        completion(dict)
                        return
                    }
                    completion(NSDictionary())
                }
                
            }
        }).resume()
    }
    
    // Connects to a URL, ideal for posting data expecting no response:
    static func makeRequest(forURL: String) {
        session = URLSession(configuration: .default, delegate: nil, delegateQueue: nil)
        self.url = URLRequest(url: URL(string: forURL)!)
        self.url?.httpMethod = "POST"
        
        session?.dataTask(with: self.url!).resume()
    }
    
    static func update(forURL: String, interval: TimeInterval, callback: @escaping (NSDictionary) -> ()) {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { (timer) in
            makeRequest(forURL: forURL, method: "GET", completion: { (dict) in
                callback(dict)
            })
        }
    }
}
