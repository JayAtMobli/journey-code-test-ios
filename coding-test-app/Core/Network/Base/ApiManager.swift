//
//  ApiManager.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

// MARK: - URLSession handling layer

protocol ApiManagerProtocol {
    func perform(_ request: URLRequest) async -> Result<Data, Error>
}

class ApiManager: ApiManagerProtocol {
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func perform(_ request: URLRequest) async -> Result<Data, Error> {
        do {
            let (data, response) = try await urlSession.data(for: request)
            return handleResponse(data: data, response: response)
        }
        catch let error {
            return Result.failure(error)
        }
    }
    
    func handleResponse(data: Data, response: URLResponse) -> Result<Data, Error> {
        guard let httpURLResponse = response as? HTTPURLResponse else {
            return Result.failure(NetworkError.invalidServerResponse)
        }
        
        let statusCode = httpURLResponse.statusCode
        switch statusCode {
        case 200..<300:
            return Result.success(data)
        default:
            return Result.failure(NetworkError.invalidServerResponse)
        }
    }
}
