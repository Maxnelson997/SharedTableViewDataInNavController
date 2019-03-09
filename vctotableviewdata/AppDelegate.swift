//
//  AppDelegate.swift
//  vctotableviewdata
//
//  Created by Max Nelson on 3/9/19.
//  Copyright © 2019 Maxcodes. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        
        let navController = CustomController()

        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = navController
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



class CustomController: UITabBarController {
    var amount: Int = 0 {
        didSet {
            // update the amount in each table view and reload the data for each.
            let firstVC = viewControllers?[0] as? ViewController
            firstVC?.amount = amount
            firstVC?.tableView.reloadData()
            
            let secondVC = viewControllers?[1] as? ItemsController
            secondVC?.amount = amount
            secondVC?.tableView.reloadData()
        }
    }
    
    fileprivate var firstVC = ViewController()
    fileprivate var secondVC = ItemsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstVC.tabBarItem.title = "first"
        secondVC.tabBarItem.title = "second"
        viewControllers = [firstVC, secondVC]
    }
}
