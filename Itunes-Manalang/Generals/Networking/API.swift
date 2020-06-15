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
    
    // Call Get Artist List API
    func getArtistList() {
        let manager = APIManager.shared
        let request = manager.session.request(APIArtist.getArtistList)
        request.responseJSON { (data) in
             print(data)
        }
    }
}
