//
//  ViewHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/20/21.
//

import Foundation
import Cocoa

func toggleSidebar() {
    NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
}

enum ViewTypes: String, CaseIterable, Identifiable {
    case grid
    case list
    
    var id: String { self.rawValue }
}
