//
//  MoreMenuModel.swift
//  AC-Tech-TakeHomeProject
//
//  Created by Alexei Sitalov on 9/15/19.
//  Copyright © 2019 Alexei Sitalov. All rights reserved.
//

import Foundation

class MoreMenuModel: NSObject, NSCoding {
    let title: String
    var activeState: Bool
    
    init(title: String, activeState: Bool = false) {
        self.title = title
        self.activeState = activeState
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let activeState = aDecoder.decodeBool(forKey: "activeState")
        self.init(title: title, activeState: activeState)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(activeState, forKey: "activeState")
    }
}
