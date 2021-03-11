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

    var body: some View {
        Group {
            if
                let fileUrl = getEpubPageUrl(epubFilename: activeReadable!.id, path: filename ?? ""),
                let directoryUrl = getEpubPageDirectoryUrl(epubId: activeReadable!.id, storageLocation: .applicationSupport)
            {
                FileWebView(fileURL: fileUrl, directoryURL: directoryUrl)
            } else {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
            }
        }
    }
}

#if DEBUG
struct ReaderRenderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderRenderView(activeReadable: EpubLoader(withUrl: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/You%20Are%20Enough.epub")!), filename: "")
    }
}
#endif
