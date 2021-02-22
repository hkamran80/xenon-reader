//
//  ListView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import EPUBKit
import SwiftUI

struct ListView: View {
    let epubs: [EPUBDocument?]

    var body: some View {
        List {
            ForEach(epubs, id: \.self) { epub in
                ListViewBook(epub: epub)
            }
        }
    }
}

#if DEBUG
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(epubs: [EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!)])
    }
}
#endif
