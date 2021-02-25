//
//  ReaderRenderView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/24/21.
//

import SwiftUI

// TODO: Create render view
struct ReaderRenderView: View {
    @AppStorage("libraryUrl") var libraryUrl = ""
    let filename: String?
    
    // TODO: Add button for calling unZipEpub()
    var body: some View {
        Text(filename ?? "Unknown filename")
    }
}

#if DEBUG
struct ReaderRenderView_Previews: PreviewProvider {
    static var previews: some View {
        ReaderRenderView(filename: "")
    }
}
#endif
