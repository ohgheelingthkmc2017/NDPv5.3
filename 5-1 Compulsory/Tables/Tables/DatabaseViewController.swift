//
//  DatabaseViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 18/7/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class DatabaseViewController: UIViewController, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var recordList : [Record] = []
    //hypothetical records which I don't know how to save after singing and recording//
    let headers : [String] = ["Singles","Duet and Mixed"]
    
    //var data : [Record] = []
        /*[Record("One United People","0.33 min","OneUnitedPeopleSS"),
                Record("Our Singapore","0.40 min","OurSingaporeJJL"),
                Record("Home","0.35 min", "HomeKC"),
                Record("Shine For Singapore", "0.30 min", "ShineForSingaporeHM"),
                Record("Love At First Light","0.35 min", "LoveAtFirstSightNO"),
                Record("NDP Song 2018", "0.40 min", "NDP2018")]*/
                 
                 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordList.count
        //return data[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        //return data.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellrecord", for: indexPath) as! CustomCellRecord
        cell.databaseLabel.text = recordList[indexPath.row].recordName
        cell.length.text = "\(recordList[indexPath.row].runtime)_mins"
        //cell.length.text = data[indexPath.section][indexPath.row].recordLength
        cell.recordImage.image = UIImage(named: recordList[indexPath.row].imageName)
       
        return cell
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
    func tableView(_tableView:UITableView, didSelectRowAt indexPath:IndexPath){
        //print("\(data[indexPath.row])")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //When the application first starts, create the database with necessary tables
        DataManager.createDatabase()
        //Loads a list of records from the database
        recordList = DataManager.loadRecords()
        
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == . delete
        { let record = recordList[indexPath.row]
            recordList.remove(at: indexPath.row)
            //Here we delete the record from the database and reload the recordList array again
            DataManager.deleteRecord(record: record)
            recordList = DataManager.loadRecords()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            
        }
        
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if (segue.identifier == "EditRecordDetails")
        {
            let detailViewController = segue.destination as! RecordsDetailViewController
            let myIndexPath = self.tableView.indexPathForSelectedRow
            if(myIndexPath != nil)
            {
                let record = recordList[myIndexPath!.row]
                detailViewController.recordItem  = record
            }
        }
        
        //Here we check for the AddRecordDetails segue, which is triggered by user clicking on the "+" button on the top of navigation bar
        if (segue.identifier == "AddRecordDetails")
        {
            let detailViewController = segue.destination as! RecordsDetailViewController
            let record = Record("" ,  "" , "" , "", 0 )
            detailViewController.recordItem = record
        }
    }
    
    /*
    @IBAction func editButtonPressed(_ sender: Any)
    {
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing
        {
            editBarButtonItem.title =  "Done"
        }
        else
        {
            editButtonItem.title = "Edit"
        }
    }
    */

    @IBOutlet weak var editBarButtonItem: UIBarButtonItem!
    
    @IBAction func editButtonPressed(_ sender: Any) {
        tableView.setEditing(!tableView.isEditing, animated: true)
        if tableView.isEditing
        {
            editBarButtonItem.title =  "Done"
        }
        else
        {
            editButtonItem.title = "Edit"
        }
    }
}
