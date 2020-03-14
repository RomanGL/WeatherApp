//
//  AppDelegate.swift
//  Weather
//
//  Created by r.gladkikh on 13.03.2020.
//  Copyright © 2020 r.gladkikh. All rights reserved.
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
