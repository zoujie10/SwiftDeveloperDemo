//
//  CitiesTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/30.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class CitiesTableViewController: UITableViewController {

	var listData : NSArray!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.tableView.delegate = self
		self.tableView.dataSource = self
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifierFour")
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
//        return self.listData.count
//    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listData.count
    }
	
	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifierFour", for: indexPath) as UITableViewCell
		let row = indexPath.row
		let dic = self.listData[row] as! NSDictionary
		cell.textLabel?.text = dic["name"] as? String
        return cell
    }

	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//		let detailController =  DetailViewController()
		
		//IBOutlet的控件为nil的问题 https://stackoverflow.com/questions/29321383/iboutlet-is-nil-but-it-is-connected-in-storyboard-swift
		let detailController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
		let indexPath = self.tableView.indexPathForSelectedRow
		
		let seletedIndex = indexPath?.row
		let dict = self.listData[seletedIndex!] as! NSDictionary
		detailController.url = dict["url"] as! NSString
		detailController.title = dict["name"] as? String
		self.navigationController!.pushViewController(detailController, animated: true)
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "ShowSeletedCity"{
			let detailController = segue.destination as! DetailViewController
			let indexPath = self.tableView.indexPathForSelectedRow
			let seletedIndex = indexPath!.row
			
			let dict = self.listData[seletedIndex] as! NSDictionary
			detailController.url = dict["url"] as! NSString
			detailController.title = dict["name"] as? String 
		}
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
