//
//  APIManager.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation
import Alamofire


class APIManager {

    static let shared: APIManager = {
        let instance = APIManager()
        return instance
    }()
    
    let session = AF
    
}
