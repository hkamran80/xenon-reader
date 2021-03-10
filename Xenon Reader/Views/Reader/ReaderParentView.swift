//
//  ReaderParentView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

struct ReaderParentView: View {
    @EnvironmentObject var xrShared: XRShared

    var body: some View {
        if xrShared.activeReadable != nil {
            ReaderSidebarView()
                .environmentObject(self.xrShared)

            // TODO: Figure out how to use `xrShared.activeReadable?.spineItemIndex` for pagination
            ReaderRenderView(activeReadable: xrShared.activeReadable, filename: xrShared.activeReadable?.epub?.manifest.items[(xrShared.activeReadable?.epub?.spine.items[xrShared.activeReadable?.spineItemIndex ?? 0].idref)!]?.path)
        } else {
            EmptyView()

            Text("No Active Readable")
        }
    }
}

#if DEBUG
struct ReaderParentView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderParentView()
            .environmentObject(XRShared())
    }
}
#endif
