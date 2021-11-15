//
//  NSManageredObject+CoreDataProperties.swift
//  
//
//  Created by Zoujie on 2019/3/30.
//
//

import Foundation
import CoreData

//Creating Core Data Managed Object Subclasses with Xcode   https://developer.apple.com/library/archive/qa/qa1952/_index.html
extension NSManageredObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NSManageredObject> {
        return NSFetchRequest<NSManageredObject>(entityName: "Note")
    }
    //@NSManaged == @dynamic，
    @NSManaged public var content: String?
    @NSManaged public var date: NSDate?

}
