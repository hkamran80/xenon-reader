//
//  PublishersView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import SwiftUI

struct PublishersView: View {
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        NavigationView {
            List(self.xrShared.publishers.sorted { $0.name.lowercased() < $1.name.lowercased() }, id: \.id) { publisher in
                NavigationLink(destination: LibraryView(epubs: publisher.readables)) {
                    Text(publisher.name)
                }
            }
        }
    }
}

struct PublishersView_Previews: PreviewProvider {
    static var previews: some View {
        PublishersView()
    }
}
