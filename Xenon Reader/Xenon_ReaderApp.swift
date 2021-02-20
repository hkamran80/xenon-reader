//
//  Xenon_ReaderApp.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

@main
struct Xenon_ReaderApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(title: "Xenon Reader")
        }

        #if os(macOS)
            Settings {
                SettingsView()
            }
        #endif
    }
}
