//
//  GridView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import SwiftUI

struct GridView: View {
    let epubs: [EPUBDocument?]

    var columns: [GridItem] = [
        GridItem(.fixed(300), spacing: 8),
        GridItem(.fixed(300), spacing: 8),
        GridItem(.fixed(300), spacing: 8),
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: columns,
                alignment: .center,
                pinnedViews: [.sectionHeaders, .sectionFooters]
            ) {
                GridViewBook(epub: epubs[0])
            }
        }
        .background(Color.pink)
    }
}

#if DEBUG
    struct GridView_Previews: PreviewProvider {
        static var previews: some View {
            GridView(epubs: [loadEpub("Genius - Genius_ The Game (Book 1) - Leopoldo Gout")])
        }
    }
#endif
