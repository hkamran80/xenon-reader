//
//  SettingsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct SettingsView: View {
    private enum Tabs: Hashable {
        case general, debug
    }

    var body: some View {
        TabView {
            GeneralSettingsView()
                .tabItem {
                    Label("General", systemImage: "gear")
                }
                .tag(Tabs.general)

            DebugSettingsView()
                .tabItem {
                    Label("Debug", systemImage: "ladybug")
                }
                .tag(Tabs.debug)
        }
        .padding(20)
        .frame(minWidth: 350, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
}

#if DEBUG
    struct SettingsView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
#endif
