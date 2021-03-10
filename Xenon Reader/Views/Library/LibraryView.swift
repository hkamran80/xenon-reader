//
//  LibraryView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import EPUBKit
import SwiftUI

struct LibraryView: View {
    @AppStorage("libraryViewType") var viewType: LibraryViewTypes = .grid
    @EnvironmentObject var xrShared: XRShared

    let epubs: [EpubLoader]
    var body: some View {
        switch viewType {
            case .grid: GridView(epubs: epubs).environmentObject(self.xrShared)
            case .list: ListView(epubs: epubs).environmentObject(self.xrShared)
        }
    }
}

#if DEBUG
struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(epubs: [])
            .environmentObject(XRShared())
    }
}
#endif
