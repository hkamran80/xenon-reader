//
//  FilesystemHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/25/21.
//

import EPUBKit
import Foundation
import Zip

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

func getDocumentsDirectory() -> URL? {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

func createAppDocumentsDirectory() {
    let documentsDirectory: URL = getDocumentsDirectory()!
    let appDirectory: URL = documentsDirectory.appendingPathComponent("Xenon Reader", isDirectory: true)
    
    let fm = FileManager.default
    
    do {
        try fm.createDirectory(atPath: appDirectory.path, withIntermediateDirectories: true, attributes: nil)
    } catch {
        print("An error occurred when creating the application directory: \(error.localizedDescription)")
    }
}

func getAppDocumentsDirectory() -> URL {
    return getDocumentsDirectory()?.appendingPathComponent("Xenon Reader", isDirectory: true) ?? getDocumentsDirectory()!
}

func generateFileUrl(libraryUrl: String, filename: String, fileExtension: String) -> URL? {
    return URL(fileURLWithPath: filename, relativeTo: URL(string: libraryUrl)).appendingPathExtension(fileExtension)
}

func getEpubDirectory(epubFilename: String) -> URL? {
    return nil
}
