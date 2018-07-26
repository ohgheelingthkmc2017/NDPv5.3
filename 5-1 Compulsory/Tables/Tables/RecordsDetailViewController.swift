//
//  RecordsDetailViewController.swift
//  Tables
//
//  Created by Oh Ghee Ling on 18/7/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class RecordsDetailViewController: UIViewController {
    var recordItem : Record?
    
    @IBOutlet weak var recordIDTextField: UITextField!
    
    
    @IBOutlet weak var imageNameTextField: UITextField!
   
    
    @IBOutlet weak var recordNameTextField: UITextField!
    
    
    @IBOutlet weak var runtimeTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        if recordItem != nil
        {
        //Assigns the fields from the movie object to all
        //The text fields on the screen
        //Display on the Records  Detail View Controller User Interface
            
            recordIDTextField.text = recordItem!.recordID
            recordNameTextField.text = recordItem!.recordName
            imageNameTextField.text = recordItem!.imageName
            runtimeTextField.text = "\(recordItem!.runtime)"
            descriptionTextField.text = recordItem!.recordDesc
            //Add logic to prevent user from modifying movieID field
            if recordItem!.recordID != ""
            {
                recordIDTextField.isEnabled = false
            }
        }
        //Add this line to show the record's title in the Navigation Bar
        self.navigationItem.title = recordItem!.recordName
    }
    override var prefersStatusBarHidden: Bool {
        get
        {
            return false
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func saveButtonPressed(_ sender: Any) {
        //Validate to ensure all fields are entered by the user. If not, we show an alert.
        if recordIDTextField.text == "" ||
           recordNameTextField.text == "" ||
           descriptionTextField.text == "" ||
           imageNameTextField.text == "" ||
           runtimeTextField.text == ""
        {
            let alert = UIAlertController(
                title: "Please enter all fields",
                message: "",
                preferredStyle: UIAlertControllerStyle.alert
            )
            alert.addAction(UIAlertAction(title:"OK",
                style: UIAlertActionStyle.default,
                handler: nil)
            )
            self.present(alert,animated: true, completion: nil)
            return
        }
         //Assigns the values entered by the user into our Record object
        
            recordItem!.recordID = recordIDTextField.text!
            recordItem!.recordName = recordNameTextField.text!
            recordItem!.recordDesc = descriptionTextField.text!
            recordItem!.imageName = imageNameTextField.text!
        //Convert int into text string using Int's initialiser
        
        let runtime = Int(runtimeTextField.text!)
        recordItem!.runtime = runtime != nil ? runtime! : 0
        
        //Call the DataManager to insert the Record into database or replace
        //existing one with same recordID
        //Execute the SQL to insert data into database
        DataManager.insertOrReplaceRecord(record: recordItem!)
        
        //Call the root view controller's table view to refresh itself
        
        var viewControllers = self.navigationController?.viewControllers
        let parent = viewControllers?[5] as! DatabaseViewController
        //retrieve the parent view controller to reload the Movies from
        //SQLite Database and reload table View
        
        parent.recordList = DataManager.loadRecords()
        parent.tableView?.reloadData()
        //Close the View Controller to pop back out to
        //view controller that shows list of movies
        self.navigationController?.popViewController(animated: true)
        }
    
}
