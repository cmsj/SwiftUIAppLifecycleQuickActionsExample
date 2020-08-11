//
//  ShortcatsApp.swift
//  Shortcats
//
//  Created by Chris Jones on 06/08/2020.
//

import SwiftUI

class ViewModel: ObservableObject {
    public static let shared = ViewModel()

    @Published var shortcutType: String = "Not set yet" {
        didSet {
            print("viewModel shortcutType set to: \(shortcutType)")
        }
    }

    @Published var didFinishCalled = "multiply.circle"
    @Published var didFinishHadShortcutItem = "question.circle"
    @Published var didPerformAF = "multiply.circle"
}

class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        let viewModel = ViewModel.shared

        viewModel.didFinishCalled = "checkmark.circle"

        if let shortcutItem = launchOptions?[UIApplication.LaunchOptionsKey.shortcutItem] as? UIApplicationShortcutItem {
            viewModel.shortcutType = shortcutItem.type
            viewModel.didFinishHadShortcutItem = "checkmark.circle"
        } else {
            viewModel.didFinishHadShortcutItem = "multiply.circle"
        }

        return true
    }

    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let viewModel = ViewModel.shared

        viewModel.didPerformAF = "checkmark.circle"
        viewModel.shortcutType = shortcutItem.type
    }
}

@main
struct ShortcatsApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    init() {
        // Set a Quick Action
        let icon = UIApplicationShortcutIcon(systemImageName: "bell")
        let item = UIApplicationShortcutItem(type: "meow",
                                             localizedTitle: "Meow",
                                             localizedSubtitle: "Make the app more catty",
                                             icon: icon,
                                             userInfo: nil)
        UIApplication.shared.shortcutItems = [item]
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
