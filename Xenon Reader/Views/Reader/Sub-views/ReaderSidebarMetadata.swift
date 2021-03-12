//
//  ReaderSidebarMetadata.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/11/21.
//

import SwiftUI

struct ReaderSidebarMetadata: View {
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        List {
            Section(header: Text("Details")) {
                DetailListRow(name: "Title", detail: xrShared.activeReadable?.epub?.title ?? "Unknown Title")
                DetailListRow(name: "Author", detail: xrShared.activeReadable?.epub?.author ?? "Unknown Author")
                DetailListRow(name: "Publisher", detail: xrShared.activeReadable?.epub?.publisher ?? "Unknown Publisher")
            }

            Section(header: Text("Counts")) {
                DetailListRow(name: "Chapter Count", detail: String(xrShared.activeReadable?.epub?.tableOfContents.subTable?.count ?? -1))
                DetailListRow(name: "Page Count", detail: String(xrShared.activeReadable?.epub?.spine.items.count ?? -1))
            }
        }
    }
}

#if DEBUG
struct ReaderSidebarMetadata_Previews: PreviewProvider {
    static var previews: some View {
        ReaderSidebarMetadata()
    }
}
#endif
