//
//  DetailViewController.swift
//  JsonRequest
//
//  Created by John Lima on 11/19/15.
//  Copyright © 2015 John Lima. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - properties
    @IBOutlet var tableView: UITableView!
    
    var tableData = NSArray()
    
    // MARK: - view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - actions
    func setView() {
        
        for var i=0; i < tableData.count; i++ {
            title = tableData[i].valueForKey("name") as? String
        }
        
        let background = UIView(frame: CGRectZero)
        tableView.tableFooterView = background
        tableView.backgroundColor = UIColor.groupTableViewBackgroundColor()
        
    }
    
    // MARK: - table view datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let region = cell.viewWithTag(5) as? UILabel
        let subregion = cell.viewWithTag(1) as? UILabel
        let population = cell.viewWithTag(2) as? UILabel
        let capital = cell.viewWithTag(3) as? UILabel
        let area = cell.viewWithTag(4) as? UILabel
        
        let stringRegion = tableData[indexPath.row].valueForKey("region") as! String
        let stringsubregion = tableData[indexPath.row].valueForKey("subregion") as! String
        let stringPopulation = tableData[indexPath.row].valueForKey("population") as! Int
        let stringCapital = tableData[indexPath.row].valueForKey("capital") as! String
        let stringArea = tableData[indexPath.row].valueForKey("area") as! Int
        
        region?.text = "Region: \(stringRegion)"
        subregion?.text = "Subregion: \(stringsubregion)"
        population?.text = "Population: \(stringPopulation)"
        capital?.text = "capital: \(stringCapital)"
        area?.text = "Area: \(stringArea)"
        
        return cell
        
    }

}
