
//  Created by Zoujie on 2018/5/30.


//XML解析
//JSON解析

import UIKit
import Alamofire
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
		
		requestData()//Alamofire
		
		let refresh = UIRefreshControl()
		refresh.attributedTitle = NSAttributedString(string: "下拉刷新中")
		refresh.addTarget(self, action: #selector(refreshBtn), for: UIControlEvents.valueChanged)
		self.Tableview.refreshControl = refresh
		
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	func requestData(){
		UIApplication.shared.isNetworkActivityIndicatorVisible = true //状态栏菊花  网络活动指示器
		Alamofire.request("www.baidu.com",method: .post,parameters: ["key":"value"]).responseJSON { response in
//			print(response.request)  // 原始的URL请求
//			print(response.response) // HTTP URL响应
//			print(response.data)     // 服务器返回的数据
//			print(response.result)   // 响应序列化结果，在这个闭包里，存储的是JSON数据
			
			if let JSON = response.result.value {
				print("JSON: \(JSON)")
			}
		}
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
		citiesViewController.listData = self.dicData[seletedName] as? NSArray
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
	
	
//	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//		UITableViewHeaderFooterView
//	}
	@objc func refreshBtn(){
		print("下拉刷新")
		self.Tableview.refreshControl?.endRefreshing()
		UIApplication.shared.isNetworkActivityIndicatorVisible = false
	}

	
	
	
}
