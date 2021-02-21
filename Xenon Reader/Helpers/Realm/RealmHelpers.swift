//
//  RealmHelpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import Foundation
import RealmSwift

func initializeRealm() -> Realm? {
    do {
        // TODO: Remove before full release
        let configuration = Realm.Configuration(deleteRealmIfMigrationNeeded: true)
        return try Realm(configuration: configuration)
    } catch {
        print("Error initalizing new Realm: \(error.localizedDescription)")
        return nil
    }
}
