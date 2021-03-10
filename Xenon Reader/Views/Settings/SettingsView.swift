//
//  SettingsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct SettingsView: View {
    private enum Tabs: Hashable {
        case library, reader
    }

    var body: some View {
        TabView {
            LibrarySettingsView()
                .tabItem {
                    Label("Library", systemImage: "books.vertical")
                }
                .tag(Tabs.library)

            ReaderSettingsView()
                .tabItem {
                    Label("Reader", systemImage: "book")
                }
                .tag(Tabs.reader)
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
