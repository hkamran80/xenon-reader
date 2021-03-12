//
//  TOCFocusModifier.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/12/21.
//

import SwiftUI

struct TOCFocusModifier: ViewModifier {
    let buttonText: String
    let activeChapter: String?

    func body(content: Content) -> some View {
        Group {
            if activeChapter != nil && activeChapter == buttonText {
                content
                    .background(Color.accentColor)
            } else {
                content
            }
        }
    }
}
