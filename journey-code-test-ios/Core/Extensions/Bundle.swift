//
//  Bundle.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

extension Bundle {
    // MARK: - This is where the app access custom field values in XCConfig files
    var apiBaseUrl: String? {
        Bundle.main.infoDictionary?["ApiBaseUrl"] as? String
    }
}
