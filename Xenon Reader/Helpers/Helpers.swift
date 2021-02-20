//
//  Helpers.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/19/21.
//

import EPUBKit
import CryptoKit
import Foundation

class XRShared: ObservableObject {
    @Published var epubs: [EPUBDocument?] = [loadEpub("Genius - Genius_ The Game (Book 1) - Leopoldo Gout")]
    @Published var fileList: [String] = []
}

func readableCount(count: Int) -> String {
    return count == 1 ? "\(count) Readable" : "\(count) Readables"
}

func sha256Hash(_ inputData: Data) -> String {
    let hashedData = SHA256.hash(data: inputData)

    return hashedData.compactMap { String(format: "%02x", $0) }.joined()
}
