//
//  ViewHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import Cocoa
import EPUBKit
import Foundation

// MARK: Enums

enum LibraryViewTypes: String, CaseIterable, Identifiable {
    case grid
    case list

    var id: String { self.rawValue }
}

enum MainViewType: String, CaseIterable, Identifiable {
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

// MARK: Functions

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

func generateReadableCount(count: Int) -> String {
    return count == 1 ? "\(count) Readable" : "\(count) Readables"
}

func returnPrefix(string: String, prefixLength: Int) -> String {
    let prefixedString = String(string.prefix(prefixLength))
    return (prefixedString.count < string.count) ? prefixedString.appending("...") : prefixedString
}

func sortLibraryList(epubList: [EpubLoader], sortType: LibrarySortTypes) -> [EpubLoader] {
    var returnList: [EpubLoader]

    switch sortType {
        case .title: returnList = epubList.sorted { $0.epub?.title?.lowercased() ?? "no title" < $1.epub?.title?.lowercased() ?? "no title" }
        case .titleReversed: returnList = epubList.sorted { $1.epub?.title?.lowercased() ?? "no title" < $0.epub?.title?.lowercased() ?? "no title" }
        case .author: returnList = epubList.sorted { $0.epub?.author?.lowercased() ?? "no title" < $1.epub?.author?.lowercased() ?? "no title" }
        case .authorReversed: returnList = epubList.sorted { $1.epub?.author?.lowercased() ?? "no title" < $0.epub?.author?.lowercased() ?? "no title" }
        case .publisher: returnList = epubList.sorted { $0.epub?.publisher?.lowercased() ?? "no title" < $1.epub?.publisher?.lowercased() ?? "no title" }
        case .publisherReversed: returnList = epubList.sorted { $1.epub?.publisher?.lowercased() ?? "no title" < $0.epub?.publisher?.lowercased() ?? "no title" }
        default: returnList = epubList
    }

    print(returnList.map { $0.epub?.title })
    return returnList
}
