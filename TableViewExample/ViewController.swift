//
//  ViewController.swift
//  TableViewExample
//
//  Created by Rahul on 03/04/19.
//  Copyright © 2019 devpoint. All rights reserved.
//

import Cocoa

struct TableDataModel {
    var isBold:Bool = false
    var firstName:String = ""
    var lastName:String = ""
    var email:String = ""
}
class ViewController: NSViewController {
    
    //MARK:- Properties
    fileprivate var tableView:NSTableView!
    fileprivate var senseDataList: [TableDataModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView = NSTableView(frame: NSRect(x: 0, y: 0, width: 480, height: 380))
        
        //MARK:- create coulmns for table
        let firstNameColumn:NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "FirstNameColumn"))
        firstNameColumn.width = 160
        firstNameColumn.headerCell.title = "First Name"
        
        let lastNameColumn:NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "LastNameColumn"))
        lastNameColumn.width = 160
        lastNameColumn.headerCell.title = "Last Name"
        
        let emailColumn:NSTableColumn = NSTableColumn(identifier: NSUserInterfaceItemIdentifier(rawValue: "EmailColumn"))
        emailColumn.width = 160
        emailColumn.headerCell.title = "Email"
        
        tableView.addTableColumn(firstNameColumn)
        tableView.addTableColumn(lastNameColumn)
        tableView.addTableColumn(emailColumn)
        
        //MARK:- Create scroll view for table
        let scrollView:NSScrollView = NSScrollView(frame: NSRect(x: 10, y: 10 , width: 480, height: 380))
        
        let scroller = NSScroller()
        scroller.scrollerStyle = .legacy
        scroller.controlSize = .mini
        
        scrollView.verticalScroller = scroller
        scrollView.hasVerticalScroller = true
        scrollView.hasHorizontalScroller = true
        scrollView.documentView = tableView
        
        
        self.view.addSubview(scrollView)
        
        //MARK:- Set delegate and data source
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.selectionHighlightStyle = .none
        
        senseDataList.removeAll()
        
        senseDataList.append(TableDataModel(isBold: false, firstName: "Shubham", lastName: "Sharma", email: "shubham@gmail.com"))
        senseDataList.append(TableDataModel(isBold: true, firstName: "Amit", lastName: "Singh", email: "Amit@gmail.com"))
        senseDataList.append(TableDataModel(isBold: false, firstName: "Mayank", lastName: "verma", email: "Mayank@gmail.com"))
        senseDataList.append(TableDataModel(isBold: false, firstName: "Anil", lastName: "Sharma", email: "Anil@gmail.com"))
        
        tableView.reloadData()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}

//MARK: - NSTableView
extension ViewController: NSTableViewDataSource, NSTableViewDelegate {
    //MARK:- Table view
    func numberOfRows(in tableView: NSTableView) -> Int {
        return senseDataList.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let person = senseDataList[row]
        if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "FirstNameColumn") {
            let cell = TableCellName()
            cell.data = person.firstName
            return cell
        }else if tableColumn?.identifier == NSUserInterfaceItemIdentifier(rawValue: "LastNameColumn") {
            let cell = TableCellName()
            cell.data = person.lastName
            return cell
        }else {
            let cell = TableCellEmail()
            cell.data = person.email
            
            return cell
        }
        
        
    }
    func tableView(_ tableView: NSTableView, heightOfRow row: Int) -> CGFloat {
        return 20 
    }
}



