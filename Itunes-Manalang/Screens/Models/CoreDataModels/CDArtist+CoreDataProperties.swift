//
//  CDArtist+CoreDataProperties.swift
//  
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//
//

import Foundation
import CoreData


extension CDArtist {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDArtist> {
        return NSFetchRequest<CDArtist>(entityName: "CDArtist")
    }

    @NSManaged public var artistId: Int32
    @NSManaged public var artistName: String?
    
}
