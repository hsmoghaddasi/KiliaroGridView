//
//  CasheHelper.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/20/23.
//

import Foundation
import UIKit

class CacheHelper {
    
    
    /// Variables:
    private let imageCache = NSCache<NSString, UIImage>()
    private let mediaListCashe = NSCache<NSString, MediaList>()
    
    static let shared = CacheHelper()
    
    
    /// Methods:
    
    func clearCache() {
        
        if CacheHelper.shared.mediaListExist() {
            self.mediaListCashe.removeObject(forKey: NSString(string: URLs.getMediaListUrl()))
        }
    }
    
    
    func saveImageList(medialist: MediaList) {
        let cacheKey = NSString(string: URLs.getMediaListUrl())
        self.mediaListCashe.setObject(medialist, forKey: cacheKey)
    }
    
    func mediaListExist() -> Bool{
        if self.mediaListCashe.object(forKey: NSString(string: URLs.getMediaListUrl())) != nil {
            return true
        }
        return false
    }
    
    func retriveMediaList() -> MediaList {
        if let mediaList = self.mediaListCashe.object(forKey: NSString(string: URLs.getMediaListUrl())) {
            return mediaList
        }
        return MediaList(list: [])
    }
}
