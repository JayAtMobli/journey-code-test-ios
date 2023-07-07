//
//  Utils.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

class Utils {
    static func loadJsonFile(name: String) throws -> Data? {
        guard let path = Bundle.main.path(forResource: name, ofType: "json")
        else { return nil }

        return try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
    }
}
