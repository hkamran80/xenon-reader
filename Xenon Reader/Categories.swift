//
//  Categories.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Foundation

struct Category: Identifiable, Hashable {
    let id = UUID()
    var name: String
    var sfSymbol: String
    var readables: [String]
}
