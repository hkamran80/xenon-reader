//
//  ReaderSettingsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/9/21.
//

import SwiftUI

struct ReaderSettingsView: View {
    @AppStorage("fontSize") var fontSize = 12.0

    var body: some View {
        Slider(value: $fontSize, in: 8 ... 64) {
            Text("Font Size (\(fontSize, specifier: "%.0f") pts)")
        }
    }
}

#if DEBUG
struct ReaderSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderSettingsView()
    }
}
#endif
