//
//  SimpleTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/18.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class SimpleTableViewController: UITableViewController {
	var listTeam : NSArray!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
		self.listTeam = NSArray(contentsOfFile: plistPath!)
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
        return self.listTeam.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//		let Cellidentfier = "Cellidentfier"
		let cell : UITableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cellidentfier"))!
//		if (cell .isEqual(nil)){    纯代码配置时代码
//			cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: Cellidentfier)
//		}
		let row = indexPath.row
		let rowDict = self.listTeam[row] as! NSDictionary
		cell.textLabel?.text = rowDict["name"] as? String
		
		let imagePath = NSString(format: "%@.png", rowDict["image"] as! String)
		cell.imageView?.image = UIImage(named: imagePath as String)
		cell.accessoryType = UITableViewCellAccessoryType.detailDisclosureButton
        return cell
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
