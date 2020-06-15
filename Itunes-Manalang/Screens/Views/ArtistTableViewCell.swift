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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configure(with artist: CDArtist){
        //        self.imvMovie.downloadImageWithCaching(with: movie.imageURL,placeholderImage: #imageLiteral(resourceName: "placeholder-image"))
        self.lblArtistTitle.text = artist.artistName ?? ""
        //        self.lblMovieDescription.text = movie.overview ?? ""
        //        self.lblMovieReleaseDate.text = movie.releaseDate ?? ""
    }
}
