//
//  MediaModel.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/17/23.
//

import Foundation

struct MediaModel: Codable {
    let id: String
    let user_id: String
    let media_type: String
    let filename: String
    let size: Int64
    let created_at: String
    let taken_at: String?
    let guessed_taken_at: String?
    let md5sum: String
    let content_type: String
    let video: String?
    let thumbnail_url: String
    let download_url: String
    let resx: Int
    let resy: Int
}

class MediaList: Codable{
    var list: [MediaModel]
    
    init(list: [MediaModel]) {
        self.list = list
    }
}
