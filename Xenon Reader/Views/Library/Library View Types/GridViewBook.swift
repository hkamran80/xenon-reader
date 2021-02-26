//
//  GridViewBook.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import SwiftUI

struct GridViewBook: View {
    let epub: EPUBDocument?
    @State private var informationSheet: Bool = false

    var body: some View {
        VStack(alignment: .center) {
            Image(nsImage: loadImage(epub?.cover) ?? NSImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 250)

            Text(epub?.title ?? "Unknown Title")
                .font(.headline)
                .bold()
                .multilineTextAlignment(.center)

            Text(epub?.author ?? "Unknown Author")
                .font(.subheadline)
                .multilineTextAlignment(.center)
        }
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
    struct GridViewBook_Previews: PreviewProvider {
        static var previews: some View {
            GridViewBook(epub: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!))
        }
    }
#endif
