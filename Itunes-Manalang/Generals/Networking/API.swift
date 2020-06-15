//
//  API.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

class API {
    
    static let shared:API = {
        let instance = API()
        return instance
    }()
    
    
    init() {}
    
    // Call Get Movie List API
    func getMovieList() {
        let manager = APIManager.shared
        let request = manager.session.request(APIMovie.getMovieList)
        request.responseJSON { (data) in
             print(data)
        }
    }
}
