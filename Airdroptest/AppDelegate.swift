//
//  AppDelegate.swift
//  Airdroptest
//
//  Created by Rohaine Hsu on 9/21/15.
//  Copyright © 2015 Rohaine Hsu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(app: UIApplication, openURL url: NSURL, options: [String : AnyObject]) -> Bool {
        /*do {
            let contentsOfFile = try NSString(contentsOfFile: url.path!, encoding: NSUTF8StringEncoding)
            print("Content of file = \(contentsOfFile)")
        } catch let error as NSError {
            print(error)
            print("No file found")
        }*/
        
        let documentDirectoryURL = try! NSFileManager.defaultManager().URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: true)
        
        let fileDestinationUrl = documentDirectoryURL.URLByAppendingPathComponent("Inbox")
        /*do {
            let contentsOfFile = try NSString(contentsOfFile: fileDestinationUrl.path!, encoding: NSUTF8StringEncoding)
            print("Content of file = \(contentsOfFile)")
        } catch let error as NSError {
            print(error)
            print("No file found")
        }*/
        
            do {
                let directoryContents = try NSFileManager.defaultManager().contentsOfDirectoryAtURL(fileDestinationUrl.absoluteURL, includingPropertiesForKeys: nil, options: NSDirectoryEnumerationOptions())
                print(directoryContents)
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }

        return true
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

