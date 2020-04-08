//
//  AppDelegate.swift
//  quarantine-cookoff
//
//  Created by shekar ramaswamy on 4/8/20.
//  Copyright © 2020 homework. All rights reserved.
//

import UIKit
import SCSDKLoginKit

let mainVC = LoginVC()

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)

        window?.makeKeyAndVisible()
        window?.rootViewController = mainVC
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return SCSDKLoginClient.application(app, open: url, options: options)
    }
    
}

