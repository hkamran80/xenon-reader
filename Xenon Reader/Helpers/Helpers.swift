//
//  Helpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import CryptoKit
import EPUBKit
import Foundation
//import RealmSwift

class XRShared: ObservableObject {
    @Published var epubs: [EpubLoader] = []
    @Published var authors: [Author] = []
    @Published var publishers: [Publisher] = []
    // TODO: Reset to empty array
    @Published var categories: [ReadableCategory] = [ReadableCategory(id: UUID().uuidString, name: "First Category", imageName: "tray.circle", creationDate: Date())]

    @Published var mainViewType: MainViewType = .library
    @Published var activeReadable: EpubLoader? = nil
    
    @Published var fileList: [String] = []
//    @Published var realmInstance: Realm? = initializeRealm()

    @Published var categoryCreationSheet: Bool = false
}

// TODO: Create extension to EPUBDocument which adds the hash as a parameter
func sha256Hash(_ inputData: Data) -> String {
    let hashedData = SHA256.hash(data: inputData)

    return hashedData.compactMap { String(format: "%02x", $0) }.joined()
}
