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
    @NSManaged public var artistViewUrl: String?
    @NSManaged public var artworkUrl100: String?
    @NSManaged public var artworkUrl30: String?
    @NSManaged public var artworkUrl60: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var longDescription: String?
    
    @NSManaged public var trackName: String?
    @NSManaged public var trackPrice: NSNumber?
    @NSManaged public var primaryGenreName: String?
    
    enum CodingKeys: String, CodingKey {
        case artistId
        case artistName
        case artistViewUrl
        case artworkUrl100
        case artworkUrl30
        case artworkUrl60
        case releaseDate
        case longDescription
        
        case trackName
        case trackPrice
        case primaryGenreName
    }
    
}
