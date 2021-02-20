//
//  Filesystem.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Foundation

func retrieveLibraryItemsList(_ libraryPath: String, showHidden: Bool = false) -> [String]? {
    if libraryPath != "" {
        let fm = FileManager.default

        do {
            let items = try fm.contentsOfDirectory(atPath: libraryPath)
            return showHidden ? items : items.filter { !$0.hasPrefix(".") }
        } catch {
            print(error.localizedDescription)
            return nil
        }
    } else {
        print("Invalid library path")
        return nil
    }
}

// TODO: Figure out how to add to ObservableObject from external function
// I don't want to import SwiftUI into this file
func loadLibraryFileList(items: [String]) {}

func absolutePath(_ libraryPath: String, filename: String) -> String {
    if libraryPath.last == "/" {
        return libraryPath + filename
    } else {
        return libraryPath + "/" + filename
    }
}
