//
//  FileWebView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/26/21.
//

import Cocoa
import SwiftUI
import WebKit

struct FileWebView: NSViewRepresentable {
    let fileURL: URL
    let directoryURL: URL

    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        print("[FFV] \(fileURL)")
        print("[FFV] \(directoryURL)")
        
        nsView.loadFileURL(fileURL, allowingReadAccessTo: directoryURL)
    }
}
