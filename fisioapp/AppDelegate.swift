//
//  AppDelegate.swift
//  fisioapp
//
//  Created by Carlos on 2/4/18.
//  Copyright © 2018 ProjectX. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = UIColor.orange
        self.window?.makeKeyAndVisible()
        
        
        //********************  UITabBarController  ********************//
        let appointmentsCollection = AppointmentsViewController()
        let productsCollection = ProductsViewController()
        let servicesCollection = ServicesViewController()
        let userProfileController = UserProfileViewController()
        
        //********************  UITabBarController  ********************//
        let appointmentsTableNavVC = UINavigationController(rootViewController: appointmentsCollection)
        let productsTableNavVC = UINavigationController(rootViewController: productsCollection)
        let servicesTableNavVC = UINavigationController(rootViewController: servicesCollection)
        let userProfileNavigation = UINavigationController(rootViewController: userProfileController)
        
        //********************  UITabBarController  ********************//
        let tabVC = UITabBarController()
        tabVC.viewControllers = [appointmentsTableNavVC, productsTableNavVC, servicesTableNavVC, userProfileNavigation]
        window?.rootViewController = tabVC

        return true
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {}
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationDidBecomeActive(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {
    }
    
    
}
