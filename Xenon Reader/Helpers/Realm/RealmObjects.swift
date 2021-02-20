//
//  RealmObjects.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/17/21.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var id: String = UUID().uuidString
    @objc dynamic var name: String = ""
    @objc dynamic var sfSymbol: String = "tray.circle"
    @objc dynamic var creationDate: Date = Date()
    var readables: [String] = []

    override static func primaryKey() -> String? {
        "id"
    }
}
