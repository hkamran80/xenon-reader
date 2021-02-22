//
//  HTMLStringView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/21/21.
//

import Cocoa
import SwiftUI
import WebKit

struct HTMLStringView: NSViewRepresentable {
    let htmlContent: String

    func makeNSView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateNSView(_ nsView: WKWebView, context: Context) {
        nsView.loadHTMLString(htmlContent, baseURL: nil)
    }
}

struct WebKitView_Previews: PreviewProvider {
    static var previews: some View {
        HTMLStringView(htmlContent: "<strong>Bold <i>Italic!</i></strong>")
    }
}
