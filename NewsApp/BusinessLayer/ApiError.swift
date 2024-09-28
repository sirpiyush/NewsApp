//
//  ApiError.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//


import Foundation

enum ApiError:Error{
    case networkError
    case invalidUrl
    case badResponse
    case parsingError(error:Error)
    case otherError(msg:String)
}
