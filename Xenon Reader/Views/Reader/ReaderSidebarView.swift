//
//  ReaderSidebarView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

struct ReaderSidebarView: View {
    @EnvironmentObject var xrShared: XRShared
    let toc: EPUBTableOfContents?
    
    @State private var defaultItemActive: Bool = true

    var body: some View {
        List {
            if let subTable = toc?.subTable {
                ForEach(subTable, id: \.id) { item in
                    NavigationLink(
                        destination: ReaderRenderView(activeReadable: xrShared.activeReadable, filename: item.item)) {
                            Text(item.label)
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
        ReaderSidebarView(toc: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/SpySchoolBritishInvasion_StuartGibbs.epub")!)!.tableOfContents)
            .environmentObject(XRShared())
    }
}
#endif
