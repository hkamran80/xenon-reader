//
//  ReaderParentView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

struct ReaderParentView: View {
    @EnvironmentObject var xrShared: XRShared
    let epub: EPUBDocument?

    var body: some View {
        if let loadedEpub = epub {
            ReaderSidebarView(toc: loadedEpub.tableOfContents)
                .environmentObject(self.xrShared)

            Text("Reader here")
        } else {
            EmptyView()
            
            Text("No Active Readable")
        }
    }
}

#if DEBUG
struct ReaderParentView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderParentView(epub: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/SpySchoolBritishInvasion_StuartGibbs.epub")!))
            .environmentObject(XRShared())
    }
}
#endif
