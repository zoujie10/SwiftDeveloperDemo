//
//  MasterTableViewController.swift
//  iOSDeveloperiPadDemo
//
//  Created by Zoujie on 2018/6/6.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {
	var listData : NSArray!
	var detailViewController : DetailViewController!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.listData = NSArray(array: ["Blue View","Yellow View"])
		let splitViewController = self.splitViewController as UISplitViewController?
		let viewControllers = splitViewController?.viewControllers as! NSArray
		self.detailViewController = viewControllers.lastObject as! DetailViewController
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

//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 0
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
//		let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
		var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier")
		if cell == nil {
			cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "reuseIdentifier")
		}
		let row = indexPath.row
		cell?.textLabel?.text = self.listData[row] as? String
		
        return cell!
    }
	
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let row = indexPath.row
		self.detailViewController.updateView(row:row)
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
