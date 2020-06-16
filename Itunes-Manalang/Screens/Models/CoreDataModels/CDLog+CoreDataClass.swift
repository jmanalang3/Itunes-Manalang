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
    
    func saveRecord(artist: CDArtist) {
        self.state = true
        self.artist = artist
    }
        
    func saveLastVisit(){
        let formated = DateApp.stringWithLocalTime(fromDate: Date(), withFormat: .birthdayServer)
        self.lastVisitDate = DateApp.date(fromString: formated, withFormat: .birthdayServer)
        self.state = false
    }
    
    static func fetch(by id: Int32, context: NSManagedObjectContext) throws -> CDLog? {
        let fetchRequest = CoreDataManager.fetchRequest(entity: CDLog.self, predicate: nil,
                                                        sortDescriptors: [], context: context)
        do {
            let results = try context.fetch(fetchRequest)
            let first = results.filter { $0.artist?.artistId ==  id }.first
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
            return results.first
        }catch {
            throw error
        }
    }
    
}
