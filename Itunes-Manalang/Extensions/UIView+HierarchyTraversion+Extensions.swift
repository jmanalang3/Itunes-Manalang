//
//  UIView+HierarchyTraversion+Extensions.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

// MARK: - View hierarchy traversion

extension UIView {
    
    class func doInViewHierarchy(from root: UIView, block: (UIView) -> ()) {
        block(root)
        for subview in root.subviews {
            UIView.doInViewHierarchy(from: subview, block: block)
        }
    }
    
    /// Performs the `block` on the entire view hierarchy, starting from the receiver
    /// as the root of the tree.
    func doInViewHierarchy(_ block: (UIView) -> ()) {
        UIView.doInViewHierarchy(from: self, block: block)
    }
    
    /// Finds the nearest superview where the predicate returns `true`.
    func nearestAncestor(where predicate: ((UIView) -> Bool)) -> UIView? {
        if let superview = superview {
            if predicate(superview) == true {
                return superview
            }
            return superview.nearestAncestor(where: predicate)
        }
        return nil
    }
    
}


