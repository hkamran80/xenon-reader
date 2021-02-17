//
//  EPUBDocumentExtensions.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Foundation
import EPUBKit

extension EPUBDocument: Hashable, Equatable {
    public static func == (lhs: EPUBDocument, rhs: EPUBDocument) -> Bool {
        return lhs.title == rhs.title && lhs.author == rhs.author && lhs.publisher == rhs.publisher
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(title)
    }
}
