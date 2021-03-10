//
//  LibrarySettingsView.swift
//  Xenon Reader
//
//  Created by H. Kamran on 3/9/21.
//

import SwiftUI

struct LibrarySettingsView: View {
    @AppStorage("libraryPath") var libraryPath = ""
    @AppStorage("libraryUrl") var libraryUrl = ""
    @AppStorage("libraryViewType") var viewType: ViewTypes = .grid
    @AppStorage("librarySortType") var librarySort: LibrarySortTypes = .title

    var body: some View {
        Form {
            Section(header: Text("Library Folder")) {
                HStack {
                    Text(libraryPath)

                    Button("Select Folder") {
                        let panel = NSOpenPanel()

                        panel.allowsMultipleSelection = false
                        panel.canChooseDirectories = true
                        panel.canChooseFiles = false

                        panel.title = "Xenon Reader Library Path"
                        panel.message = "Where your EPUBs are stored"
                        panel.prompt = "Select"

                        if panel.runModal() == .OK {
                            let libraryPath = panel.url?.absoluteString ?? FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].absoluteString

                            self.libraryPath = libraryPath.replacingOccurrences(of: "file://", with: "").removingPercentEncoding ?? "<none>"
                            self.libraryUrl = libraryPath
                        }
                    }
                }
            }

            Section(header: Text("Library View Type")) {
                Picker("Library View", selection: $viewType) {
                    Label("Grid", systemImage: "square.grid.3x2")
                        .tag(ViewTypes.grid)
                    Label("List", systemImage: "tablecells")
                        .tag(ViewTypes.list)
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section {
                Picker("Library Sort", selection: $librarySort) {
                    Label("Title", systemImage: "textformat")
                        .tag(LibrarySortTypes.title)
                    Label("Title (Reversed)", systemImage: "textformat")
                        .tag(LibrarySortTypes.titleReversed)

                    Label("Author", systemImage: "person.3")
                        .tag(LibrarySortTypes.author)
                    Label("Author (Reversed)", systemImage: "person.3")
                        .tag(LibrarySortTypes.authorReversed)

                    Label("Publisher", systemImage: "rectangle.stack.person.crop")
                        .tag(LibrarySortTypes.publisher)
                    Label("Publisher (Reversed)", systemImage: "rectangle.stack.person.crop")
                        .tag(LibrarySortTypes.publisherReversed)

                    Label("Date Added", systemImage: "calendar.badge.plus")
                        .tag(LibrarySortTypes.dateAdded)
                    Label("Last Viewed", systemImage: "eyeglasses")
                        .tag(LibrarySortTypes.lastViewed)
                }
            }
        }
        .padding(20)
    }
}

#if DEBUG
struct LibrarySettingsView_Previews: PreviewProvider {
    static var previews: some View {
        LibrarySettingsView()
    }
}
#endif
