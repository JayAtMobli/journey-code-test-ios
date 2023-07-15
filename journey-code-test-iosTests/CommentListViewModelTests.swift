//
//  CommentListViewModelTests.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 15/07/23.
//

import XCTest
@testable import journey_code_test_ios

final class CommentListViewModelTests: XCTestCase {
    private var vm: CommentListViewModel!
    
    @MainActor override func setUp() {
        let mockedService = MockedService()
        let post = Post(userId: 1, id: 1)
        vm = CommentListViewModel(selectedPost: post, networkService: mockedService)
    }

    @MainActor func testViewModelSearchWithSuccess() async {
        Task {
            await vm.getComments()
            XCTAssertEqual(vm.comments.count, 5)
            
            vm.searchTerms = "Eliseo@gardner.biz"
            XCTAssertEqual(vm.filteredComments.count, 1)
        }
    }
}
