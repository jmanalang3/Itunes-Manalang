//
//  CDLog+CoreDataClass.swift
//  
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//
//

import Foundation
import CoreData

@objc(CDLog)
public class CDLog: NSManagedObject {
    
}

extension CDLog {
    
    @discardableResult
    static func saveRecordVisit(artist: CDArtist, context: NSManagedObjectContext) throws -> CDLog? {
        var rawArtist: CDLog? = nil
        let id = artist.artistId
        let artistIdKey = #keyPath(CDLog.artist.artistId)
        let predicate = NSPredicate(format: "\(artistIdKey) == %d", id)
        let fetchRequest = CoreDataManager.fetchRequest(entity: Self.self, predicate: predicate,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                rawArtist = results.first
            }else {
                rawArtist = CDLog(context: context)
                rawArtist?.saveLastVisit(artist: artist, state: true)
            }
        }catch {
            throw error
        }
        return rawArtist
    }
    
    func saveLastVisit(artist: CDArtist, state: Bool) {
        let formated = DateApp.stringWithLocalTime(fromDate: Date(), withFormat: .birthdayServer)
        self.lastVisitDate = DateApp.date(fromString: formated, withFormat: .birthdayServer)
        self.state = NSNumber(value: state)
        self.artist = artist
    }
    
    static func fetch(by id: Int32, context: NSManagedObjectContext) throws -> CDLog? {
        let fetchRequest = CoreDataManager.fetchRequest(entity: Self.self, predicate: nil,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            let first = results.filter { $0.artist?.artistId ==  id }.last
            return first
        }catch {
            throw error
        }
    }
    
    static func fetchLastVistedScreen(context: NSManagedObjectContext) throws -> CDLog? {
        let stateKey = #keyPath(CDLog.state)
        let predicate = NSPredicate(format: "\(stateKey) == %d", true)
        let fetchRequest = CoreDataManager.fetchRequest(entity: CDLog.self, predicate: predicate,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            return results.last
        }catch {
            throw error
        }
    }
    
}
