//
//  NotesXMLParser.swift
//  iOSDeveloperDemo
//
//  Created by Zoujie on 2019/7/7.
//  Copyright © 2019 Zoujie. All rights reserved.
//

import UIKit

class NotesXMLParser: NSObject,XMLParserDelegate {
	
	private var notes : NSMutableArray!
	private var currentTagName : String!
	
	func start(){
		let path = Bundle.main.path(forResource: "team", ofType: "xml")!
		let url = URL(fileURLWithPath: path)
		let parser = XMLParser(contentsOf: url)!
		parser.delegate = self
		parser.parse()
	}
	
	
	//MARK:XMLdelegate
	func parserDidStartDocument(_ parser: XMLParser) { //文档开始时触发
		self.notes = NSMutableArray()
	}
	//调试时使用
	func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
		print("%@",parseError)
	}
	
	func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {//遇到一个开始标签时触发，其中namespaceURI部分是命名空间 qualifiedName是限定名 attributes是字典类型的属性集合
		
		self.currentTagName = elementName//elementName正在解析的元素名
		
		if self.currentTagName == "team"{
			let id = attributeDict["id"] as! String//去除属性id
			let dic = NSMutableDictionary()
			dic.setObject(id, forKey:"id" as NSCopying)
			self.notes.add(dic)
		}
		
	}
	func parser(_ parser: XMLParser, foundCharacters string: String) {//遇到字符串触发
		let s1 = string.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
		
		if s1 == ""{
			return
		}
		
		let dict = self.notes.lastObject as? NSMutableDictionary
		
		if(self.currentTagName == "date"){
			dict?.setObject(string, forKey: "date" as NSCopying)
		}
	}
	func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {//遇到结束标签触发
		self.currentTagName = nil
	}
	func parserDidEndDocument(_ parser: XMLParser) {//文档结束时触发
		print("解析完成")
		NotificationCenter.default.post(name: NSNotification.Name(rawValue: "reloadViewNotification"), object: self.notes)
	}
}
