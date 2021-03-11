//
//  ReaderRenderView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import EPUBKit
import SwiftUI

// TODO: Create render view
struct ReaderRenderView: View {
    let activeReadable: EpubLoader?
    let filename: String?

    @State private var htmlFileUrl: URL? = nil
    @State private var htmlDirectoryUrl: URL? = nil

    var body: some View {
        Group {
            if let fileUrl = htmlFileUrl, let directoryUrl = htmlDirectoryUrl {
                FileWebView(fileURL: fileUrl, directoryURL: directoryUrl)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
        .onAppear(perform: {
            if let activeId = activeReadable?.id {
                htmlFileUrl = getEpubPageUrl(epubFilename: activeId, path: filename ?? "")
                htmlDirectoryUrl = getEpubPageDirectoryUrl(epubId: activeId, storageLocation: .applicationSupport)
            }
        })
    }
}

#if DEBUG
struct ReaderRenderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderRenderView(activeReadable: EpubLoader(withUrl: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!), filename: "")
    }
}
#endif
