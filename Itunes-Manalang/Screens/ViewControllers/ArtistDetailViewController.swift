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
    private var artist: CDArtist
    
    var log: CDLog?
        
    fileprivate enum ViewId: String {
        case cell = "cell"
    }
    
    init(artist: CDArtist) {
        self.artist = artist
        super.init(nibName: nil, bundle: nil)
        title = artist.artistName
        let context = CoreDataManager.mainContext
        log = CDLog(context: context)
        log?.saveRecord(artist: artist)
        customView.configure(with: artist)
        CoreDataManager.persist()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        log?.saveLastVisit()
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
