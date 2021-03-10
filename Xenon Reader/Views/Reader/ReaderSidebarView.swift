//
//  ReaderSidebarView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

// TODO: Switch to EPUBSpine instead of EPUBTableOfContents for getting pages
struct ReaderSidebarView: View {
    @EnvironmentObject var xrShared: XRShared
    @State private var defaultItemActive: Bool = true

    var body: some View {
        List {
            if let subTable = xrShared.activeReadable?.epub?.tableOfContents.subTable {
                ForEach(Array(subTable.enumerated()), id: \.offset) { index, item in
                    if index == 0 {
                        NavigationLink(
                            destination: ReaderRenderView(activeReadable: xrShared.activeReadable, filename: item.item), isActive: $defaultItemActive) {
                                Text(item.label)
                        }
                    } else {
                        NavigationLink(
                            destination: ReaderRenderView(activeReadable: xrShared.activeReadable, filename: item.item)) {
                                Text(item.label)
                        }
                    }
                }
            } else {
                Text("No TOC Available")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

#if DEBUG
struct ReaderSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderSidebarView()
            .environmentObject(XRShared())
    }
}
#endif
