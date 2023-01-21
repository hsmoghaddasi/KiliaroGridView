//
//  MediaInfo.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/20/23.
//

import SwiftUI

struct MediaInfo: View {
    
    /// Variables:
    @State var width: Double = 0
    @State var height: Double = 0
    
    var mediaViewModel: MediaViewModel
    
    
    /// Methods:
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Spacer()
            HStack() {
                Text("Name: \(self.mediaViewModel.title)")
                    .padding()
                    .background(Color.white.opacity(0.5))
                Spacer()
            }
            Text("Size: \(self.mediaViewModel.size)")
                .padding()
                .background(Color.white.opacity(0.5))
            Text("Dimensions: \(self.mediaViewModel.resx) × \(self.mediaViewModel.resy)")
                .padding()
                .background(Color.white.opacity(0.5))
        }
    }
}
