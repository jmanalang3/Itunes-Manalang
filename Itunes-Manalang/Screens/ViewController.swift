//
//  ViewController.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let request = AF.request("https://itunes.apple.com/search?term=star&amp;country=au&amp;media=movie&amp;all")
        request.responseJSON { (data) in
            print(data)
        }
        request.responseDecodable(of: ApiDefaultResult.self) { (response) in
            guard let films = response.value else { return }
            Log.d(films.data)
        }
        
    }
}

struct ApiDefaultResult: Codable {
    
    var resultCount: Int?
    var data: [Movie]?
    
    enum CodingKeys: String, CodingKey {
        case resultCount
        case data = "results"
    }
}

struct Movie: Codable {
    var artistId: Int?
    var artistName: String?
    var artistViewUrl: String?
    var artworkUrl100: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var collectionCensoredName: String?
    var collectionExplicitness: String?
    var collectionId: Int?
    var collectionName: String?
    var collectionPrice: Double?
    var collectionViewUrl: String?
    var country: String?
    var currency: String?
    var discCount: Int?
    var discNumber: Int?
    var isStreamable: Bool?
    var kind: String?
    var longDescription: String?
    var previewUrl: String?
    var primaryGenreName: String?
    var releaseDate: String?
    var trackCensoredName: String?
    var trackCount: Int?
    var trackExplicitness: String?
    var trackId: Int?
    var trackName: String?
    var trackNumber: Int?
    var trackPrice: Double?
    var trackTimeMillis: Int?
    var trackViewUrl: String?
    var wrapperType: String?
}