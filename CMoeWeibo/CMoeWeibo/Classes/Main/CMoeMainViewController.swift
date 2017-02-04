//
//  CMoeMainViewController.swift
//  CMoeWeibo
//
//  Created by 陈晓林 on 2017/2/4.
//  Copyright © 2017年 陈晓林. All rights reserved.
//

import UIKit

class CMoeMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        addChildViewControllers()
        
        let path = Bundle.main.path(forResource: "MainVCSettings", ofType: "json")
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do {
                let dictArr = try JSONSerialization.jsonObject(with: jsonData as! Data, options: JSONSerialization.ReadingOptions.allowFragments)
                for dict in dictArr as! [[String : String]] {
                    addChildViewController(childControllerName: dict["vcName"]!, title: dict["title"]!, imageName: dict["imageName"]!)
                }
            } catch  {
                addChildViewControllers()
            }
        }
    }
    
    private func addChildViewControllers() {
        addChildViewController(childControllerName: "CMoeHomeTableViewController", title: "首页", imageName: "tabbar_home")
        addChildViewController(childControllerName: "CMoeMessageTableViewController", title: "消息", imageName: "tabbar_message_center")
        addChildViewController(childControllerName: "CMoeDescoverTableViewController", title: "广场", imageName: "tabbar_discover")
        addChildViewController(childControllerName: "CMoeProfileTableViewController", title: "我", imageName: "tabbar_profile")
    }
    
    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        let cls:AnyClass = NSClassFromString(namespace + "." + childControllerName)!
        print(cls)
        let vcCls = cls as! UITableViewController.Type
        let vc = vcCls.init()
        
        vc.title = title
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        
        tabBar.tintColor = UIColor.orange
        let nav = UINavigationController(rootViewController: vc)
        addChildViewController(nav)
    }
    
//    private func addChildViewController(childControllerName: String, title: String, imageName: String) {
//        let cls = NSClassFromString(childControllerName) as! UIViewController
//        let nav = UINavigationController()
//        nav.addChildViewController(cls)
//        cls.title = title
//        
////        let nav = UINavigationController(rootViewController: ))
//        
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
