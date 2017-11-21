//
//  AppDelegate.swift
//  SampleFollowIntegration
//
//  Created by Raphaël El Beze on 15/06/2017.
//  Copyright © 2017 FollowAnalytics. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, FAFollowAppsDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        /*
         Call this method to initiate follow
         id : Your app ID
         sharedAppGroup : An App group for the badge management (works with the notification service extension)
         debugStateOn : A booleen to tell follow if the build is in debug/release
         automatise : A Booleen to automatise the integration with the life cycle of the appDelegate.
        */
        FAFollowApps.configure(withId: "myAppId", sharedAppGroup: "MySharedAppGroupIfIHaveOne", automatise: false, debugStateOn: false, options: launchOptions)
        
        /*
         If the automatise is set to false you have link the followAppsDelegate.
         */
        FAFollowApps.sharedFA().followAppsDelegate = self
        
        /*
         If you use notification in your application you have listen to the notification center delegate.
         */
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    /*
        Theses methods are require, Follow need to have the lyfe cylcle for the analytics part.
     */
    func applicationDidEnterBackground(_ application: UIApplication) {
        FAFollowApps.sharedFA().applicationDidEnterBackground(application)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        FAFollowApps.sharedFA().applicationWillEnterForeground(application)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        FAFollowApps.sharedFA().applicationDidBecomeActive(application)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        FAFollowApps.sharedFA().applicationWillTerminate(application)
    }
    
    func applicationDidReceiveMemoryWarning(_ application: UIApplication) {
        FAFollowApps.sharedFA().applicationDidReceiveMemoryWarning(application)
    }
    
    
    func application(_ application: UIApplication, handleEventsForBackgroundURLSession identifier: String, completionHandler: @escaping () -> Void) {
        FAFollowApps.sharedFA().application(application, handleEventsForBackgroundURLSession: identifier, completionHandler: completionHandler)
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey  : Any] = [:]) -> Bool {
        let isFAUrl = FAFollowApps.sharedFA().application(app, open: url, options:options)
        return isFAUrl
    }
    
    /*
        These following methods are used for the push notification.
     */
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        FAFollowApps.sharedFA().application(application, didRegisterForRemoteNotificationsWithDeviceToken: deviceToken)
    }
    
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        FAFollowApps.sharedFA().userNotificationCenter(center, didReceive: response, withCompletionHandler: completionHandler)
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        FAFollowApps.sharedFA().userNotificationCenter(center, willPresent: notification, withCompletionHandler: completionHandler)
    }
    
    
    
    // Implement other delegate to handle lower version than iOS 10
    
    // For example for ios 9 remote notification
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        FAFollowApps.sharedFA().application(application, didReceiveRemoteNotification: userInfo, fetchCompletionHandler: completionHandler)
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        FAFollowApps.sharedFA().application(application, didReceiveRemoteNotification: userInfo)
    }
    
    // Here for the open Url. (App Link)
    
    func application(_ application: UIApplication, handleOpen url: URL) -> Bool {
        return FAFollowApps.sharedFA().application(application, handleOpen: url)
    }
    
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
      return FAFollowApps.sharedFA().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }


}

