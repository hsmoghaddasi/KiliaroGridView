//
//  ContentView.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/15/23.
//

import SwiftUI
import URLImage

struct ContentView: View {
    
    /// Variables:
    @ObservedObject var viewModel = HomePageViewModel()
    
    @State var isLoaded: Bool = false
    @State var showingSorting: Bool = false
    
    private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    
    /// Views:
    var body: some View {
        
        GeometryReader { geometry in
            NavigationView {
                VStack {
                    MainHeader(
                    showInformationView: {
                        self.showingSorting = true
                    }, clearCash: {
                        self.clearCache()
                    })
                    .frame(height: 106)
                    ZStack {
                        if viewModel.isRefreshing {
                            ProgressView()
                                .frame(height: self.viewModel.isRefreshing ? geometry.size.height - 106 : 0)
                        } else {
                            ScrollView {
                                LazyVGrid(columns: gridItemLayout, spacing: 20) {
                                    ForEach(self.viewModel.mediaList, id: \.id) { mediaItem in
                                        NavigationLink(destination: MediaDetail(mediaViewModel: mediaItem)) {
                                            HomePageImageCell(imageVM: mediaItem)
                                                .shadow(color: Color.gray, radius: 10, x: 0, y: 2)
                                        }
                                    }
                                }
                            }.onAppear() {
                                self.isLoaded = true
                            }
                            .padding(4)
                        }
                    }
                    .alert(self.viewModel.alertItem.title, isPresented: self.$viewModel.hasError, actions: {
                          Button("Retry", role: .cancel, action: {
                              self.clearCache()
                          })
                          Button("Ok", role: .destructive, action: {
                              self.isLoaded = true
                          })
                        }, message: {
                            Text(self.viewModel.alertItem.message)
                        })
                }.onAppear() {
                    if !self.isLoaded {
                        self.viewModel.getMediaList()
                    }
                }
                .edgesIgnoringSafeArea(.all)
                .confirmationDialog("Change Sort Style", isPresented: $showingSorting) {
                    Button("Ascending Size Sort") { self.viewModel.sizeSort(ascending: true) }
                    Button("Descending Size Sort") { self.viewModel.sizeSort(ascending: false) }
                    Button("Horizontal Dimensions Sort") { self.viewModel.horizontalSort() }
                    Button("Vertical Dimensions Sort") { self.viewModel.verticalSort() }
                    Button("Cancel", role: .cancel) { self.showingSorting = false }
                } message: {
                    Text("Select Sorting")
                }
            }
            .navigationBarHidden(true)
            .navigationBarTitle(Text(""), displayMode: .inline)
        }
    }
    
    
    /// Methods:
    func clearCache() {
        CacheHelper.shared.clearCache()
        URLImageService.shared.cleanup()
        URLImageService.shared.removeAllCachedImages()
        self.viewModel.getMediaList()
        self.isLoaded = false
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
