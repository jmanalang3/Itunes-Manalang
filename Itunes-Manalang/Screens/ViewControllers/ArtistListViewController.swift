//
//  ArtistListViewController.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit
import Alamofire

class ArtistListViewController: UIViewController {
    
    private var tableView = UITableView(frame: .zero)
    
    var dataSource: ArtistListDataSource?
    
    fileprivate enum ViewId: String {
        case cell = "cell"
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        view = tableView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //        API.shared.getArtistList()
        
        
        
        
        
        let request = AF.request("https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all")
        request.responseJSON { (data) in
            // print(data)
        }
        request.responseDecodable(of: GetArtistResponse.self) { (response) in
            guard let value = response.value,
                let data = value.data else { return }
            
            //  Log.d(data)
            
            DispatchQueue.main.async {
                let context = CoreDataManager.mainContext
                
                data.forEach {
                    do {
                        try CDArtist.savingRecord(artist: $0, context: context)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                
                CoreDataManager.persist()
                
                
                let fetchRequest = CoreDataManager.fetchRequest(entity: CDArtist.self,
                                                                sortDescriptors: [],
                                                                context: context)
                let fetchedResultsController = CoreDataManager.fetchedResultsControllert(entity: CDArtist.self,
                                                                                         request: fetchRequest,
                                                                                         context: context)
                
                do {
                    try fetchedResultsController.performFetch()
                } catch {
                    print(error.localizedDescription)
                }
                
                guard let objects = fetchedResultsController.fetchedObjects else {
                    return
                }
                
                objects.forEach {
                    Log.d($0.artistId)
                    self.reloadData()
                }
            }
            
        }
        
    }
}

//MARK: - Setup Methods

fileprivate extension ArtistListViewController {
    
    func setup(){
        dataSource = ArtistListDataSource(withIdentifier: ViewId.cell.rawValue)
        setupUI()
        
    }
    
    func setupUI() {
        configureNavigationWithAction("Artist List")
        tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.keyboardDismissMode = .onDrag
        tableView.register(UINib(nibName: String(describing: ArtistTableViewCell.self), bundle: nil),
                           forCellReuseIdentifier: ViewId.cell.rawValue)
        tableView.dataSource = dataSource
        view.backgroundColor = Palette.backgroundColor
        
    }
}

// MARK: Setup Functionality

extension ArtistListViewController {
    
    func reloadData(){
        tableView.reloadData()
    }
    
}



