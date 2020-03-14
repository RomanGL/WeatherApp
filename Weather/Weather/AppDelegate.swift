//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.
// Licensed under the MIT License. See LICENSE file in the project root for full license information.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    private(set) var navigationController: UINavigationController?
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        navigationController = UINavigationController()

        let mainViewController = WeatherViewController()
        navigationController!.pushViewController(mainViewController, animated: false)

        window = UIWindow(frame: UIScreen.main.bounds)
        if let window = window {
            window.rootViewController = navigationController
            window.backgroundColor = UIColor.white
            window.makeKeyAndVisible()
        }

        return true
    }
}
