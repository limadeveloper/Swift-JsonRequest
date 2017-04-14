//
//  DetailsTableViewCell.swift
//  JsonRequest
//
//  Created by John Lima on 14/04/17.
//  Copyright © 2017 limadeveloper. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet fileprivate weak var name: UILabel!
    @IBOutlet fileprivate weak var nativeName: UILabel!
    @IBOutlet fileprivate weak var capital: UILabel!
    @IBOutlet fileprivate weak var area: UILabel!
    @IBOutlet fileprivate weak var population: UILabel!
    @IBOutlet fileprivate weak var region: UILabel!
    @IBOutlet fileprivate weak var relevance: UILabel!
    @IBOutlet fileprivate weak var subregion: UILabel!
    
    fileprivate var country: Country? {
        didSet {
            
            guard let country = country else { return }
            
            name.text = "Name: \(country.name ?? "---")"
            nativeName.text = "Native Name: \(country.nativeName ?? "---")"
            capital.text = "Capital: \(country.capital ?? "---")"
            area.text = "Area: \(country.area ?? 0)"
            population.text = "Population: \(country.population ?? 0)"
            region.text = "Region: \(country.region ?? "---")"
            relevance.text = "Relevance: \(country.relevance ?? "---")"
            subregion.text = "Sub Region: \(country.subregion ?? "---")"
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    func setup(detail: Country) {
        self.country = detail
    }
}
