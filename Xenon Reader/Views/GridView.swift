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
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
        GridItem(.fixed(100), spacing: 16),
    ]

    var body: some View {
        HStack {
            GridViewBook(epub: epubs[0])
            Spacer()
            if epubs.count > 1 {
                GridViewBook(epub: epubs[0])
                Spacer()
            }
            if epubs.count > 2 {
                GridViewBook(epub: epubs[0])
            }
        }
        .padding([.leading, .trailing])
    }
}

#if DEBUG
    struct GridView_Previews: PreviewProvider {
        static var previews: some View {
            GridView(epubs: [loadEpub("Genius - Genius_ The Game (Book 1) - Leopoldo Gout")])
        }
    }
#endif
