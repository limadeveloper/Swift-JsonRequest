//
//  ViewController.swift
//  JsonRequest
//
//  Created by John Lima on 11/18/15.
//  Copyright © 2015 John Lima. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // mark: properties
    @IBOutlet var tableView: UITableView!
    @IBOutlet var countries: UIBarButtonItem!
    
    var refreshControl = UIRefreshControl()
    let app = UIApplication.sharedApplication()
    
    var tableData = NSArray()
    
    // mark: view lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData()
        setView()
        createRefresh()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    // mark: - actions
    func setView() {
        
        countries.title = "\(numberOfCountries())"
        
        let back = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
        navigationItem.backBarButtonItem = back
    }
    
    func getData() {
        app.networkActivityIndicatorVisible = true
        let json = JsonModel()
        json.downloadJSONFromURL { (json) -> () in
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableData = json!
                print("table data: \(self.tableData)")
                self.tableView.reloadData()
                self.setView()
                self.app.networkActivityIndicatorVisible = false
            })
        }
    }
    
    func createRefresh() {
        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: "refresh:", forControlEvents: .ValueChanged)
        tableView.addSubview(refreshControl)
    }
    
    func refresh(sender:AnyObject) {
        getData()
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    func numberOfCountries() -> Int {
        var num = Int()
        num = tableData.count
        return num
    }
    
    // mark: - table view datasource
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.textLabel?.text = tableData.objectAtIndex(indexPath.row).valueForKey("name") as? String
        return cell
    }
    
    // mark: - table view delegate
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("index: \(indexPath.row)")
        performSegueWithIdentifier("details", sender: indexPath.row)
    }

    // mark: - segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "details" {
            let index = sender as! Int
            let vc = segue.destinationViewController as! DetailViewController
            vc.tableData = [tableData.objectAtIndex(index) as! NSDictionary]
        }
    }
}

