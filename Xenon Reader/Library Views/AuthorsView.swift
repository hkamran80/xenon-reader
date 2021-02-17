//
//  AuthorsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import SwiftUI

struct AuthorsView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @State var lli = []
    
    var body: some View {
        Button(action: {
            lli = loadLibraryItems(libraryPath) ?? []
        }, label: {
            Text("Load Library Items")
        })
    }
}

struct AuthorsView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorsView()
    }
}
