//
//  ArtistDetailViewController.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

class ArtistDetailViewController: UIViewController {
    
    private var customView = ArtistDetailView()
    private var artist: CDArtist?
    
    var log: CDLog?
    
    fileprivate enum ViewId: String {
        case cell = "cell"
    }
    
    convenience init(artist: CDArtist) {
        self.init()
        self.artist = artist
        title = artist.artistName
        customView.configure(with: artist)
        
        do {
            let context = CoreDataManager.mainContext
            log = try CDLog.saveRecordVisit(artist: artist, context: context)
            CoreDataManager.persist()
        } catch {
            Log.e(error.localizedDescription)
        }
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let artist = artist else { return }
        log?.saveLastVisit(artist: artist, state: false)
        CoreDataManager.persist()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func loadView() {
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
}

//MARK: - Setup Methods

fileprivate extension ArtistDetailViewController {
    
    func setup(){
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = Palette.backgroundColor
    }
    
}

// MARK: Setup Functionality

extension ArtistDetailViewController {
    
    func reloadData() {}
    
}
