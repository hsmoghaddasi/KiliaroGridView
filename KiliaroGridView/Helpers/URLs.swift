//
//  URLs.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation

struct URLs {
    
    /// Variables:
    static let key = "djlCbGusTJamg_ca4axEVw"
    static let baseURL = "https://api1.kiliaro.com"
    
    
    /// Methods:
    static func getMediaListUrl() -> String{
        return "\(baseURL)/shared/\(key)/media"
    }
}
