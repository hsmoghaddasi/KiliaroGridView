//
//  HomePageImageCell.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/18/23.
//

import SwiftUI
import URLImage

struct HomePageImageCell: View {
    
    /// Variables:
    @State private var imageOpacity: Double = 1.0
    var imageVM: MediaViewModel
    
    /// Views:
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            
            if let url = URL(string: self.imageVM.thumbnailUrl) {
                URLImage(url: url,
                         content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(5)
                })
            }
            
            Text(self.imageVM.size)
                .font(.system(size: 12))
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(5)
                .background(Color.black.opacity(0.5))
                .padding(5)
        }
    }
}
