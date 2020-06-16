//
//  ArtistTableViewCell.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

class ArtistTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var imvArtist: UIImageView!
    @IBOutlet private weak var lblArtistTitle: UILabel!
    @IBOutlet private weak var lblArtistReleaseDate: UILabel!
    @IBOutlet private weak var lblArtistDescription: UILabel!
    
    @IBOutlet private weak var lblTractName: UILabel!
    @IBOutlet private weak var lblGenre: UILabel!
    @IBOutlet private weak var lblPrice: UILabel!
    
    func configure(with artist: CDArtist){
        
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
