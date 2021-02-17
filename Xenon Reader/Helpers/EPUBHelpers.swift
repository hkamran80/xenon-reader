//
//  EPUBHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Cocoa
import EPUBKit
import Foundation

func loadEpub(_ filename: String) -> EPUBDocument? {
    guard
        let path = Bundle.main.url(forResource: filename, withExtension: "epub"),
        let document = EPUBDocument(url: path)
    else { return nil }

    return document
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
