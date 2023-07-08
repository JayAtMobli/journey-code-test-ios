//
//  LocalizationManager.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 8/07/23.
//

import Foundation

class LocalizationManager: ObservableObject {
    @Published private var userLocalizationDefaults: UserLocalizationDefaults
    
    init() {
        let  defaultAppLocalizationData = LocalizationManager.defaultAppLocalizationData()
        self.userLocalizationDefaults = UserLocalizationDefaults(localizationData: defaultAppLocalizationData, selectedLanguageCode: "en")
    }
    
    fileprivate func localize(term: String) -> String {
        guard let currentLocalization = currentLocalization() else {
            return term
        }
        return currentLocalization.terms.first(where: {$0.term == term })?.definition ?? term
    }
    
    fileprivate static func defaultAppLocalizationData() -> LocalizationData {
        let dataParser = DataParser()
        let defaultLocalizationJSONData = try? Utils.loadJsonFile(name: "default-localization")
        let localizationData = (try? dataParser.decode(defaultLocalizationJSONData!) as LocalizationData)!
        return localizationData
    }
    
    private func currentLocalization() -> LocalizationLanguage? {
        let selectedLanguageCode = userLocalizationDefaults.selectedLanguageCode
        let localizationData = userLocalizationDefaults.localizationData
        guard let currentLocalization = localizationData.languages.first(where: {$0.code == selectedLanguageCode}) else {
            return localizationData.languages.first(where: {$0.code == localizationData.defaultLocalization})
        }
        return currentLocalization
    }
}

protocol Localization {
    var postListViewTitle: String { get }
    var commentListViewTitle: String { get }
    var searchPlaceHolderText: String { get }
}

extension LocalizationManager: Localization {
    var postListViewTitle: String {
        return localize(term: "post_list_view_title")
    }

    var commentListViewTitle: String {
        return localize(term: "comment_list_view_title")
    }

    var searchPlaceHolderText: String {
        return localize(term: "search_placeholder_text")
    }
}
