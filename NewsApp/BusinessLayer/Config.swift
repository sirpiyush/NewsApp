//
//  Constant.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import Foundation
struct Config {
    static let key = "7a4a7c7c9e774158b53c343e4e5c714c"
    static let url = "https://newsapi.org/v2/"
    static let headlineUrl = "\(url)top-headlines?apiKey=\(key)"
    static let everythingUrl = "\(url)everything?apiKey=\(key)"
}

//Api related details need to be added
enum Api{
    case newslist(queryParam:String)
    func getURLRequest()->URLRequest?{
        var urlString = Config.url
        var method = ""
        switch self{
        case .newslist(let queryParam):
            urlString = Config.headlineUrl
            urlString+=queryParam
            method="GET"
        }
        guard let url = URL(string: urlString)
        else {
            debugPrint("Invalid URL")
            return nil
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method
        print(url)
        return urlRequest
    }
}
