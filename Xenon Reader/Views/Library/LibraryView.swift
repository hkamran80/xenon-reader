//
//  LibraryView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import EPUBKit
import SwiftUI

struct LibraryView: View {
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @EnvironmentObject var xrShared: XRShared

    let epubs: [EPUBDocument?]

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
        LibraryView(epubs: [EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/SpySchoolBritishInvasion_StuartGibbs.epub")!)])
    }
}
#endif
