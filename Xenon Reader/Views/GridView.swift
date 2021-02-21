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

//    var columns: [GridItem] = [
//        GridItem(.fixed(100), spacing: 16),
//        GridItem(.fixed(100), spacing: 16),
//        GridItem(.fixed(100), spacing: 16),
//    ]

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
            GridView(epubs: [EpubLoader(fromBundle: "Genius").epub])
        }
    }
#endif
