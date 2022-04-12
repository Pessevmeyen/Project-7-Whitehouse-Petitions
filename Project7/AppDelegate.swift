//
//  AppDelegate.swift
//  Project7
//
//  Created by Furkan Eruçar on 8.04.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if let tabBarController = window?.rootViewController as? UITabBarController { // Our storyboard automatically creates a window in which all our view controllers are shown. This window needs to know what its initial view controller is, and that gets set to its rootViewController property. This is all handled by our storyboard. In the Single View App template, the root view controller is the ViewController, but we embedded ours inside a navigation controller, then embedded that inside a tab bar controller. So, for us the root view controller is a UITabBarController.
            let storyboard = UIStoryboard(name: "Main", bundle: nil) // We need to create a new ViewController by hand, which first means getting a reference to our Main.storyboard file. This is done using the UIStoryboard class, as shown. You don't need to provide a bundle, because nil means "use my current app bundle."
            let vc = storyboard.instantiateViewController(withIdentifier: "NavController") // We create our view controller using the instantiateViewController() method, passing in the storyboard ID of the view controller we want. Earlier we set our navigation controller to have the storyboard ID of "NavController", so we pass that in.
            vc.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1) // We create a UITabBarItem object for the new view controller, giving it the "Top Rated" icon and the tag 1. That tag will be important in a moment.
            tabBarController.viewControllers?.append(vc) // We add the new view controller to our tab bar controller's viewControllers array, which will cause it to appear in the tab bar.
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

