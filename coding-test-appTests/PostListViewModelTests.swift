//
//  PostListViewModelTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 15/07/23.
//

import XCTest
@testable import coding_test_app


final class PostListViewModelTests: XCTestCase {
    private var vm: PostListViewModel!
    
    @MainActor override func setUp() {
        let mockedService = MockedService()
        let coordinator = HomeCoordinator(service: mockedService)
        vm = PostListViewModel(service: mockedService, coordinator: coordinator)
    }
    
    @MainActor func testViewModelSearchWithSuccess() async {
        Task {
            await vm.getPosts()
            XCTAssertEqual(vm.posts.count, 100)
            
            vm.searchTerms = "qui es"
            XCTAssertEqual(vm.filteredPosts.count, 2)
        }
    }
}
