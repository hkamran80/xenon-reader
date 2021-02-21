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

func loadImage(_ imagePath: URL) -> NSImage? {
    do {
        let imageData = try Data(contentsOf: imagePath)
        return NSImage(data: imageData)
    } catch {
        print(error.localizedDescription)
        return nil
    }
}
