//
//  TabData.swift
//  Interface
//
//  Created by Minh Huynh on 9/17/18.
//  Copyright © 2018 Minh Huynh. All rights reserved.
//

import UIKit

class TabDataArray: NSObject {
    
    public var tabDataArray : NSMutableArray!
    
    class TabData: NSObject {
        var image: String!
        var title: String!
        
        init(image: String, title: String) {
            self.image = image
            self.title = title
        }
    }
    
    func add(image: String, title: String) {
        let tabData = TabData(image: image, title: title)
        tabDataArray.add(tabData)
    }
    
}
