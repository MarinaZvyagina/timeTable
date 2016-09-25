//
//  TableViewController.swift
//  timeTable
//
//  Created by Марина Звягина on 21.09.16.
//  Copyright © 2016 Марина Звягина. All rights reserved.
//

import UIKit

class Json {
    static func getJsonObjects()->AnyObject?{
        
        // Get URL for json file
        let bundle = NSBundle.mainBundle()
        let stationsURL = bundle.URLForResource("allStations", withExtension: "json")
        
        let stations = NSData(contentsOfURL: stationsURL!)
        
        var json: AnyObject? = nil
        do {
            json = try NSJSONSerialization.JSONObjectWithData(stations!, options: NSJSONReadingOptions())
            
        } catch {
            print(error)
        }
        return json
    }
    
    static func getCities(arrayOfCities: Array<AnyObject>)->Array<City>{
        var resultCities = Array<City>()
        for city in arrayOfCities {
            let curCity = City.getCityFromJson(city)
            resultCities.append(curCity)
        }
        return resultCities
    }
    
    static func formObjectsFromJson(json: AnyObject)->(Array<City>, Array<City>) {
        let citiesFromTo: Dictionary<String,AnyObject>!
        var citiesFrom: Array<AnyObject>
        var citiesTo: Array<AnyObject>
        
        var resultCitiesFrom = Array<City>()
        var resultCitiesTo = Array<City>()
        
        citiesFromTo = json as! Dictionary<String,AnyObject>
        citiesFrom = citiesFromTo["citiesFrom"] as! Array<AnyObject>
        citiesTo = citiesFromTo["citiesTo"] as! Array<AnyObject>
        
        resultCitiesFrom = getCities(citiesFrom)
        resultCitiesTo = getCities(citiesTo)
        
        let result = (resultCitiesFrom,resultCitiesTo)
        return result
    }
    
}

let json = Json.getJsonObjects()


class TableViewController: UIViewController,
    UITableViewDataSource, UITableViewDelegate
{
    //private var stations:[String]!
    
    @IBOutlet weak var fromField: UITextField!
    @IBOutlet weak var toField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedFrom = true;
    let timeTableId = "timeTable"
    let dataTree:(Array<City>, Array<City>) = Json.formObjectsFromJson(json!)

    
    @IBAction func ShowTableView(sender: UITextField) {
        if sender.tag==0 {
            selectedFrom = true;
        } else {
            selectedFrom = false
        }
        self.tableView.reloadData()
        tableView.hidden=false
    }
    
    @IBAction func HideTableView(sender: UITextField) {
        tableView.hidden=true
        
    }
    
    @IBAction func textFieldDoneEditing(sendler: UITextField) {
        sendler.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fromField.tag=0
        toField.tag=1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Hide keyboard when you touch on screen
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if touches.first != nil {
            view.endEditing(true)
        }
        super.touchesBegan(touches, withEvent: event)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // TODO
        let count : Int
        if selectedFrom {
            count = dataTree.0[0].stations.count
        } else {
            count = dataTree.1[2].stations.count
        }
        return count
    }
    
    func order(st1:Station, st2:Station)->Bool {
        return st1.cityTitle < st2.cityTitle
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let curCell: UITableViewCell
        
        //return UITableViewCell()
        if let tmpCell = tableView.dequeueReusableCellWithIdentifier(timeTableId) {
            curCell=tmpCell
            
        } else {
            curCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: timeTableId)
        }
        
        let station: [Station]
        
        if selectedFrom {
            station = dataTree.0[0].stations.sort(order)
        } else {
            station = dataTree.1[2].stations.sort(order)
        }
        let needSt = station[indexPath.row]
        
        curCell.textLabel?.text = needSt.stationTitle
        
       //     = tableView.dequeueReusableCellWithIdentifier(timeTableId) as? UITableViewCell
        
        return curCell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let station: [Station]
        
        if selectedFrom {
            station = dataTree.0[0].stations.sort(order)
            fromField.text = station[indexPath.row].stationTitle
        } else {
            station = dataTree.1[2].stations.sort(order)
            toField.text = station[indexPath.row].stationTitle
        }
        
    }

}
