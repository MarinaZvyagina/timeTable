//
//  TableViewController.swift
//  timeTable
//
//  Created by Марина Звягина on 21.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import UIKit

class TableViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate
{
    private var stations:[String]!
    
    let timeTableId = "timeTable"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Additional settings after loading
        let bundle = NSBundle.mainBundle()
        let plistURL = bundle.URLForResource("allStations", withExtension: "json")
        
        stations = 
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // return numberOfRows
        // TODO
        return 2;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell:UITableViewCell
        if let tmpCell = tableView.dequeueReusableCellWithIdentifier(timeTableId) {
            
        }
       //     = tableView.dequeueReusableCellWithIdentifier(timeTableId) as? UITableViewCell
        
    }

}
