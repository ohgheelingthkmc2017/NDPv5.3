//
//  Record.swift
//  Tables
//
//  Created by Oh Ghee Ling on 18/7/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class Record: NSObject {
    var recordID = ""
    var recordName = ""
    var recordDesc = ""
    var imageName = ""
    var runtime = 0
    
    
    init( _ recordID: String, _ recordName: String, _ recordDesc: String, _ imageName:String, _ runtime:Int)
    {
        self.recordID = recordID
        self.recordName = recordName
        self.recordDesc = recordDesc
        self.imageName = imageName
        self.runtime = runtime
    }
}
