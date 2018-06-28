//
//  MainTableViewController.swift
//  TouchAnyCard
//
//  Created by Andrew Gorzny on 2018-06-27.
//  Copyright © 2018 Andrew Gorzny. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var selectedRowIndex: Int = -1
    let totalRows: Int = 6

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return totalRows
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! TableViewCell

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedRowIndex = indexPath.row
        animateCell(atIndex: indexPath)
        
        resetCellComponents(atIndex: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedRowIndex == indexPath.row {
            return 200.0
        } else {
            return 100.0
        }
    
    }
    
    func animateCell(atIndex: IndexPath) {
        let cell = self.tableView.cellForRow(at: atIndex) as! TableViewCell
        cell.cellTopConstraint.constant = 26
        cell.cellBottomConstraint.constant = -26
        cell.cellLeadingConstraint.constant = -10
        cell.cellTrailingConstraint.constant = 10
        
        UIView.animate(withDuration: 0.3, delay: 0.1, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: .curveEaseInOut, animations: {

            self.view.layoutIfNeeded()
            
            cell.labelBottomLeft.isHidden = false
            cell.labelBottomRight.isHidden = false
            
            cell.cellTopConstraint.constant = 0
            cell.cellBottomConstraint.constant = 0
            cell.cellLeadingConstraint.constant = 0
            cell.cellTrailingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.1, delay: 0.2, options: [], animations: {
                
                self.view.layoutIfNeeded()
            })
            
        }) { _ in
        }
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    func resetCellComponents(atIndex: IndexPath) {
        
        for index in 0...totalRows-1 {
            if atIndex.row != index {
                let currentIndexPath = NSIndexPath(row: index, section: 0)
                let cell = self.tableView.cellForRow(at: currentIndexPath as IndexPath) as! TableViewCell
                cell.labelBottomLeft.isHidden = true
                cell.labelBottomRight.isHidden = true
            }
        }
        
    }


}
