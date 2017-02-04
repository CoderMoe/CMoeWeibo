//
//  AppDelegate.swift
//  CMoeWeibo
//
//  Created by 陈晓林 on 2017/2/4.
//  Copyright © 2017年 陈晓林. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }

    

}

