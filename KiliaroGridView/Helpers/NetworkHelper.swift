//
//  NetworkHelper.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation
import Combine
import UIKit

final class NetworkHelper {
    
    /// Variables:
    static let shared = NetworkHelper()
    
    
    /// Methods:
    func getMediaList(completion: @escaping (Result<MediaList, NetworkError>) -> Void) {
        
        if CacheHelper.shared.mediaListExist() {
            completion(.success(CacheHelper.shared.retriveMediaList()))
            return
        }
        
        guard let url = URL(string: URLs.getMediaListUrl()) else {
            completion(.failure(.invalidURL("URL invalid")))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.transportError(error)))
                return
            }
            
            if let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(.failure(.serverError(statusCode: response.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let mediaArray = try decoder.decode([MediaModel].self, from: data)
                let mediaList = MediaList(list: mediaArray)
                CacheHelper.shared.saveImageList(medialist: mediaList)
                completion(.success(mediaList))
            }
            catch {
                completion(.failure(.invalidResponse(error)))
            }
        }
        
        task.resume()
    }
}
