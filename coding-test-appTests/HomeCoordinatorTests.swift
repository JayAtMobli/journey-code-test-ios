//
//  HomeCoordinatorTests.swift
//  coding-test-appTests
//
//  Created by Jay Park on 16/07/23.
//

import XCTest
@testable import coding_test_app

@MainActor
final class HomeCoordinatorTests: XCTestCase {
    private var coordinator: HomeCoordinator!
    
    override func setUp() {
        let service = MockedService()
        coordinator = HomeCoordinator(service: service)
    }
    
    func testCoordinatorPostListViewModelNotNil() {
        XCTAssertNotNil(coordinator.postListViewModel)
    }
    
    func testCoordinatorCommentListViewModelNil() {
        XCTAssertNil(coordinator.commentListViewModel)
    }
    
    func testCoordinatorOpenCommentListSuccess() {
        let post = Post(userId: 1, id: 1)
        coordinator.openCommentList(post: post)
        
        XCTAssertNotNil(coordinator.commentListViewModel)
    }
}
