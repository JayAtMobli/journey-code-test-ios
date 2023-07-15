//
//  UtilsTest.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import journey_code_test_ios

final class UtilsTest: XCTestCase {
    func test_loadJson_Sucess() {
        let data = try? Utils.loadJsonFile(name: "postsMock")
        XCTAssertNotNil(data)
    }
}
