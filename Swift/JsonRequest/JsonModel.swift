//
//  JsonModel.swift
//  JsonRequest
//
//  Created by John Lima on 11/18/15.
//  Copyright © 2015 limadeveloper. All rights reserved.
//

import UIKit
import Gloss

struct Country: Decodable {
    
    var area: Double?
    var capital: String?
    var name: String?
    var nativeName: String?
    var population: Int?
    var region: String?
    var relevance: String?
    var subregion: String?
    
    init() {}
    
    init?(json: JSON) {
        
        self.area = Keys.area <~~ json
        self.capital = Keys.capital <~~ json
        self.name = Keys.name <~~ json
        self.nativeName = Keys.nativeName <~~ json
        self.population = Keys.population <~~ json
        self.region = Keys.region <~~ json
        self.relevance = Keys.relevance <~~ json
        self.subregion = Keys.subregion <~~ json
    }
}

extension Country {
    
    struct API {
        static let countries = "https://restcountries.eu/rest/v1/all"
    }
    
    struct Keys {
        static let area = "area"
        static let capital = "capital"
        static let name = "name"
        static let nativeName = "nativeName"
        static let population = "population"
        static let region = "region"
        static let relevance = "relevance"
        static let subregion = "subregion"
    }
}

extension Country {

    func downloadJSONFromURL(completion: (([Country]?, String?) -> ())?) {
        
        var result = [Country]()
        let request = URLRequest(url: URL(string: API.countries)!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) { (data, response, error) in
            
            guard let data = data, error == nil else { completion?(nil, error?.localizedDescription); return }
            
            do {
                
                let jsonData = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [JSON]
                
                guard let jsonArray = jsonData, jsonArray.count > 0 else { completion?(nil, error?.localizedDescription); return }
                
                print("JSON: \(jsonArray as NSArray)")
                
                for j in 0 ..< jsonArray.count {
                    
                    guard let country = Country(json: jsonArray[j]) else { continue }
                    result.append(country)
                    
                    if j == jsonArray.count-1 {
                        completion?(result, nil)
                    }
                }
                
            }catch {
                completion?(nil, error.localizedDescription)
            }
        }
        
        task.resume()
    }
}
