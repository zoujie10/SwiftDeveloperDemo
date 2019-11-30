//
//  CollectionViewController.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2018/5/16.
//  Copyright © 2018年 Zoujie. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
	var evevts : NSArray!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		let plistPath = Bundle.main.path(forResource: "provinces_cities", ofType: "plist")
		self.evevts = NSArray(contentsOfFile: plistPath!)!
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
	//MARK: DELEGATE
	override func numberOfSections(in collectionView: UICollectionView) -> Int {
		return self.evevts.count/2
	}
	
	override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 2
	}
	override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! Cell
		let event = self.evevts[indexPath.section*2 + indexPath.row] as! NSDictionary
		cell.sportLB.text = event["name"] as? String
		let imageFile = event["image"] as! String
		cell.imageView.image = UIImage(named: imageFile)
		return cell
	}
	
	override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let event = self.evevts[indexPath.section*2 + indexPath.row] as! NSDictionary
		print("select event name:",event["name"] as! String)
		
	}
	
	
	override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headview : UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(ofKind:UICollectionElementKindSectionHeader, withReuseIdentifier: "HeaderIndentifier", for: indexPath)
		return headview;
	}
}
