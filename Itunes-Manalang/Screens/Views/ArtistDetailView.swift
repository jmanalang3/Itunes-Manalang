//
//  DetailHeaderView.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

@IBDesignable
class ArtistDetailView: UIView {
    
    @IBOutlet private weak var imvArtist: UIImageView!
    @IBOutlet private weak var lblArtistTitle: UILabel!
    @IBOutlet private weak var lblArtistReleaseDate: UILabel!
    @IBOutlet private weak var lblArtistDescription: UILabel!
    
    @IBOutlet private weak var lblTractName: UILabel!
    @IBOutlet private weak var lblGenre: UILabel!
    @IBOutlet private weak var lblPrice: UILabel!
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var lblLastVisted: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStructure()
        applyTheme()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStructure()
        applyTheme()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupStructure()
        applyTheme()
    }
    
}

// MARK: Setup View

fileprivate extension ArtistDetailView {
    
    func setupStructure() {
        let viewFromNib = viewFromOwnedNib()
        addSubviewAndFill(viewFromNib)
    }
    
    func applyTheme() {}
    
}

// MARK: Setup Functionality

extension ArtistDetailView {
    
    func configure(with artist: CDArtist){
        
        do {
            let context = CoreDataManager.mainContext
            let fetched = try CDLog.fetch(by: artist.artistId, context: context)
            if let lastVisit = fetched?.lastVisitDate {
                self.lblLastVisted.text = DateApp.string(fromDate: lastVisit, withFormat: .birthdayServer)
                containerView.isHidden = false
            }else {
                containerView.isHidden = true
            }
        }catch {
            Log.e(error.localizedDescription)
            containerView.isHidden = true
        }
        

        self.imvArtist.downloadImageWithCaching(with: artist.artworkUrl100, placeholderImage: #imageLiteral(resourceName: "placeholder-image"))
        self.lblArtistTitle.text = artist.artistName ?? ""
        self.lblArtistDescription.text = artist.longDescription ?? ""
        
        if let releaseDate = artist.releaseDate,
            let date = DateApp.date(fromString: releaseDate , withFormat: .itunes) {
            let formated = DateApp.string(fromDate: date, withFormat: .facebookServer)
            self.lblArtistReleaseDate.text = formated
        }
        
        lblTractName.text = artist.trackName
        lblGenre.text = artist.primaryGenreName
        lblPrice.text = artist.trackPrice?.stringValue
    }
    
}
