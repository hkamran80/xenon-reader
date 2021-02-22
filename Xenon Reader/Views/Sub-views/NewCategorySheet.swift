//
//  NewCategorySheet.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/22/21.
//

import SwiftUI

let sfSymbolsMini: [String] = [
    "book",
    "book.circle",
    "books.vertical",
    "book.closed",
    "text.book.closed",
    "bookmark",
    "bookmark.circle",
    "folder",
    "folder.circle",
    "tray",
    "tray.circle"
]

struct NewCategorySheet: View {
    @EnvironmentObject var xrShared: XRShared
    @Binding var isPresented: Bool

    @State var categoryName: String = ""
    @State var sfSymbol: String = "tray"

    var body: some View {
        Form {
            TextField("Category Name", text: $categoryName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding([.trailing, .bottom])

            Picker("Icon", selection: $sfSymbol) {
                ForEach(sfSymbolsMini, id: \.self) { symbol in
                    HStack {
                        Image(systemName: symbol)
                        Text(symbol)
                    }
                }
            }
            .padding([.horizontal, .bottom])

            Button(action: {
                self.xrShared.categories.append(ReadableCategory(id: UUID().uuidString, name: categoryName, imageName: sfSymbol, creationDate: Date()))
            }) {
                Text("Add Category")
            }
            .disabled(categoryName == "" && sfSymbol == "")
        }
        .padding(.vertical)
    }
}

#if DEBUG
struct NewCategorySheet_Previews: PreviewProvider {
    static var previews: some View {
        NewCategorySheet(isPresented: .constant(false))
    }
}
#endif
