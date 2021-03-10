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
            switch self.xrShared.mainViewType {
                case .library: LibraryParentView().environmentObject(xrShared)
                case .reader: ReaderParentView().environmentObject(xrShared)
            }
        }
        .navigationTitle(self.xrShared.mainViewType == .library ? "Xenon Reader" : (self.xrShared.activeReadable?.epub?.title ?? "Unknown Title"))
        .navigationSubtitle(self.xrShared.mainViewType == .library ? generateReadableCount(count: self.xrShared.epubs.count) : (self.xrShared.activeReadable?.epub?.author ?? "Unknown Author"))
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
