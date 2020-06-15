//
//  ArtistListDataSource.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit
import CoreData

class ArtistListDataSource: NSObject, UITableViewDataSource {
    
    private lazy var fetchedResultsController: NSFetchedResultsController<CDArtist> = {
        let context = CoreDataManager.mainContext
        let fetchRequest = CoreDataManager.fetchRequest(entity: CDArtist.self,
                                                        sortDescriptors: [],
                                                        context: context)
        let fetchedResultsController = CoreDataManager.fetchedResultsControllert(entity: CDArtist.self,
                                                                                 request: fetchRequest,
                                                                                 context: context)
        return fetchedResultsController
    }()
    
    var identifier: String
    
    init(withIdentifier identifier: String) {
        self.identifier = identifier
        super.init()
        do {
            try fetchedResultsController.performFetch()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let data = fetchedResultsController.fetchedObjects else { return 0 }
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as? ArtistTableViewCell else {
            return UITableViewCell()
        }
        guard let data = fetchedResultsController.fetchedObjects else { return UITableViewCell() }
        let artist = data[indexPath.row]
        cell.configure(with: artist)
        return cell
    }
    
}
