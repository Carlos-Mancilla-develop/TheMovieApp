//
//  AppDelegate.swift
//  TheMovieApp
//
//  Created by Carlos Mancilla on 25-11-20.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let MainView = MainRouter.createMainModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = MainView
        window?.makeKeyAndVisible()
        
        return true
    }


}

