//
//  ReaderSidebarView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

struct ReaderSidebarView: View {
    @EnvironmentObject var xrShared: XRShared
    @State private var sidebarView: ReaderSidebarViews = .tableOfContents

    var body: some View {
        VStack(alignment: .leading) {
            Picker("", selection: $sidebarView) {
                Label("Table of Contents", systemImage: "list.bullet")
                    .labelStyle(IconOnlyLabelStyle())
                    .tag(ReaderSidebarViews.tableOfContents)

                Label("Metadata", systemImage: "info.circle")
                    .labelStyle(IconOnlyLabelStyle())
                    .tag(ReaderSidebarViews.metadata)

                Label("Markup", systemImage: "pencil.and.outline")
                    .labelStyle(IconOnlyLabelStyle())
                    .tag(ReaderSidebarViews.markup)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal, 8)

            switch sidebarView {
                case .tableOfContents: ReaderSidebarTOC().environmentObject(xrShared)
                case .metadata: ReaderSidebarMetadata().environmentObject(xrShared)
                default: ReaderSidebarTOC().environmentObject(xrShared)
            }
        }
    }
}

#if DEBUG
struct ReaderSidebarView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderSidebarView()
            .environmentObject(XRShared())
    }
}
#endif
