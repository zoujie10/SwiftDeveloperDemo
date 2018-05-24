//
//  CustomTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/18.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class CustomTableViewController: UITableViewController,UISearchBarDelegate {
	var listTeam : NSArray!
	var listFilterTeams : NSMutableArray!
	@IBOutlet var searchBar: UISearchBar!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		self.searchBar.delegate = self
		self.searchBar.showsScopeBar = false
		self.searchBar.sizeToFit()
		
		let plistPath = Bundle.main.path(forResource: "team", ofType: "plist")
		self.listTeam = NSArray(contentsOfFile: plistPath!)
		
		self.filterContentForSearchText(searchText: "",scope:-1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	func filterContentForSearchText(searchText:NSString,scope:Int){
		if searchText.length == 0 {
			//查询所有
			self.listFilterTeams = NSMutableArray(array: self.listTeam)
			return
		}
		
		var tempArray : NSArray!
		if scope == 0{ //English
			let scopePredicate = NSPredicate(format: "SELF.image contains[c] %@", searchText)
			tempArray = self.listTeam.filtered(using: scopePredicate) as NSArray
			self.listFilterTeams = NSMutableArray(array: tempArray)
		}else if scope == 1{ //Chinese
			let scopePredicate = NSPredicate(format: "SELF.image contains[c] %@", searchText)
			tempArray = self.listTeam.filtered(using: scopePredicate) as NSArray
			self.listFilterTeams = NSMutableArray(array: tempArray)
			
		}else{//All
			self.listFilterTeams = NSMutableArray(array: self.listTeam)
		}
		
	}
	//MARK: SEARCH DELEGATE
	//获得焦点，成为第一响应者
	func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
		self.searchBar.showsScopeBar = true
		self.searchBar.sizeToFit()
		return true
	}
	//点击键盘上的搜索按钮
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		self.searchBar.showsScopeBar = false
		self.searchBar.resignFirstResponder()
		self.searchBar.sizeToFit()
	}
	//点击搜索栏上的搜索按钮
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		self.filterContentForSearchText(searchText: "",scope:-1)
		self.searchBar.showsScopeBar = false
		self.searchBar.resignFirstResponder()
		self.searchBar.sizeToFit()
	}
	//文本内容发生改变时调用
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		self.filterContentForSearchText(searchText: searchText as NSString, scope: self.searchBar.selectedScopeButtonIndex)
		self.tableView.reloadData()
	}
	//搜索范围选择发生变化时调用
	func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
		self.filterContentForSearchText(searchText: self.searchBar.text! as NSString, scope: selectedScope)
		self.tableView.reloadData()
		
	}
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.listTeam.count
    }

	
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell : CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifierTwo", for: indexPath) as! CustomTableViewCell
		
		let row  = indexPath.row
		let rowDic = self.listTeam[row] as! NSDictionary
		cell.myLable.text = rowDic["name"] as? String
		
		let imageFile = rowDic["image"] as! String
		let imagePath = NSString(format: "%@.png", imageFile)
		cell.myImageView.image = UIImage(named: imagePath as String)
		cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
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
