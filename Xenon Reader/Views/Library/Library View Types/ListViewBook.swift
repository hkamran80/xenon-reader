//
//  ListViewBook.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import EPUBKit
import SwiftUI

struct ListViewBook: View {
    let epub: EPUBDocument?

    var body: some View {
        VStack(alignment: .leading) {
            Text(epub?.title ?? "Unknown Title")
                .font(.headline)
                .bold()

            Text(epub?.author ?? "Unknown Author")
                .font(.subheadline)
        }
        .modifier(LibraryBookModifier(epub: epub))
    }
}

#if DEBUG
struct ListViewBook_Previews: PreviewProvider {
    static var previews: some View {
        ListViewBook(epub: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!))
    }
}
#endif
