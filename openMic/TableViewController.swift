//
//  TableViewController.swift
//  openMic
//
//  Created by Garrett Spencer on 9/29/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit
import Parse

class TableViewController: PFQueryTableViewController {
    
    let sampleCells = ["This is the first cell that I came up with", "The second cell is this one", "This cell has an index of 2", "Last Cell"]

    override init(style: UITableView.Style, className: String!) {
        super.init(style: style, className: className)
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        
        self.parseClassName = "openMic"
        self.textKey = "text"
        self.pullToRefreshEnabled = true
        self.objectsPerPage = 200
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.estimatedRowHeight = 60;
        self.tableView.rowHeight = UITableView.automaticDimension;

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    /*override func didReceiveMemoryWarning() {
        super.didRecieveMemoryWarning()
    }*/
    
    override func queryForTable() -> PFQuery<PFObject> {
        let query = PFQuery(className: "openMic")
        query.limit = 200;
        query.order(byDescending: "createdAt")
        return query
    }
    
    func objectAtIndexPath(indexPath: NSIndexPath!) -> PFObject! {
        var obj: PFObject? = nil
        if(indexPath.row < self.objects!.count) {
            obj = self.objects![indexPath.row] as PFObject
        }
        return obj
    }
    // MARK: - Table view data source
    
    //This function assigns the number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    //This funtion determines how many cells will be shown in each section
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return self.sampleCells.count;
//    }

    //Function configures the labels within the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: NSIndexPath!, object: PFObject!) -> PFTableViewCell! {
        //let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        //Assigns the variable 'cell' to a 'TableViewCell' object
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath as IndexPath) as! TableViewCell
        
        cell.cellLabel.text = sampleCells[indexPath.row]
        cell.postTime.text = "\((indexPath.row + 1) * 3)m ago"
        cell.numLikes.text = "\((indexPath.row + 1) * 5)"
        cell.numReplies.text = "\(indexPath.row + 1) replies"

        return cell
    }
    
    
    @IBAction func plusButton(_ sender: AnyObject) {
        
        let hitPoint = sender.convert(CGPoint.zero, to: self.tableView)
        let hitIndex = self.tableView.indexPathForRow(at: hitPoint)
        
        NSLog("Top Index Path \(String(describing: hitIndex?.row))")
        
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
