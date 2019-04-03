//
//  TableCellName.swift
//  TableViewExample
//
//  Created by Rahul on 03/04/19.
//  Copyright © 2019 devpoint. All rights reserved.
//

import Cocoa

class TableCellName: NSTableCellView {
    
    fileprivate var cellTitle:NSTextField!
    
    var data:String = ""
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        
        cellTitle = NSTextField(frame: NSRect(x: 0, y: self.bounds.maxY - 20, width: 160, height: 20))
        cellTitle.stringValue = data
        cellTitle.isEditable = false
        cellTitle.isBezeled = false
        self.addSubview(cellTitle)
        
    }
}
