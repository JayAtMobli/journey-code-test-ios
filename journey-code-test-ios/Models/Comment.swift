//
//  Comment.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct Comment: Codable, Identifiable {
    var postId: Int
    var id: Int
    var name: String?
    var email: String?
    var body: String?
}
