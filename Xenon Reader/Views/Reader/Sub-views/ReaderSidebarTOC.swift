//
//  ReaderSidebarTOC.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/11/21.
//

import SwiftUI

struct ReaderSidebarTOC: View {
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        List {
            if let activeReadable = xrShared.activeReadable,
               let subTable = activeReadable.epub?.tableOfContents.subTable
            {
                ForEach(subTable, id: \.id) { item in
                    Button(action: {
                        let spineItems = activeReadable.epub?.spine.items
                        let manifestItems = activeReadable.epub?.manifest.items.map { $0.1 }
                        let itemNoPercent = item.item?.removingPercentEncoding

                        if let spineIndex = spineItems?.firstIndex(where: { $0.idref == manifestItems?.first(where: { $0.path == itemNoPercent })?.id }) {
                            xrShared.activeReadable?.spineItemIndex = spineIndex
                        }
                    }) {
                        Text(item.label)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .frame(width: 180, height: 15, alignment: .leading)
                    .padding(.leading, 4)
                    .padding(.vertical, 2)
                    .modifier(TOCFocusModifier(buttonText: item.label, activeChapter: getActiveChapterTitle(activeReadable: activeReadable)))
                }
            } else {
                Text("No TOC Available")
            }
        }
        .listStyle(SidebarListStyle())
    }
}

#if DEBUG
struct ReaderSidebarTOC_Previews: PreviewProvider {
    static var previews: some View {
        ReaderSidebarTOC()
    }
}
#endif
