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
        let css = ":root { color-scheme: light dark; } body { padding: 16px; font: -apple-system-body !important; font-size: 24px; } a { color: yellow }"
        let styleInjectionScript = "let style = document.createElement('style'); style.innerHTML = '\(css)'; document.head.appendChild(style);"
        let userScript = WKUserScript(source: styleInjectionScript, injectionTime: .atDocumentEnd, forMainFrameOnly: false)
        
        let userContentController = WKUserContentController()
        userContentController.addUserScript(userScript)
        
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userContentController
        
        return WKWebView(frame: .zero, configuration: configuration)
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadFileURL(fileURL, allowingReadAccessTo: directoryURL)
    }
}
