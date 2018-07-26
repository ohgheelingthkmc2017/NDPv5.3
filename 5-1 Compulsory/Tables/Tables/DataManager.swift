//
//  DataManager.swift
//  Tables
//
//  Created by Oh Ghee Ling on 17/7/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    static func createDatabase()
    {
        SQLiteDB.sharedInstance.execute(sql:
            "CREATE TABLE IF NOT EXISTS " +
                "Records ( " +
                "   recordID text primary key, " +
                "   recordName text, " +
                "   recordDescription  text, " +
                "   runtime int, " +
                "   imagePath text  " +
                ")"
    )
    }
    static func loadRecords() -> [Record]
    {
        let recordRows = SQLiteDB.sharedInstance.query(sql:
        "SELECT recordID, recordName, " +
        "recordDescription, runtime, imagePath " +
        "FROM Records "
        )
        
        var records : [Record] = []
        for row in recordRows
        {
            records.append(
                Record(
                   row["recordID"] as! String,
                   row["recordName"] as! String,
                   row["recordDescription"] as! String,
                   row["imagePath"] as! String,
                   row["runtime"] as! Int
            ))
        }
        return records
    }
    
    static func insertOrReplaceRecord(record : Record)
    {
        SQLiteDB.sharedInstance.execute(sql:
            "INSERT OR REPLACE INTO Records (recordID, " +
            "recordName, recordDescription, runtime, imagePath)" +
            "VALUES(?, ?, ?, ?, ?)",
            
        parameters: [
        record.recordID,
        record.recordName,
        record.recordDesc,
        record.runtime,
        record.imageName
        ]
        )
        
    }
    
    static func  deleteRecord(record: Record)
    {
        SQLiteDB.sharedInstance.execute(sql:
        "DELETE FROM Records WHERE RecordID = ?",
        parameters: [record.recordID]
        )
        
    }
}

