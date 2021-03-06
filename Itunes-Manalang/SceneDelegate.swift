//
//  SceneDelegate.swift
//  Itunes-Manalang
//
//  Created by Jeffrey Manalang (HLB) on 15/06/2020.
//  Copyright © 2020 Jeffrey Manalang. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        // MARK: - SetUp CoreDataManager
        
        CoreDataManager.setUp(withDataModelName: CoreDataName.modelName,
                              bundle: .main,
                              persistentStoreName: CoreDataName.persistentName)
        
        var controller = ArtistListViewController()
        
        do {
            let context = CoreDataManager.mainContext
            if let log = try CDLog.fetchLastVistedScreen(context: context) {
                controller = ArtistListViewController(log: log)
                Log.d("last visit screen == \(log)")
            }
        } catch {
            Log.e(error.localizedDescription)
        }
        
        let rootViewController = AppNavigationController(rootViewController: controller)
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {}
    
    func sceneDidBecomeActive(_ scene: UIScene) {}
    
    func sceneWillResignActive(_ scene: UIScene) {}
    
    func sceneWillEnterForeground(_ scene: UIScene) {}
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        CoreDataManager.persist()
    }
    
}

