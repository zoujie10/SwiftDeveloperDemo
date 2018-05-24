//
//  SectionTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/21.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
	
	var dicData : NSDictionary!
	var listGroupName : NSArray!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let plistPath = Bundle.main.path(forResource: "team_dictionary", ofType: "plist")
		self.dicData = NSDictionary(contentsOfFile: plistPath!)
		let templist = self.dicData.allKeys as NSArray
		self.listGroupName = templist.sortedArray(using: #selector(NSNumber.compare(_:))) as NSArray
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
		let groupName = self.listGroupName[section] as! String
		let listTeams = self.dicData[groupName] as! NSArray
        return listTeams.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell : CustomTableViewCell? = tableView.dequeueReusableCell(withIdentifier: "CellIdentifierTwo", for: indexPath) as? CustomTableViewCell
		if cell == nil {
			cell = CustomTableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "CellIdentifierTwo")
		}
		
		let section = indexPath.section
		let row = indexPath.row
		let groupName = self.listGroupName[section] as! String
		let listTeams = self.dicData[groupName] as! NSArray
		cell?.myLable?.text = listTeams[row] as? String

		cell?.myImageView.image = UIImage(named: "中国" as String)
		cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
		return cell!
    }

	override func numberOfSections(in tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		
		return self.listGroupName.count
	}
	
	override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let groupName = self.listGroupName[section] as! String
		return groupName
	}
	
	override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
		let listTitle = NSMutableArray(capacity: self.listGroupName.count)
		
		//把"A组"改为"A"
		for item in self.listGroupName{
			
			let title : NSString = item as! NSString
			let temp = title.substring(to: 1)
			listTitle.add(temp)
		}
		return listTitle as? [String]
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
