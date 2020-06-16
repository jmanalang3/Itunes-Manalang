//
//  ArtistListViewController.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {
    
    private var tableView = UITableView(frame: .zero)
    private var dataSource: ArtistListDataSource?
    private var viewModel = ArtistListViewModel()
    
    fileprivate enum ViewId: String {
        case cell = "cell"
    }
    
    convenience init(log: CDLog) {
        self.init()
        guard let artist = log.artist else { return }
        let controller = ArtistDetailViewController(artist: artist)
        self.navigationController?.pushViewController(controller, animated: false)
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
    }
}

//MARK: - Setup Methods

fileprivate extension ArtistListViewController {
    
    func setup(){
        dataSource = ArtistListDataSource(withIdentifier: ViewId.cell.rawValue)
        setupUI()
        setupBinding(with: viewModel)
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
        tableView.delegate = self
        view.backgroundColor = Palette.backgroundColor
    }
    
    func setupBinding(with viewModel: ArtistListViewModel) {
        viewModel.onSuccess = { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
        viewModel.onShowError = { error in
            Log.e(error)
        }
        viewModel.getArtistList()
    }
}

// MARK: Setup Functionality

extension ArtistListViewController {
    
    func reloadData(){
        tableView.reloadData()
    }
    
}

// MARK: Setup Functionality

extension ArtistListViewController: UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let items = dataSource?.items else { return }
        let artist = items[indexPath.row]
        let controller = ArtistDetailViewController(artist: artist)
        navigationController?.pushViewController(controller, animated: true)
        Log.d("item selected == \(artist)")
    }
    
}



