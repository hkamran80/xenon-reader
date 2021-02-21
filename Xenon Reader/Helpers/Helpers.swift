//
//  Helpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import CryptoKit
import EPUBKit
import Foundation
import RealmSwift
import SwiftUI

class XRShared: ObservableObject {
    @Published var epubs: [EPUBDocument?] = []
    @Published var fileList: [String] = []
    @Published var realmInstance: Realm? = initializeRealm()
}

func readableCount(count: Int) -> String {
    return count == 1 ? "\(count) Readable" : "\(count) Readables"
}

func sha256Hash(_ inputData: Data) -> String {
    let hashedData = SHA256.hash(data: inputData)

    return hashedData.compactMap { String(format: "%02x", $0) }.joined()
}

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

struct LibraryLoader {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @EnvironmentObject var xrShared: XRShared
    
    func scanFiles() {
        self.xrShared.fileList = retrieveDirectoryList(libraryPath: libraryPath, showHidden: false, fileExtension: "epub") ?? []
        self.xrShared.epubs = loadLibraryItems(libraryUrl: libraryUrl, directoryList: self.xrShared.fileList)
    }
}
