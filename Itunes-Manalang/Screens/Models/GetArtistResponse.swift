//
//  GetArtistResponse.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

struct GetArtistResponse: Codable {
    
    var resultCount: Int?
    var data: [Artist]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case data = "results"
    }
}
