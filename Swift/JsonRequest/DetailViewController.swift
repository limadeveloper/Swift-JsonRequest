//
//  DetailViewController.swift
//  JsonRequest
//
//  Created by John Lima on 11/19/15.
//  Copyright © 2015 limadeveloper. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // MARK: - Properties
    @IBOutlet fileprivate weak var tableView: UITableView!
    
    var country: Country?
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("capital: \(country?.capital ?? "")")
    }
    
    // MARK: - Actions
}
