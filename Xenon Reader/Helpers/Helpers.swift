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
    @Published var authors: [Author] = []
    @Published var publishers: [Publisher] = []
    @Published var categories: [ReadableCategory] = []
    
    @Published var mainViewType: ViewType = .library
    @Published var activeReadable: EPUBDocument? = nil
    
    @Published var fileList: [String] = []
    @Published var realmInstance: Realm? = initializeRealm()
    
    @Published var categoryCreationSheet: Bool = false
}

enum ViewType: String, CaseIterable, Identifiable {
    case library
    case reader
    
    var id: String { self.rawValue }
}

enum LibrarySortTypes: String, CaseIterable, Identifiable {    
    case title
    case titleReversed
    case author
    case authorReversed
    case dateAdded
    case lastViewed
    case publisher
    case publisherReversed
    
    var id: String { self.rawValue }
}

// TODO: Create extension to EPUBDocument which adds the hash as a parameter
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
    let xrShared: XRShared

    func scanFiles() {
        self.xrShared.fileList = retrieveDirectoryList(libraryPath: self.libraryPath, showHidden: false, fileExtension: "epub") ?? []
        self.xrShared.epubs = loadLibraryItems(libraryUrl: self.libraryUrl, directoryList: self.xrShared.fileList)
        self.xrShared.authors = loadAuthors(readableList: self.xrShared.epubs)
        self.xrShared.publishers = loadPublishers(readableList: self.xrShared.epubs)
        
        // TODO: Remove manual active readable setting
        //self.xrShared.activeReadable = self.xrShared.epubs[1]
    }
}

struct Author: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var readables: [EPUBDocument?] = []
}

struct Publisher: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var readables: [EPUBDocument?] = []
}

func loadAuthors(readableList: [EPUBDocument?]) -> [Author] {
    var authors: [Author] = []

    for readable in readableList {
        if let readableAuthor = readable?.author {
            var authorStruct: Author?

            for author in authors {
                if author.name == readableAuthor {
                    authorStruct = author
                }
            }

            if authorStruct == nil {
                authors.append(Author(name: readableAuthor, readables: [readable]))
            } else {
                let index = authors.firstIndex(of: authorStruct!) ?? -1
                authorStruct?.readables.append(readable)
                authors[index] = authorStruct!
            }
        }
    }

    return authors
}

func loadPublishers(readableList: [EPUBDocument?]) -> [Publisher] {
    var publishers: [Publisher] = []

    for readable in readableList {
        if let readablePublisher = readable?.publisher {
            var publisherStruct: Publisher?

            for publisher in publishers {
                if publisher.name == readablePublisher {
                    publisherStruct = publisher
                }
            }

            if publisherStruct == nil {
                publishers.append(Publisher(name: readablePublisher, readables: [readable]))
            } else {
                let index = publishers.firstIndex(of: publisherStruct!) ?? -1
                publisherStruct?.readables.append(readable)
                publishers[index] = publisherStruct!
            }
        }
    }

    return publishers
}
