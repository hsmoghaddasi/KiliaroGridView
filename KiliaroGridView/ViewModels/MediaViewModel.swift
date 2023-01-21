//
//  MediaViewModel.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/18/23.
//

import Foundation


struct MediaViewModel: Identifiable {
    private let media: MediaModel
    
    var id: String {
        return self.media.id
    }
    
    var userId: String {
        return self.media.user_id
    }
    
    var mediaType: String {
        return self.media.media_type
    }
    
    var fileName: String {
        return self.media.filename
    }
    
    var title: String {
        let fileNameArray = self.media.filename.split(separator: "-")
        
        if fileNameArray.count > 2 {
            return "\(fileNameArray[0]) \(fileNameArray[1])"
        }
        return ""
    }
    
    var size: String {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB]
        bcf.countStyle = .file
        return bcf.string(fromByteCount: self.media.size)
    }
    
    var createTime: String {
        self.media.created_at
    }
    
    var takenTime: String {
        return self.media.taken_at ?? ""
    }
    
    var guessedTakenTime: String {
        return self.media.guessed_taken_at ?? ""
    }
    
    var contentType: String {
        return self.media.content_type
    }
    
    var video: String {
        return self.media.video ?? ""
    }
    
    var thumbnailUrl: String {
        return self.media.thumbnail_url
    }
    
    var downloadUrl: String {
        return self.media.download_url
    }
    
    var resx: Int {
        return self.media.resx
    }
    
    var resy: Int {
        return self.media.resy
    }
    
    var isHorizontal: Bool {
        return self.media.resx > self.media.resy
    }
    
    init(_ mediaInfo: MediaModel? = nil) {
        self.media = mediaInfo ?? MediaModel(id: "", user_id: "", media_type: "", filename: "", size: 0, created_at: "", taken_at: "", guessed_taken_at: "", md5sum: "", content_type: "", video: "", thumbnail_url: "", download_url: "", resx: 0, resy: 0)
    }
    
}
