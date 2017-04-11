//
//  Created by Mateusz Szklarek on 24/09/15.
//  Copyright © 2015 EL Passion. All rights reserved.
//

import UIKit
import Fabric
import Crashlytics
import GameAnalytics
import FBSDKCoreKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private let gai: GAI? = {
        guard let gai = GAI.sharedInstance() else { return nil}
        gai.trackUncaughtExceptions = true
        gai.dispatchInterval = 20
        return gai
    }()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        Fabric.with([Crashlytics.self, GameAnalytics.self])
        GameAnalytics.initializeWithConfiguredGameKeyAndGameSecret()
        setupGoogleAnalytics()
        FBSDKApplicationDelegate.sharedInstance().application(application, didFinishLaunchingWithOptions: launchOptions)
        window = UIWindow(frame: UIScreen.main.bounds)
        guard let gai = gai else { return false}
        window?.rootViewController = StartViewController(tracker: Tracker(gaiTracker: gai.defaultTracker))
        window?.makeKeyAndVisible()
        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        FBSDKAppEvents.activateApp()
    }

    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
        return FBSDKApplicationDelegate.sharedInstance().application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
    }

    func setupGoogleAnalytics() {
        var configureError: NSError?
        GGLContext.sharedInstance().configureWithError(&configureError)
        assert(configureError == nil, "Error configuring Google services: \(configureError)")
    }

}
