//
//  LibraryParentView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import SwiftUI

struct LibraryParentView: View {
    @EnvironmentObject var xrShared: XRShared
    
    var body: some View {
        SidebarView()
            .environmentObject(self.xrShared)

        LibraryView(epubs: self.xrShared.epubs)
            .environmentObject(self.xrShared)
    }
}

#if DEBUG
struct LibraryParentView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryParentView()
            .environmentObject(XRShared())
    }
}
#endif
