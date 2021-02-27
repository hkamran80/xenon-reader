//
//  LibraryHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/25/21.
//

import EPUBKit
import Foundation
import SwiftUI

// MARK: Wrapper Struct

struct LibraryLoader {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    let xrShared: XRShared

    func scanFiles() {
        self.xrShared.fileList = retrieveDirectoryList(libraryPath: self.libraryPath, showHidden: false, fileExtension: "epub") ?? []
        self.xrShared.epubs = loadLibraryItems(libraryUrl: self.libraryUrl, directoryList: self.xrShared.fileList)
        self.xrShared.authors = loadAuthors(readableList: self.xrShared.epubs)
        self.xrShared.publishers = loadPublishers(readableList: self.xrShared.epubs)
    }
}

// MARK: Functions

// TODO: Make function asynchronous
func loadLibraryItems(libraryUrl: String, directoryList: [String]) -> [EPUBDocument?] {
    var epubs: [EPUBDocument?] = []

    for filename in directoryList {
        let fileUrl = generateFileUrl(libraryUrl: libraryUrl, filename: filename.replacingOccurrences(of: ".epub", with: ""), fileExtension: "epub")!
        let epub = EpubLoader(withUrl: fileUrl).epub

        epubs.append(epub)
    }

    return epubs
}
