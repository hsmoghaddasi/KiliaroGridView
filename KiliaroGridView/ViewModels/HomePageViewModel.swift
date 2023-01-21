//
//  HomePageViewModel.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation
import Combine
import SwiftUI

final class HomePageViewModel: ObservableObject {
    
    
    /// Variables:
    
    @Published var hasError = false
    @Published var alertItem: AlertItem = AlertContext.noError
    @Published var mediaList: [MediaViewModel] = []
    @Published private(set) var isRefreshing = false
    
    /// Methods:
    func getMediaList() {
        self.isRefreshing = true
        NetworkHelper.shared.getMediaList { Result in
            DispatchQueue.main.async {
                self.isRefreshing = false
                switch Result {
                case .success(let mediaList):
                    self.mediaList = mediaList.list.map({ MediaViewModel($0)})
                case .failure(let err):
                    switch err {
                    case .transportError:
                        self.alertItem = AlertContext.transportError
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .serverError:
                        self.alertItem = AlertContext.serverError
                    case .noData:
                        self.alertItem = AlertContext.noData
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .noError:
                        self.alertItem = AlertContext.noError
                    }
                }
            }
        }
    }
    
    func horizontalSort() {
        self.mediaList = mediaList.sorted(by: {$0.isHorizontal && !$1.isHorizontal})
    }
    
    func verticalSort() {
        self.mediaList = mediaList.sorted(by: {!$0.isHorizontal && $1.isHorizontal})
    }
    
    func sizeSort(ascending: Bool) {
        if ascending {
            self.mediaList = mediaList.sorted(by: {$0.size < $1.size})
        }else {
            self.mediaList = mediaList.sorted(by: {$0.size > $1.size})
        }
    }
}
