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
    func getArtistList(completion: ApiOperationCompletionBlock<[Artist]>? = nil) {
        let manager = APIManager.shared
        let request = manager.session.request(APIArtist.getArtistList)
        request.responseDecodable(of: GetArtistResponse.self) { (response) in
            if let error = response.error {
                completion?(.failure(ApiError(error.localizedDescription)))
                return
            }
            guard let value = response.value, let artists = value.data else {
                completion?(.success([]))
                return
            }
            completion?(.success(artists))
        }
    }
}
