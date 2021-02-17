//
//  ColorExtensions.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Foundation
import SwiftUI

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}
