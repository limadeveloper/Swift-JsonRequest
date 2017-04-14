//
//  JsonModel.swift
//  JsonRequest
//
//  Created by John Lima on 11/18/15.
//  Copyright © 2015 John Lima. All rights reserved.
//

import UIKit

class JsonModel: NSObject {
    
    var API = "https://restcountries.eu/rest/v1/all"
    
    // ------------------------------------------------------------------------------------
    
    func downloadJSONFromURL(completion: (json: NSArray?) -> ()) {
        let request = NSURLRequest(URL: NSURL(string: API)!)
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request) { (data, response, error) -> Void in
            let httpResponse = response as! NSHTTPURLResponse
            switch httpResponse.statusCode {
            case 200:
                do {
                    let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? NSArray
                    completion(json: json!)
                    
                }catch {
                    print("error: \(error)")
                }
                break
            default:
                print("error with status code: \(httpResponse.statusCode)")
                break
            }
        }
        task.resume()
    }
    
    // ------------------------------------------------------------------------------------
    
}
