//
//  KiliaroGridViewApp.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/15/23.
//

import SwiftUI
import URLImage

@main
struct KiliaroGridViewApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear() {
                    URLImageService.shared.defaultOptions.cachePolicy = .returnCacheElseLoad(cacheDelay: .zero, downloadDelay: 5)

                    URLImageService.shared.defaultOptions.loadOptions.formUnion(.inMemory)

                    URLImageService.shared.defaultOptions.urlRequestConfiguration.cachePolicy = .returnCacheDataElseLoad

                }
        }
    }
}
