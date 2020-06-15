//
//  AppError.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

struct ApiError: LocalizedError {
    
    let message: String
    
    var errorDescription: String? {
        return message
    }
    
    var localizedDescription: String {
        return message
    }
    
    init(_ message: String) {
        self.message = message
    }
    
    static func unexpected(_ message: String) -> ApiError {
        return ApiError("Unexpected error: \(message)")
    }
    
    static func fromServer(_ message: String) -> ApiError {
        return ApiError("Server returned the message:\n\(message)")
    }
    
}
