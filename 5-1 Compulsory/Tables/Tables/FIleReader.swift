//
//  FIleReader.swift
//  Tables
//
//  Created by Oh Ghee Ling on 10/6/18.
//  Copyright © 2018 NYP. All rights reserved.
//

import UIKit

class FileReader: NSObject {

    func readFiles() -> [String]
    {
        return Bundle.main.paths(forResourcesOfType: "mp3", inDirectory: nil)
        
    }
    
}


