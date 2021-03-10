//
//  FilesystemHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/25/21.
//

import EPUBKit
import Foundation
import Zip

// MARK: Directory List Functions

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

// MARK: Creation/Generation Functions

func absolutePath(libraryPath: String, filename: String) -> String {
    if libraryPath.last == "/" {
        return libraryPath + filename
    } else {
        return libraryPath + "/" + filename
    }
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

func generateFileUrl(libraryUrl: String, filename: String, fileExtension: String) -> URL? {
    return URL(fileURLWithPath: filename, relativeTo: URL(string: libraryUrl)).appendingPathExtension(fileExtension)
}

// MARK: Fetch Functions

func getDocumentsDirectory() -> URL? {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
}

func getAppDocumentsDirectory() -> URL {
    return getDocumentsDirectory()?.appendingPathComponent("Xenon Reader", isDirectory: true) ?? getDocumentsDirectory()!
}

func getEpubDirectory(epubFilename: String) -> URL? {
    return getAppDocumentsDirectory().appendingPathComponent(epubFilename.replacingOccurrences(of: ".epub", with: "").removingPercentEncoding!, isDirectory: true)
}

func getEpubPageUrl(epubFilename: String, path: String) -> URL {
    let epubDirectory = getEpubDirectory(epubFilename: epubFilename)
    let pathComponents = path.removingPercentEncoding!.components(separatedBy: ".")

    return URL(fileURLWithPath: pathComponents[0], relativeTo: epubDirectory).appendingPathExtension(pathComponents[1])
}

func getEpubPageDirectoryUrl(epubFilename: String, path: String) -> URL {
    let epubDirectory = getEpubDirectory(epubFilename: epubFilename)
    let pathComponents = path.removingPercentEncoding!.components(separatedBy: ".")
    var pathFileComponents = pathComponents[0].components(separatedBy: "/")

    pathFileComponents.removeLast()

    return URL(fileURLWithPath: pathFileComponents.joined(separator: "/"), isDirectory: true, relativeTo: epubDirectory)
}
