//
//  Artist.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation
import Alamofire

enum APIArtist: APIRouter {
    
    case getArtistList
    
    var path: String {
        switch self {
        case .getArtistList:
            return "search?term=star&amp;country=au&amp;media=movie&amp;all"
        }
    }
    
}


