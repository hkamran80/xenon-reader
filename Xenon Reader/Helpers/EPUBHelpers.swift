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

    init(withUrl fileUrl: URL) {
        epub = EPUBDocument(url: fileUrl)
    }

    init(fromBundle bundleFilename: String) {
        if let path = Bundle.main.url(forResource: bundleFilename.contains(".epub") ? bundleFilename.replacingOccurrences(of: ".epub", with: "") : bundleFilename, withExtension: "epub"), let document = EPUBDocument(url: path)
        {
            epub = document
        } else {
            epub = nil
        }
    }
}

// TODO: Create default/placeholder cover
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
        return nil
    }
}
