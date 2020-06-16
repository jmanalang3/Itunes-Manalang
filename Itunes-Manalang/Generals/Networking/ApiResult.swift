//
//  ApiResult.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

enum ApiResult<T> {
    case success(T)
    case failure(Error)
}

typealias ApiOperationCompletionBlock<T> = (ApiResult<T>) -> Void
