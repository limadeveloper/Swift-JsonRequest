//
//  ViewController.swift
//  JsonRequest
//
//  Created by John Lima on 11/18/15.
//  Copyright © 2015 limadeveloper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // Mark: - Properties
    @IBOutlet fileprivate weak var tableView: UITableView!
    @IBOutlet fileprivate weak var countButton: UIBarButtonItem!
    
    fileprivate var refreshControl = UIRefreshControl()
    fileprivate var model = Country()
    fileprivate var tableData: Array<Country>?
    fileprivate let cellName = "cell"
    
    // Mark: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        updateUI()
    }

    // Mark: - Actions
    fileprivate func updateUI() {
        
        countButton.title = "\((tableData ?? []).count)"
        
        let back = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = back
        
        let footer = UIView(frame: .zero)
        tableView.tableFooterView = footer
        tableView.backgroundColor = .white
        tableView.reloadData()
    }
    
    fileprivate func getData() {
        
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        model.downloadJSONFromURL { (countries, error) in
            
            guard let countries = countries, countries.count > 0 else { return }
            self.tableData = countries
            
            DispatchQueue.main.async {
                self.updateUI()
                self.createRefresh()
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
            }
        }
    }
    
    fileprivate func createRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        refreshControl.addTarget(self, action: #selector(refresh(sender:)), for: .valueChanged)
        tableView.addSubview(refreshControl)
    }
    
    dynamic fileprivate func refresh(sender: UIRefreshControl) {
        getData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (tableData ?? []).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellName, for: indexPath)
        
        cell.textLabel?.text = tableData?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: Segue.details, sender: indexPath)
    }
}

extension ViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case Segue.details:
                guard let indexPath = sender as? IndexPath else { return }
                let controller = segue.destination as? DetailViewController
                controller?.country = tableData?[indexPath.row]
            default:
                break
            }
        }
    }
}

