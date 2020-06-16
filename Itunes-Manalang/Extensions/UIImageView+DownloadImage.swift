//
//  UIImageView+DownloadImage.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    public func downloadImageWithCaching(with url: String?, placeholderImage: UIImage? = nil){
        guard let url = url, url != "" else {
            self.image = placeholderImage
            return
        }
        guard let imageURL = URL.init(string: url) else{
            self.image = placeholderImage
            return
        }
        let imageResource = ImageResource(downloadURL: imageURL)
        self.kf.setImage(with: imageResource, placeholder: placeholderImage,
                         options: [.transition(.fade(0.1))], progressBlock: nil)
    }
    
}
