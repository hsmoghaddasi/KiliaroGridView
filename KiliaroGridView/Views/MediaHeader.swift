//
//  MediaHeader.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/20/23.
//

import SwiftUI

struct MediaHeader: View {
    
    /// Variables:
    var backButton: ()->Void
    var mediaInfo: ()->Void
    var fileName: String
    
    
    /// Views:
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(height: 96)
                HStack {
                    Button(action: self.backButton) {
                        Image("Back")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 40, height:40)
                            .padding(.top, 40)
                            .padding(.leading, 10)
                            
                    }
                    Spacer()
                    
                    Text(self.fileName)
                        .foregroundColor(.white)
                        .fontWeight(.heavy)
                        .font(.title)
                        .padding(.top, 46)
                        
                    
                    Spacer()
                    
                    Button(action: self.mediaInfo) {
                        Image("info")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 30, height:30)
                            .padding(.top, 40)
                            .padding(.trailing, 10)
                            
                    }
                }
            }
            Spacer()
        }.ignoresSafeArea()
            .frame(height: 96)
    }
}

struct MediaHeader_Previews: PreviewProvider {
    static var previews: some View {
        MediaHeader(backButton: {
            
        }, mediaInfo: {
            
        }, fileName: "TaDa")
    }
}
