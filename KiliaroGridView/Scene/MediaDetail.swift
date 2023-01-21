//
//  MediaDetail.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/20/23.
//

import SwiftUI
import URLImage


struct MediaDetail: View {
    
    /// Variables:
    @Environment(\.presentationMode) var presentationMode

    @State private var hideHeader: Bool = true
    @State private var isLoaded: Bool = false
    @State private var showInformation: Bool = false
    
    var mediaViewModel: MediaViewModel

    
    /// Methods:
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack(alignment:.center) {
                    
                    Spacer()
                    ZStack {
                        if let url = URL(string: self.mediaViewModel.downloadUrl) {
                            URLImage(url: url,
                                     content: { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(5)
                                    .onAppear() {
                                        self.isLoaded = true
                                    }
                            })
                        }
                        if !self.isLoaded {
                            ProgressView()
                                .tint(Color.cyan)
                        }
                        if self.showInformation {
                            MediaInfo(width: geometry.size.width, height: geometry.size.height, mediaViewModel: self.mediaViewModel)
                        }
                    }
                    
                    Spacer()
                }
                .onTapGesture {
                    self.hideHeader.toggle()
                }
                VStack {
                    if self.hideHeader {
                        MediaHeader(backButton: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, mediaInfo: {
                            self.showInformation.toggle()
                        }, fileName: self.mediaViewModel.title)
                    }
                    Spacer()
                }
            }
            .background(Color.black)
            .navigationBarHidden(true)
                .navigationBarTitle(Text(""), displayMode: .inline)
                .edgesIgnoringSafeArea(.top)
        }
    }
}

struct MediaDetail_Previews: PreviewProvider {
    static var previews: some View {
        MediaDetail(mediaViewModel: MediaViewModel())
    }
}
