//
//  AuthorsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct AuthorsView: View {
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        NavigationView {
            List(self.xrShared.authors.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.id) { author in
                NavigationLink(destination: LibraryView(epubs: author.readables)) {
                    Text(author.name)
                }
            }
        }
    }
}

#if DEBUG
struct AuthorsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView()
    }
}
#endif
