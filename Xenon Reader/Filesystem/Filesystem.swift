//
//  Filesystem.swift
//  Xenon Reader
//
//  Created by H. Kamran on 2/16/21.
//

import Foundation

func loadLibraryItems(_ libraryPath: String) -> [String]? {
    print(libraryPath)
    
    if libraryPath != "" {
        let cleanPath = libraryPath.replacingOccurrences(of: "file://", with: "").removingPercentEncoding!
        let fm = FileManager.default
        
        print(cleanPath)
        
        do {
            let items = try fm.contentsOfDirectory(atPath: cleanPath)            
            return items
        } catch {
            print(error.localizedDescription)
            return nil
        }
    } else {
        print("Invalid library path")
        return nil
    }
}
