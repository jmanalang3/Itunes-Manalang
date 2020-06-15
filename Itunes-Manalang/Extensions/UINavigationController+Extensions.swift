//
//  UINavigationController+Extensions.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func clearBackgroundWithDivider() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
    
}

