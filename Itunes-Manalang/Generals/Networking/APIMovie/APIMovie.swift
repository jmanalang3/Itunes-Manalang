//
//  APIMovie.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation
import Alamofire

enum APIMovie: APIRouter {
    
    case getMovieList
    
    var path: String {
        switch self {
        case .getMovieList:
            return "search?term=star&amp;country=au&amp;media=movie&amp;all"
        }
    }
    
}


