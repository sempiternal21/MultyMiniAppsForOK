//
//  NetworkManager.swift
//  MultyMiniAppsForOK
//
//  Created by Danil Antonov on 03.09.2024.
//

import Foundation

enum NetworkError: Error {
    case someError
}

enum HttpRequestType {
    case get, post
}

final class NetworkManager {
    func execute<T: Codable>(from urlString: String, type: HttpRequestType = HttpRequestType.get, params: Dictionary<String, String>? = nil) async throws -> T {
        guard let url = URL(string: urlString) else  {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        switch type {
        case .get:
            request.httpMethod = "GET"
        case .post:
            request.httpMethod = "POST"
            var body: String = ""
            if params != nil {
                params!.forEach { (key: String, value: String) in
                    body += "\(key)=\(value)&"
                }
                body.removeLast()
                request.httpBody = body.data(using: .utf8)
            }
        }
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }

        let result = try JSONDecoder().decode(T.self, from: data)
        return result
    }
}
