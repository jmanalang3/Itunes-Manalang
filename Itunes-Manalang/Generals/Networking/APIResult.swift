//
//  APIResult.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

enum APIResult <Value> {
    
    case success(value: Value)
    case failure(error: APICallError)
    
    // Remove it if not needed.
    init(_ f: () throws -> Value) {
        do {
            let value = try f()
            self = .success(value: value)
        } catch let error as APICallError {
            self = .failure(error: error)
        } catch let error {
            Log.e(error)
            self = .failure(error: APICallError(status: .failed))
        }
    }
}
