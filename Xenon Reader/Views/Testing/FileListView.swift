//
//  FileListView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import EPUBKit
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
