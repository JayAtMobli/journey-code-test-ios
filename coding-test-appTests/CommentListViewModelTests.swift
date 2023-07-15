//
//  CommentListViewModelTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 15/07/23.
//

import XCTest
@testable import coding_test_app

@MainActor
final class CommentListViewModelTests: XCTestCase {
    private var vm: CommentListViewModel!
    
    override func setUp() {
        let mockedService = MockedService()
        let post = Post(userId: 1, id: 1)
        vm = CommentListViewModel(selectedPost: post, service: mockedService)
    }
    
    func testViewModelGetCommentsSuccess() async {
        Task {
            await vm.getComments()
            XCTAssertEqual(vm.comments.count, 5)
        }
    }

    func testViewModelSearchWithSuccess() async {
        Task {
            await vm.getComments()
            vm.searchTerms = "Eliseo@gardner.biz"
            XCTAssertEqual(vm.filteredComments.count, 1)
        }
    }
}
