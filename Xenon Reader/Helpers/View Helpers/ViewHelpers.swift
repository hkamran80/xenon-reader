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

enum ReaderSidebarViews: String, CaseIterable, Identifiable {
    case tableOfContents
    case metadata
    case markup

    var id: String { self.rawValue }
}

// MARK: Functions

// MARK: Generation Functions

func generateReadableCount(count: Int) -> String {
    return count == 1 ? "\(count) Readable" : "\(count) Readables"
}

func generateSubtitle(xrShared: XRShared) -> String {
    var subtitle: String = ""

    switch xrShared.mainViewType {
        case .library: subtitle = generateReadableCount(count: xrShared.epubs.count)
        case .reader:
            if let activeReadable = xrShared.activeReadable, let activeChapter = getActiveChapterTitle(activeReadable: activeReadable) {
                subtitle = activeChapter
            }
    }

    return subtitle
}

// MARK: Generic Functions

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
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

    return returnList
}

// MARK: Generation Helpers

func getActiveChapterTitle(activeReadable: EpubLoader) -> String? {
    let spineItems = activeReadable.epub?.spine.items
    let manifestItems = activeReadable.epub?.manifest.items.map { $0.1 }
    let tocItems = activeReadable.epub?.tableOfContents.subTable

    if let tocItem = tocItems?.first(where: { $0.item == manifestItems?.first(where: { $0.id == spineItems?[activeReadable.spineItemIndex].idref })?.path.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) }) {
        return tocItem.label
    } else {
        return nil
    }
}
