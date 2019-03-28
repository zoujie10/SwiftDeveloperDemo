//
//  TabLTableViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/30.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class TabLTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	var dicData : NSDictionary!
	var listData : NSArray!
	
	@IBOutlet var Tableview: UITableView!

	override func viewDidLoad() {
        super.viewDidLoad()
		
		self.Tableview = UITableView()
		self.Tableview.delegate = self
		self.Tableview.dataSource = self
		self.Tableview.frame = CGRect(x: 0, y: 147, width: 375, height: 506)
		self.view.addSubview(self.Tableview)
		self.Tableview.register(UITableViewCell.self, forCellReuseIdentifier: "CellIdentifierThree")
		let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
		self.dicData = NSDictionary(contentsOfFile: plistPath!)
		self.listData = self.dicData.allKeys as NSArray
		self.title = "省份"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	
	//MARK: DATASOURCE
	 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.listData.count
	}

	 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifierThree", for: indexPath) as UITableViewCell
		let row = indexPath.row
		cell.textLabel?.text = self.listData[row] as? String
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let citiesViewController =  CitiesTableViewController()
		let indexPath = self.Tableview.indexPathForSelectedRow
		let seletedIndex = indexPath?.row
		
		let seletedName = self.listData[seletedIndex!] as! String
		citiesViewController.listData = self.dicData[seletedName] as! NSArray
		citiesViewController.title = seletedName
		self.navigationController?.pushViewController(citiesViewController, animated: true)
	}
	//选择表视图行触发
//	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//		if segue.identifier == "ShowSeletedProvince"{
//			let citiesViewController = segue.destination as! CitiesTableViewController
//			let indexPath = self.Tableview.indexPathForSelectedRow
//			let seletedIndex = indexPath?.row
//			
//			let seletedName = self.listData[seletedIndex!] as! String
//			citiesViewController.listData = self.dicData[seletedName] as! NSArray
//			citiesViewController.title = seletedName
//		}
//	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
