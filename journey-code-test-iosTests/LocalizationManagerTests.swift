//
//  LocalizationManagerTests.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 8/07/23.
//

import XCTest
@testable import journey_code_test_ios

final class LocalizationManagerTests: XCTestCase {
    let localizationManager = LocalizationManager()
    
    func test_localization_Success() {
        let postScreenTitle = localizationManager.postListViewTitle
        XCTAssertEqual(postScreenTitle, "Posts")
    }
}
