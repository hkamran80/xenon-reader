//
//  ListView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import EPUBKit
import SwiftUI

struct ListView: View {
    @EnvironmentObject var xrShared: XRShared

    let epubs: [EpubLoader]
    var body: some View {
        List {
            ForEach(epubs, id: \.id) { epub in
                ListViewBook(epub: epub.epub)
                    .onTapGesture(count: 2, perform: {
                        self.xrShared.activeReadable = epub
                        self.xrShared.mainViewType = .reader
                    })
            }
        }
    }
}

#if DEBUG
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(epubs: [])
            .environmentObject(XRShared())
    }
}
#endif
