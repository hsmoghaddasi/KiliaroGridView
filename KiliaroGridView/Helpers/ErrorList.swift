//
//  ErrorList.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation

enum NetworkError: Error {
    case invalidURL(String)
    case transportError(Error)
    case serverError(statusCode: Int)
    case noData
    case invalidResponse(Error)
    case noError
}
