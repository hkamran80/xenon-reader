//
//  EPUBHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Cocoa
import EPUBKit
import Foundation

struct EpubLoader {
    let epub: EPUBDocument?
    let id: String

    init(withUrl fileUrl: URL) {
        // TODO: Make sure the unzipping doesn't create an infinite amount of folders by regenerating them at application startup
        id = fileUrl.lastPathComponent.replacingOccurrences(of: ".epub", with: "").removingPercentEncoding!
        epub = EPUBDocument(url: fileUrl, extractionDirectory: getAppDocumentsDirectory().appendingPathComponent(id))
    }
}

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

func getEpubPage(epubFilename: String, path: String) -> String? {
    return nil
}
