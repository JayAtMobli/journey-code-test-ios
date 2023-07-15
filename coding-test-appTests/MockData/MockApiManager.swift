//
//  MockApiManager.swift
//  journey-code-test-iosTests
//
//  Created by Jay Park on 7/07/23.
//

import Foundation
@testable import journey_code_test_ios

struct MockApiManager: ApiManagerProtocol {
    func perform(_ request: URLRequest) async -> Result<Data, Error> {
        guard let path = request.url?.path,
            let data =  try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe) else {
            return .failure(NetworkError.invalidServerResponse)
        }
        return .success(data)
    }
}
