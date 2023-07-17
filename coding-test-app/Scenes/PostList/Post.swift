//
//  Post.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct Post: Codable, Identifiable, Hashable {
    var userId: Int
    var id: Int
    var title: String?
    var body: String?
}
