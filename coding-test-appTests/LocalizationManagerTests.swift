//
//  LocalizationManagerTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 8/07/23.
//

import XCTest
@testable import coding_test_app

final class LocalizationManagerTests: XCTestCase {
    let localizationManager = LocalizationManager()
    
    func test_localization_Success() {
        let postScreenTitle = localizationManager.postListViewTitle
        XCTAssertEqual(postScreenTitle, "Posts")
    }
}
