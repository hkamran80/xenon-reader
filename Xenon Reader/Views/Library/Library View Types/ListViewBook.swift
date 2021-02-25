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
    @State private var informationSheet: Bool = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(epub?.title ?? "Unknown Title")
                .font(.headline)
                .bold()

            Text(epub?.author ?? "Unknown Author")
                .font(.subheadline)
        }
//        .padding()
        .contextMenu {
            Button(action: {
                informationSheet = true
            }) {
                Label("Information", image: "info.circle")
            }

            Divider()

            Button(action: {}) {
                Label("Add to Category", image: "tray")
            }
        }
        .sheet(isPresented: $informationSheet) {
            ReadableInformation(isPresented: $informationSheet, epub: epub)
        }
    }
}

#if DEBUG
struct ListViewBook_Previews: PreviewProvider {
    static var previews: some View {
        ListViewBook(epub: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!))
    }
}
#endif
