//
//  Post.swift
//  journey-code-test-ios
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

struct Post: Codable, Identifiable {
    var userId: Int
    var id: Int
    var title: String?
    var body: String?
}
