//
//  CDMovie+CoreDataClass.swift
//  
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//
//

import Foundation
import CoreData

@objc(CDMovie)
public class CDMovie: NSManagedObject {
    
    @discardableResult
    static func savingRecord(movie: Movie, context: NSManagedObjectContext) throws -> CDMovie? {
        var rawMovie: CDMovie? = nil
        let id = movie.artistId ?? 0
        let artistIdKey = #keyPath(CDMovie.artistId)
        let predicate = NSPredicate(format: "\(artistIdKey) == %d", id)
        let fetchRequest = CoreDataManager.fetchRequest(entity: Self.self, predicate: predicate,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                rawMovie = results.first
            }else {
                rawMovie = CDMovie(context: context)
                rawMovie?.insert(movie: movie, context: context)
            }
        }catch {
            throw error
        }
        return rawMovie
    }
    
}


extension CDMovie {
    
    func insert(movie: Movie, context: NSManagedObjectContext) {
        if let id = movie.artistId {
            self.artistId = Int32(id)
        }
        self.artistName = movie.artistName
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
