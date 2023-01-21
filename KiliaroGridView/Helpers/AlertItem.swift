//
//  AlertItem.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    var id = UUID()
    var title: String
    let message: String
}

enum AlertContext {
    
    //MARK: - Errors
    static let invalidURL = AlertItem(title: "Request Error",
                                      message: "There is an error trying to reach the server. If this persists, please contact support.")
    
    static let transportError = AlertItem(title: "Network Error",
                                          message: "Unable to complete your request at this time. Please check your internet connection.")
    
    static let serverError = AlertItem(title: "Server Error",
                                       message: "Unable to complete your request at this time. Please check your internet connection.")
    static let invalidResponse = AlertItem(title: "Response Error",
                                           message: "Invalid response from the server. Please try again or contact support.")
    
    static let noData = AlertItem(title: "Server Error",
                                  message: "The data received from the server was invalid. Please try again or contact support.")
    
    static let noError = AlertItem(title: "Server Error",
                                        message: "The data received from the server was invalid. Please try again or contact support.")
    
}
