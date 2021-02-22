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

    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, alignment: .leading, spacing: 20) {
                ForEach(epubs, id: \.self) { epub in
                    GridViewBook(epub: epub)
                }
            }
            .padding(.horizontal)
        }
    }
}

#if DEBUG
    struct GridView_Previews: PreviewProvider {
        static var previews: some View {
            GridView(epubs: [EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!)])
        }
    }
#endif
