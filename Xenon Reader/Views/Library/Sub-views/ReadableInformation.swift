//
//  ReadableInformation.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/21/21.
//

import EPUBKit
import SwiftUI

struct ReadableInformation: View {
    @Binding var isPresented: Bool
    
    let epub: EPUBDocument?
    
    var body: some View {
        HStack(spacing: 20) {
            Image(nsImage: loadImage(epub?.cover) ?? NSImage())
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 250)
            
            VStack(alignment: .leading, spacing: 5) {
                HStack(alignment: .center) {
                    VStack(alignment: .leading) {
                        Text(epub?.title ?? "Unknown Title")
                            .font(.headline)
                            .bold()
                
                        Text(epub?.author ?? "Unknown Author")
                            .font(.subheadline)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            isPresented = false
                        }
                    }) {
                        Image(systemName: "xmark.circle")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 20, height: 20)
                    }
                    .buttonStyle(PlainButtonStyle())
                    .keyboardShortcut(.cancelAction)
                }
                
                Divider()
                
                List {
                    if let publisher = epub?.publisher {
                        HStack {
                            Text("Publisher:")
                                .bold()
                    
                            Text(publisher)
                        }
                    }
                
                    if let description = epub?.metadata.description {
                        VStack(alignment: .leading) {
                            Text("Description")
                                .bold()
                    
                            // TODO: Figure out a way of rendering HTML natively with SwiftUI
                            Text(description)
                        }
                    }
                    
                    // TODO: Remove after reader rendering works
                    if let toc = epub?.tableOfContents {
                        Divider()
                        
                        if let subTable = toc.subTable {
                            // Text("\"\(subTable[0].label)\" -- \(subTable[0].item ?? "No Document")")
                            ForEach(subTable, id: \.id) { item in
                                
                                Text("\"\(item.label)\" -- \(item.item ?? "No Document")")
                            }
                        } else {
                            Text("No subtable")
                        }
                    } else {
                        Text("No TOC")
                    }
                }
            }
        }
        .padding(.all)
        .frame(minWidth: 750, maxWidth: 850, minHeight: 325, maxHeight: 400)
    }
}

#if DEBUG
struct ReadableInformation_Previews: PreviewProvider {
    static var previews: some View {
        ReadableInformation(isPresented: .constant(true), epub: EPUBDocument(url: URL(string: "file:///Users/hkamran/Desktop/Desktop/Books/Xenon%20Library/SpySchoolBritishInvasion_StuartGibbs.epub")!))
    }
}
#endif
