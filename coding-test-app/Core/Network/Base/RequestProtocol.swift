//
//  RequestProtocol.swift
//  coding-test-app
//
//  Created by Jay Park on 7/07/23.
//

import Foundation

protocol RequestProtocol {
    var host: String { get }
    var path: String { get }
    var requestType: RequestType { get }
    var headers: [String: String] { get }
    
    // MARK: - use this property to pass the post body contents
    var params: [String: Any] { get }
    
    // MARK: - use this property for the query parameters
    var urlParams: [String: String?] { get }
    
    // MARK: - Dealing authToken is out of scope for this simple code testing. But it is good to show how I manage access token.
    var addAuthorizationToken: Bool { get }
}


// MARK: - Default implementation of Request protocol
extension RequestProtocol {
    var host: String {
        guard let apiBaseUrl = Bundle.main.apiBaseUrl else {
            assertionFailure("==== MUST define ApiBaseUrl in info.plist ====")
            return ""
        }
        return apiBaseUrl
    }
    
    var addAuthorizationToken: Bool {
        false
    }
    
    // MARK: - number of retries set here
    var numberOfReTryies: Int {
        2
    }
    
    var params: [String: Any] {
        [:]
    }
    
    var urlParams: [String: String?] {
        [:]
    }

    var headers: [String: String] {
        [:]
    }

    func createURLRequest(authToken: String? = nil) throws -> URLRequest {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path

        if !urlParams.isEmpty {
            components.queryItems = urlParams.map { URLQueryItem(name: $0, value: $1) }
        }

        guard let url = components.url else { throw  NetworkError.invalidURL }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = requestType.rawValue

        if !headers.isEmpty {
            urlRequest.allHTTPHeaderFields = headers
        }

        if let authToken = authToken, addAuthorizationToken == true {
            urlRequest.setValue("Bearer \(authToken)", forHTTPHeaderField: "Authorization")
        }

        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")

        if !params.isEmpty {
            urlRequest.httpBody = try JSONSerialization.data(withJSONObject: params)
        }

        return urlRequest
    }
}


