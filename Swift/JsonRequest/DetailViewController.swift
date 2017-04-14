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
    
    fileprivate let cellName = "cell"
    
    var country: Country?
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    // MARK: - Actions
    fileprivate func updateUI() {
    
        let footer = UIView(frame: .zero)
        tableView.tableFooterView = footer
        tableView.backgroundColor = .white
    }
}

extension DetailViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath) as? DetailsTableViewCell
        
        guard let data = country else { return UITableViewCell() }
        cell?.setup(detail: data)
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
