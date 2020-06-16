//
//  ArtistListViewModel.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 16/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import Foundation

class ArtistListViewModel {
    
    var showLoadingHud: Bindable = Bindable(false)
    var onSuccess: (() -> ())?
    var onShowError: ((Error) -> ())?
    
    func getArtistList() {
        showLoadingHud.value = true
        API.shared.getArtistList { result in
            DispatchQueue.main.async {
                self.showLoadingHud.value = false
                switch result {
                case .success(let data):
                    let context = CoreDataManager.mainContext
                    data.forEach {
                        do {
                            try CDArtist.savingRecord(artist: $0, context: context)
                        } catch {
                            self.onShowError?(error)
                        }
                    }
                    CoreDataManager.persist()
                    self.onSuccess?()
                case .failure(let error):
                    self.onShowError?(error)
                }
            }
        }
    }
    
}
