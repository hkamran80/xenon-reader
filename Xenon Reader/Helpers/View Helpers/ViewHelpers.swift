//
//  ViewHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import Cocoa
import EPUBKit
import Foundation

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

enum ViewTypes: String, CaseIterable, Identifiable {
    case grid
    case list

    var id: String { self.rawValue }
}

func generateReadableCount(count: Int) -> String {
    return count == 1 ? "\(count) Readable" : "\(count) Readables"
}
