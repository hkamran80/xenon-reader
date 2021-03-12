//
//  GridView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import SwiftUI

struct GridView: View {
    @AppStorage("librarySortType") var librarySort: LibrarySortTypes = .title
    @EnvironmentObject var xrShared: XRShared

    let epubs: [EpubLoader]

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(sortLibraryList(epubList: epubs, sortType: librarySort), id: \.id) { epub in
                    GridViewBook(epub: epub.epub)
                        .onTapGesture(count: 2, perform: {
                            self.xrShared.activeReadable = epub
                            self.xrShared.mainViewType = .reader
                        })
                }
            }
            .padding(.horizontal)
        }
    }
}

#if DEBUG
struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(epubs: [])
            .environmentObject(XRShared())
    }
}
#endif
