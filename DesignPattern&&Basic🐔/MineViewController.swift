//
//  MineViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/6/4.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
import iAd
class MineViewController: UIViewController,PhilosopherDelegate,UITableViewDataSource,UITableViewDelegate {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.dataArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = (self.dataArray[indexPath.row] as! String)
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		print(self.dataArray[indexPath.row])
		if(indexPath.row == 0){
			self.navigationController?.pushViewController(CopyPatternViewController(), animated: true)
        }else if(indexPath.row == 7){
            self.navigationController?.pushViewController(ZJ_SortAlgorithmVC(), animated: true)
        }
	}
	
	var dataArray = NSArray()
	var tableView = UITableView()
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
        self.dataArray = ["CopyPattern",
                          "IteratorPattern",
                          "TemplatePattern",
                          "ObserverPattern",
                          "DelegatePattern",
                          "DecoratePattern",
                          "设计模式",
                          "Sort Algorithm"]
	
		self.view.addSubview(self.tableView)
		self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
		}
		self.tableView.dataSource = self;
		self.tableView.delegate = self;
		self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
		
		
		
		let Person = Philosopher()
		Person.delegate = self
		Person.start()
		assert(true, "no problem")
//		assert(<#T##condition: Bool##Bool#>, <#T##message: String##String#>)
//		assertionFailure(<#T##message: String##String#>)
		print("on my View in put:",Singleton.sharedInstance.str1,".")
		
//		let bannerView = ADBannerView.init(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 50));
//		self.view.addSubview(bannerView)

		ADClient.shared().requestAttributionDetails{ dic , error  in
			if(!(error != nil)){
				
			}
			/*
			▿ Optional<Dictionary<String, NSObject>>
			▿ some : 1 element
			▿ 0 : 2 elements
			- key : "Version3.1"
			▿ value : 18 elements
			▿ 0 : 2 elements
			- key : iad-purchase-date
			- value : 2019-05-25T08:57:39Z
			▿ 1 : 2 elements
			- key : iad-keyword
			- value : Keyword
			▿ 2 : 2 elements
			- key : iad-adgroup-id
			- value : 1234567890
			▿ 3 : 2 elements
			- key : iad-creativeset-id
			- value : 1234567890
			▿ 4 : 2 elements
			- key : iad-creativeset-name
			- value : CreativeSetName
			▿ 5 : 2 elements
			- key : iad-campaign-id
			- value : 1234567890
			▿ 6 : 2 elements
			- key : iad-lineitem-id
			- value : 1234567890
			▿ 7 : 2 elements
			- key : iad-org-id
			- value : 1234567890
			▿ 8 : 2 elements
			- key : iad-org-name
			- value : OrgName
			▿ 9 : 2 elements
			- key : iad-campaign-name
			- value : CampaignName
			▿ 10 : 2 elements
			- key : iad-conversion-date
			- value : 2019-05-25T08:57:39Z
			▿ 11 : 2 elements
			- key : iad-conversion-type
			- value : Download
			▿ 12 : 2 elements
			- key : iad-country-or-region
			- value : US
			▿ 13 : 2 elements
			- key : iad-click-date
			- value : 2019-05-25T08:57:39Z
			▿ 14 : 2 elements
			- key : iad-attribution
			- value : true
			▿ 15 : 2 elements
			- key : iad-adgroup-name
			- value : AdGroupName
			▿ 16 : 2 elements
			- key : iad-lineitem-name
			- value : LineName
			▿ 17 : 2 elements
			- key : iad-keyword-matchtype
			- value : Broad
			*/
		}
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
		
    }
	
    
    //MARK: DELEGATE
	func sleep() {
		
		print("sleep...")
	}
	
	func eat() {
		print("eat....")
	}
	
	func work() {
		print("work...")
	}

	
//	func bannerViewDidLoadAd(_ banner: ADBannerView) {
//
//	}
//
//	func bannerView(_ banner: ADBannerView, didFailToReceiveAdWithError error: Error) {
//
//	}
	
}
