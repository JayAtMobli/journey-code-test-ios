//
//  UtilsTest.swift
//  coding-test-appTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import coding_test_app

final class UtilsTest: XCTestCase {
    func test_loadJson_Sucess() {
        let data = try? Utils.loadJsonFile(name: "postsMock")
        XCTAssertNotNil(data)
    }
}
