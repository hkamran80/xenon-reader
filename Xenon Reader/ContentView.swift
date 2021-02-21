//
//  ContentView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import SwiftUI

// TODO: Add onboarding
struct ContentView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        NavigationView {
            SidebarView()
                .environmentObject(self.xrShared)

            GridView(epubs: self.xrShared.epubs)
        }
        .navigationTitle("Xenon Reader")
        .navigationSubtitle(readableCount(count: self.xrShared.epubs.count))
        .frame(minWidth: 350, maxWidth: .infinity, minHeight: 300, maxHeight: .infinity)
        .modifier(ToolbarModifier(xrShared: self.xrShared))
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
