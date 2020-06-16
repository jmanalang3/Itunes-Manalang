//
//  CDLog+CoreDataProperties.swift
//  
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//
//

import Foundation
import CoreData


extension CDLog {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDLog> {
        return NSFetchRequest<CDLog>(entityName: "CDLog")
    }

    @NSManaged public var lastVisitDate: Date?
    @NSManaged public var state: NSNumber?
    @NSManaged public var artist: CDArtist?

}
