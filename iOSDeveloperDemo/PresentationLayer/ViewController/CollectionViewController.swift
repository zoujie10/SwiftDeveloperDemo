//
//  CollectionViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/16.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit
struct provincesItems {
	let name : String
	let url : String
}
class CollectionViewController: UICollectionViewController {
    
	var provinces = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
		let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")!
        self.provinces  = NSArray(contentsOfFile: plistPath)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	//MARK: DELEGATE
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.provinces.count
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let array : NSArray = self.provinces[section] as! NSArray
        return array.count
	}
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! Cell
        let array : NSArray = self.provinces[indexPath.section] as! NSArray
        let dic : NSDictionary = array[indexPath.row] as! NSDictionary
		cell.sportLB.text = dic["name"] as? String
		let imageFile = dic["url"] as? String
		cell.imageView.image = UIImage(named: imageFile!)
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let array : NSArray = self.provinces[indexPath.section] as! NSArray
        let dic : NSDictionary = array[indexPath.row] as! NSDictionary
		print("select event name:",dic["name"] as! String)
        self.dismiss(animated: true, completion: nil)
        
	}
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headview : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderIndentifier", for: indexPath)
		return headview;
	}
}
