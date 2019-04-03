//
//  TableCellEmail.swift
//  TableViewExample
//
//  Created by Rahul on 03/04/19.
//  Copyright © 2019 devpoint. All rights reserved.
//

import Cocoa
class TableCellEmail: NSTableCellView {
    
    fileprivate var cellEmailBtn:NSButton!
    
    var data:String = ""
    
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        self.wantsLayer = true
        
        cellEmailBtn = NSButton(frame: NSRect(x: 0, y: self.bounds.maxY - 20, width: 160, height: 20))
        cellEmailBtn.title = data
        cellEmailBtn.isBordered = false
        
        cellEmailBtn.target = self
        cellEmailBtn.action = #selector(openMail)
        
        self.addSubview(cellEmailBtn)
        
    }
    @objc func openMail() {
        let service = NSSharingService(named: NSSharingService.Name.composeEmail)
        
        service?.recipients = [data]
        service?.subject = "Test Mail"
        service?.perform(withItems: ["Test Mail body"])
    }
}
