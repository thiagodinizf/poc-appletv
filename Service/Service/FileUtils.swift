//
//  FileUtils.swift
//  Service
//
//  Created by Thiago Diniz on 23/05/18.
//  Copyright © 2018 Thiago Diniz. All rights reserved.
//

import Foundation

class FileUtils {
    
    static func dataFromJsonFile(named name: String) -> Data {
        if let file = Bundle(for: FileUtils.self).url(forResource: name, withExtension: "json") {
            let json = try! String(contentsOf: file, encoding: .utf8)
            return json.data(using: .utf8)!
        } else {
            return "".data(using: .utf8)!
        }
    }
    
    static func json(name: String) -> Any {
        if let file = Bundle(for: FileUtils.self).path(forResource: name, ofType: "json") {
            do {
                let json = try String(contentsOfFile: file)
                
                let data: Data = json.data(using: .utf8)!
                return try! JSONSerialization.jsonObject(with: data, options: .allowFragments)
            } catch {
                return NSError(domain: "Failed to read text from \(file)", code: 1, userInfo: nil)
            }
        }
        return NSError(domain: "Failed to load file from app bundle", code: 2, userInfo: nil)
    }
}
