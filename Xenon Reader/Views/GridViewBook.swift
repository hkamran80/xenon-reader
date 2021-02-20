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

    var body: some View {
        VStack(alignment: .center) {
            Image(nsImage: loadImage((epub?.cover)!) ?? NSImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 250)

            Text(epub?.title ?? "Unknown Title")
                .font(.headline)
                .bold()

            Text(epub?.author ?? "Unknown Author")
                .font(.subheadline)
        }
    }
}

#if DEBUG
    struct GridViewBook_Previews: PreviewProvider {
        static var previews: some View {
            GridViewBook(epub: loadEpub("Genius - Genius_ The Game (Book 1) - Leopoldo Gout"))
        }
    }
#endif
