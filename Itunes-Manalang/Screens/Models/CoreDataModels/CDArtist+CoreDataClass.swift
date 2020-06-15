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
                rawArtist?.insert(artist: artist, context: context)
            }
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
    }
    
    func isItemExist(id: Int, predicate: NSPredicate? = nil,
                     sortDescriptors: [NSSortDescriptor] = [],
                     context: NSManagedObjectContext) -> Bool {
        let fetchRequest = CoreDataManager.fetchRequest(entity: Self.self, predicate: predicate,
                                                        sortDescriptors: sortDescriptors, context: context)
        do {
            let count = try context.count(for: fetchRequest)
            if count > 0 {
                return true
            }else {
                return false
            }
        }catch {
            return false
        }
    }
    
}
