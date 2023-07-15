//
//  DataParserTests.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 7/07/23.
//

import XCTest
@testable import journey_code_test_ios

final class DataParserTests: XCTestCase {
    let dataParser = DataParser()

    func testParseData_WrongData_nil() {
        if let data = try? Utils.loadJsonFile(name: "wrong-json-contents") {
            guard let _ = try? dataParser.decode(data) as [Post] else { return }
            XCTFail()
        }
    }

    func testDecodeData_WrongData_ThrowsError() {
        if let data = try? Utils.loadJsonFile(name: "wrong-json-contents") {
            XCTAssertThrowsError( try dataParser.decode(data) as [Post]) { error in
                XCTAssertNotNil(error)
            }
        }
    }

    func testDecodeData_Success() {
        if let data = try? Utils.loadJsonFile(name: "postsMock"), let posts = try? dataParser.decode(data) as [Post] {
            if let firstPost = posts.first {
                XCTAssertEqual(firstPost.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
            }
        }
    }
}
