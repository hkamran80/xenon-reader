//
//  Filesystem.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import EPUBKit
import Foundation

// TODO: Be able to search recursively
func retrieveDirectoryList(libraryPath: String, showHidden: Bool = false, fileExtension: String = "") -> [String]? {
    if libraryPath != "" {
        let fm = FileManager.default

        do {
            let items = try fm.contentsOfDirectory(atPath: libraryPath)
            let filteredItems = showHidden ? items : items.filter { !$0.hasPrefix(".") }
            
            return fileExtension != "" ? filteredItems.filter { $0.hasSuffix(fileExtension) } : filteredItems
        } catch {
            print(error.localizedDescription)
            return nil
        }
    } else {
        print("Invalid library path")
        return nil
    }
}

func absolutePath(_ libraryPath: String, filename: String) -> String {
    if libraryPath.last == "/" {
        return libraryPath + filename
    } else {
        return libraryPath + "/" + filename
    }
}

func generateFileUrl(libraryUrl: String, filename: String, fileExtension: String) -> URL? {
    return URL(fileURLWithPath: filename, relativeTo: URL(string: libraryUrl)).appendingPathExtension(fileExtension)
}
