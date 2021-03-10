//
//  ReadableHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/25/21.
//

import EPUBKit
import Foundation

// MARK: Structs

struct Author: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var readables: [EpubLoader] = []
}

struct Publisher: Identifiable, Hashable {
    let id = UUID()
    let name: String
    var readables: [EpubLoader] = []
}

// MARK: Loading Functions

func loadAuthors(readableList: [EpubLoader]) -> [Author] {
    var authors: [Author] = []

    for readable in readableList {
        if let readableAuthor = readable.epub?.author {
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

func loadPublishers(readableList: [EpubLoader]) -> [Publisher] {
    var publishers: [Publisher] = []

    for readable in readableList {
        if let readablePublisher = readable.epub?.publisher {
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
