//
//  Localization.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

struct LocalizationData: Codable {
    var lastUpdated: Double
    var languages = [LocalizationLanguage]()
    var defaultLocalization: String
}

struct LocalizationLanguage: Codable {
    var name: String
    var code: String
    var terms =  [LocalizationTerm]()
}

struct LocalizationTerm: Codable {
    var term: String
    var definition: String
}

struct UserLocalizationDefaults: Codable {
    var localizationData: LocalizationData
    var selectedLanguageCode: String
}
