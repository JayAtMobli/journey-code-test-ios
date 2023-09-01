//
//  PostListViewModelTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 15/07/23.
//

import XCTest
@testable import coding_test_app

@MainActor
final class PostListViewModelTests: XCTestCase {
    private var vm: PostListViewModel!
    
    override func setUp() {
        let mockedService = MockedService()
        vm = PostListViewModel(service: mockedService)
    }
    
    func testViewModelGetPostsSuccess() async {
        Task {
            await vm.getPosts()
            XCTAssertEqual(vm.posts.count, 100)
        }
    }
    
    
    func testViewModelSearchSuccess() async {
        Task {
            await vm.getPosts()
            vm.searchTerms = "qui es"
            XCTAssertEqual(vm.filteredPosts.count, 2)
        }
    }
}
