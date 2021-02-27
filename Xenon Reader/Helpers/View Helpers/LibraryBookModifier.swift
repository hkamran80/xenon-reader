//
//  LibraryBookModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/25/21.
//

import EPUBKit
import SwiftUI

struct LibraryBookModifier: ViewModifier {
    @State private var informationSheet: Bool = false
    let epub: EPUBDocument?

    func body(content: Content) -> some View {
        content
            .contextMenu {
                Button(action: {}) {
                    Label("Read \"\(returnPrefix(string: epub?.title ?? "Unknown Title", prefixLength: 16))\"", systemImage: "book")
                }

                Button(action: {
                    informationSheet = true
                }) {
                    Label("Information", systemImage: "info.circle")
                }

                Divider()

                Button(action: {}) {
                    Label("Add to Category", systemImage: "tray")
                }
            }
            .sheet(isPresented: $informationSheet) {
                ReadableInformation(isPresented: $informationSheet, epub: epub)
            }
    }
}
