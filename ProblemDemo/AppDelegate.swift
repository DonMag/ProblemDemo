//
//  AppDelegate.swift
//  ProblemDemo
//
//  Created by Tycho Pandelaar on 23/06/2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

	override init() {
		super.init()

		// WORKAROUND: Storyboards do not trigger the loading of resource bundles in Swift Packages.
		// Taken from https://stackoverflow.com/questions/58000140/swift-package-manager-storyboard-bundle
		let bundleNames = ["MyLibrary_MyLibrary"]
		bundleNames.forEach { (bundleName) in
			guard
				let bundleURL = Bundle.main.url(forResource: bundleName, withExtension: "bundle"),
				let bundle = Bundle(url: bundleURL) else {
				preconditionFailure()
			}
			bundle.load()
		}

		let bundles = Bundle.allBundles
		bundles.forEach { (bundle) in
			print("Bundle identifier loaded: \(bundle.bundleIdentifier ?? "Bundle \(bundle) has no identifier")")
		}
	}

	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		// Override point for customization after application launch.
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

