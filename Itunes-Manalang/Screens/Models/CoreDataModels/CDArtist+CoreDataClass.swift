//
//  CDArtist+CoreDataClass.swift
//  
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//
//

import Foundation
import CoreData

@objc(CDArtist)
public class CDArtist: NSManagedObject {
    
    @discardableResult
    static func savingRecord(artist: Artist, context: NSManagedObjectContext) throws -> CDArtist? {
        var rawArtist: CDArtist? = nil
        let id = artist.artistId ?? 0
        let artistIdKey = #keyPath(CDArtist.artistId)
        let predicate = NSPredicate(format: "\(artistIdKey) == %d", id)
        let fetchRequest = CoreDataManager.fetchRequest(entity: Self.self, predicate: predicate,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                rawArtist = results.first
            }else {
                rawArtist = CDArtist(context: context)
                rawArtist?.insert(artist: artist, context: context)            }
        }catch {
            throw error
        }
        return rawArtist
    }
    
}

extension CDArtist {
    
    func insert(artist: Artist, context: NSManagedObjectContext) {
        if let id = artist.artistId {
            self.artistId = Int32(id)
        }
        self.artistName = artist.artistName
        self.artistViewUrl = artist.artistViewUrl
        self.artworkUrl100 = artist.artworkUrl100
        self.artworkUrl30 = artist.artworkUrl30
        self.artworkUrl60 = artist.artworkUrl60
        self.releaseDate = artist.releaseDate
        self.longDescription = artist.longDescription
        
        self.trackName = artist.trackName
        self.trackPrice = NSNumber(value: artist.trackPrice ?? 0.00)
        self.primaryGenreName = artist.primaryGenreName
    }
    
}
