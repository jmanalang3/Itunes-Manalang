//
//  AppNavigationController.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

class AppNavigationController: UINavigationController {
    
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }
}

//MARK: - Setup Methods

fileprivate extension AppNavigationController {
    
    func setup(){
        setupUI()
        delegate = self
    }
    
    func setupUI() {
        navigationBar.titleTextAttributes = [.font: Fonts.Helvetica.bold(of: 18), .foregroundColor: UIColor.white]
    }
}

// MARK: UINavigationControllerDelegate

extension AppNavigationController: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController,
                              willShow viewController: UIViewController, animated: Bool) {
        viewController.navigationItem.backBarButtonItem = UIBarButtonItem(title: "",
                                                                          style: .plain, target: nil, action: nil)
    }
    
    func navigationController(_ navigationController: UINavigationController,
                              didShow viewController: UIViewController, animated: Bool) {}
}


