//
//  HTTPClient.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import Foundation
import Combine

protocol HTTPClientProtocol{
    func getData<T:Decodable>(urlRequest:URLRequest)->AnyPublisher<T, Error>
}



final class HTTPClient:HTTPClientProtocol{
    static let shared = HTTPClient()
    let decoder = JSONDecoder()
    var cancellable = Set<AnyCancellable>()
    let session = URLSession(configuration: .default)
    private init(){}
    
    func getData<T:Decodable>(urlRequest:URLRequest)->AnyPublisher<T, Error>{
        return URLSession
            .shared
            .dataTaskPublisher(for: urlRequest)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) in
                        guard let httpResponse = response as? HTTPURLResponse,
                                  (200...299).contains(httpResponse.statusCode)
                        else {throw ApiError.badResponse}
                        return data
                    }
            .decode(type: T.self, decoder: decoder)
            .mapError{ error in
                ApiError.parsingError(error: error)
            }
            .eraseToAnyPublisher()
    }
}
