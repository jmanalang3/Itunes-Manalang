//
//  AppDelegate.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit
@UIApplicationMain
class AppDelegate: UIResponder {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
}

// MARK: UISceneSession Lifecycle

@available(iOS 13.0, *)
extension AppDelegate: UIApplicationDelegate {
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {}
    
}
