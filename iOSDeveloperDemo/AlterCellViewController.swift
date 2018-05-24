//
//  AlterCellViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/22.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class AlterCellViewController: UITableViewController,UITextFieldDelegate {
	//编辑状态
	enum editStatus {
		case insert
		case delete
		case move
		case none
	}
	var editStatu: editStatus!
	
	@IBOutlet var textField: UITextField!//IB上添加不了，看到不到视图界面
	var topBtn : UIButton!
	var topDoneBtn : UIButton!
	var listTeam : NSMutableArray!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		editStatu  = editStatus.none
		//设置编辑button
		topBtn = UIButton()
		topBtn.frame = CGRect(x: 200, y: 300, width: 50, height: 50)
		topBtn.backgroundColor = UIColor.orange
		topBtn.setTitle("Edit", for:UIControlState.normal)
		topBtn.addTarget(self, action: #selector(editBtn), for:UIControlEvents.touchUpInside)
		self.view.addSubview(topBtn)
		
		topDoneBtn = UIButton()
		topDoneBtn.frame = CGRect(x: 270, y: 300, width: 50, height: 50)
		topDoneBtn.backgroundColor = UIColor.orange
		topDoneBtn.setTitle("Done", for:UIControlState.normal)
		topDoneBtn.addTarget(self, action: #selector(doneBtn), for:UIControlEvents.touchUpInside)
		self.view.addSubview(topDoneBtn)
		
		self.textField.delegate = self
		self.textField.isHidden = true
		
		
		let date = NSDate()
		self.listTeam = NSMutableArray()
		self.listTeam.add(date)
		
		//下拉刷新
		let rc = UIRefreshControl()
		rc.attributedTitle = NSAttributedString(string: "下拉刷新")
		rc.addTarget(self, action: #selector(refreshTableView), for: UIControlEvents.valueChanged)//valueChanged
		self.refreshControl = rc
		
    }
	
	
	@objc func refreshTableView() {
		if self.refreshControl?.isRefreshing == true{
			self.refreshControl?.attributedTitle = NSAttributedString(string: "加载中...")
			//添加新的模拟数据
			let date = NSDate()
			self.listTeam.add(date)
			
			self.refreshControl?.endRefreshing()
			self.refreshControl?.attributedTitle = NSAttributedString(string: "下拉刷新")
			
			self.tableView.reloadData()
		}
	}
	
	@objc func editBtn(){
		
		self.setEditing(true, animated: true)
		
	}
	@objc func doneBtn(){
		
		self.setEditing(false, animated: true)
	}
	
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
	override func setEditing(_ editing: Bool, animated: Bool) {
		
		self.tableView.setEditing(editing, animated: true)
		if editing{
			if editStatu == editStatus.insert{//只有编辑状态为插入时，textField显示
				self.textField.isHidden = false
			}else{
				self.textField.isHidden = true
			}
		}else{
			self.textField.isHidden = true
		}
	}
	
	//MARK: UITableview delegate
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.listTeam.count + 1
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as UITableViewCell
		let b_addCell = (indexPath.row == self.listTeam.count)
		
		if cell == nil{
			cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cellIdentifier")
		}
		
		if b_addCell == false{
			cell!.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
			let dateFormatter : DateFormatter = DateFormatter()
			dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss zzz"
			
			let theDate = self.listTeam[indexPath.row]
			if theDate is NSDate{
				cell!.textLabel?.text = dateFormatter.string(from: (theDate as? Date)!)
			}else if theDate is NSString{
				cell!.textLabel?.text = self.listTeam[indexPath.row] as? String
			}
			
		}else{
			self.textField?.frame = CGRect(x: 10, y: 5, width: 300, height: 44)
			self.textField.borderStyle = UITextBorderStyle.none
			self.textField.placeholder = "Add..."
			self.textField.backgroundColor = UIColor.orange
			cell!.contentView.addSubview(self.textField)
		}
		return cell!
	}
	
	//单元格编辑
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		//插入删除单元格时
		if indexPath.row == self.listTeam.count{
			editStatu = editStatus.insert
			return UITableViewCellEditingStyle.insert
		}else{
			editStatu = editStatus.delete
			return UITableViewCellEditingStyle.delete
		}
		
		//移动单元格时使用  START
//			editStatu = editStatus.move
//			return UITableViewCellEditingStyle.none
		//END
	}
	
	//实现删除或插入处理
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		let indexPaths = NSArray(array: [indexPath])
		if editingStyle == UITableViewCellEditingStyle.delete{
			self.listTeam.removeObject(at: indexPath.row)
			self.tableView.deleteRows(at: indexPaths as! [IndexPath], with: UITableViewRowAnimation.fade)
			
		}else if editingStyle == UITableViewCellEditingStyle.insert{
			self.listTeam.insert(self.textField.text as Any, at: self.listTeam.count)
			self.tableView.insertRows(at: indexPaths as! [IndexPath], with: UITableViewRowAnimation.fade)
		}
		self.tableView.reloadData()
	}
	
	//设置单元格在选择时处于高亮状态
	override func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
		if indexPath.row == self.listTeam.count{
			return false
		}else{
			return true
		}
	}
	
	override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50
	}
	
	//移动单元格
	override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		let stringToMove = self.listTeam[sourceIndexPath.row] as! String
		self.listTeam.removeObject(at: sourceIndexPath.row)
		self.listTeam.insert(stringToMove, at: destinationIndexPath.row)
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
