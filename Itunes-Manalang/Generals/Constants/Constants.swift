//
//  Constants.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

enum InternetConnectionErrorCode: Int {
    case offline = 10101
}

class APIBasePath {
    static var url = "https://itunes.apple.com/"
}

class CoreDataName {
    static var modelName = "Itunes_Manalang"
    static var persistentName = "ItunesManalangDatabase"
}
