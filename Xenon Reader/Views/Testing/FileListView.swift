//
//  FileListView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import EPUBKit
import RealmSwift
import SwiftUI

struct FileListView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @EnvironmentObject var xrShared: XRShared

    @State var epub: EPUBDocument?

    var body: some View {
        VStack {
            Button(action: {
                self.xrShared.fileList = retrieveDirectoryList(libraryPath: libraryPath, showHidden: false, fileExtension: "epub") ?? []
            }) {
                Text("Load Library Items")
            }

            List(self.xrShared.fileList, id: \.self) { file in
                Text(file)
            }

            Divider()

            Button(action: {
                if epub == nil {
                    for _epub in self.xrShared.epubs {
                        if _epub?.title == "Genius--The Con" {
                            epub = _epub
                        }
                    }
                }
                
                print(epub?.tableOfContents.subTable?[0] ?? "No subtable")
            }) {
                Text("Table of Contents")
            }
            Button(action: {
                if epub == nil {
                    for _epub in self.xrShared.epubs {
                        if _epub?.title == "Genius--The Con" {
                            epub = _epub
                        }
                    }
                }
                
                print(epub?.cover)
            }) {
                Text("Cover URL")
            }
        }
        .padding()
    }
}

#if DEBUG
struct FileListView_Previews: PreviewProvider {
    static var previews: some View {
        FileListView()
            .environmentObject(XRShared())
    }
}
#endif
