//
//  EPUBHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Cocoa
import EPUBKit
import Foundation

// MARK: Wrapper Struct

struct EpubLoader: Hashable {
    let id: String
    let epub: EPUBDocument?
    var spineItemIndex: Int = 0

    init(withUrl fileUrl: URL) {
        // TODO: Figure out a way of handling readables with duplicate titles
        id = fileUrl.lastPathComponent.replacingOccurrences(of: ".epub", with: "").removingPercentEncoding!
        epub = EPUBDocument(url: fileUrl, extractionDirectory: getAppDocumentsDirectory().appendingPathComponent(id))
    }
}

// MARK: Functions

func loadImage(_ imagePath: URL?) -> NSImage? {
    if let imagePathUrl = imagePath {
        do {
            let imageData = try Data(contentsOf: imagePathUrl)
            return NSImage(data: imageData)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    } else {
        return NSImage(named: "DefaultCover")
    }
}

func getEpubPage(epubFilename: String, path: String) -> Data? {
    let pathUrl = getEpubPageUrl(epubFilename: epubFilename, path: path)

    do {
        return try Data(contentsOf: pathUrl)
    } catch {
        print("[P] epubFilename: \(epubFilename)")
        print("[P] path: \(path)")
        print("[ERROR] \(error.localizedDescription)")

        return nil
    }
}
