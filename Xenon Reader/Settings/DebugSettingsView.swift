//
//  DebugSettingsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct DebugSettingsView: View {
    @AppStorage("fontSize") private var fontSize = 12.0
    @AppStorage("libraryPath") var libraryPath = ""

    var body: some View {
        Form {
            HStack {
                Text(libraryPath)

                Button("Select Folder") {
                    let panel = NSOpenPanel()
                    panel.allowsMultipleSelection = false
                    panel.canChooseDirectories = true
                    panel.canChooseFiles = false

                    if panel.runModal() == .OK {
                        self.libraryPath = panel.url?.absoluteString ?? "<none>"
                    }
                }

                Button(action: {
                    libraryPath = ""
                }) {
                    Image(systemName: "arrow.clockwise.circle")
                }
            }
        }
    }
}

#if DEBUG
    struct DebugSettingsView_Previews: PreviewProvider {
        static var previews: some View {
            DebugSettingsView()
        }
    }
#endif
