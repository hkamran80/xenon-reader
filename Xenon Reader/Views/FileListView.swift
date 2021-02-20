//
//  FileListView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import RealmSwift
import SwiftUI

struct FileListView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @EnvironmentObject var xrShared: XRShared
    
    @State var realmInstance: Realm?

    var body: some View {
        VStack {
            Button(action: {
                realmInstance = initalizeRealm()
            }) {
                Text("Initalize Realm")
            }

            if realmInstance != nil {
                Text("\(Realm.Configuration.defaultConfiguration.fileURL?.absoluteString ?? "<none>")")
            }

            Divider()

            Button(action: {
                self.xrShared.fileList = retrieveLibraryItemsList(libraryPath) ?? []
            }) {
                Text("Load Library Items")
            }

            List(self.xrShared.fileList, id: \.self) { file in
                Text(file)
            }
            .listStyle(InsetListStyle())
        }
        .padding()
    }
}

#if DEBUG
struct FileListView_Previews: PreviewProvider {
    static var previews: some View {
        FileListView()
            .environmentObject(XRShared())
    }
}
#endif
