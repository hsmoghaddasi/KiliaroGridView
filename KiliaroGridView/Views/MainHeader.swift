//
//  MainHeader.swift
//  KiliaroGridView
//
//  Created by Hassan Sadegh Moghaddasi on 1/15/23.
//

import SwiftUI

struct MainHeader: View {
    
    /// Variables:
    var showInformationView: ()->Void
    var clearCash: ()->Void
    
    
    /// Views:
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.white)
                    .frame(height: 96)
                    .shadow(color: Color.gray, radius: 10, x: 0, y: 2)
                HStack {
                    Button(action: self.showInformationView) {
                        Image("Sort")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: 30, height:30)
                            .padding(.top, 40)
                            .padding(.leading, 10)
                            
                    }
                    Spacer()
                    
                    ZStack(alignment: .bottom) {
                        Image("Kiliaro")
                            .resizable()
                            .frame(width: 40, height:40)
                            .cornerRadius(20)
                            .padding(.top, 46)
                    
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 20)
                                
                        Text("HSM")
                            .foregroundColor(Color.white)
                            .fontWeight(.heavy)
                            .font(.system(size: 7))
                        }
                        .padding(.leading, 40)
                    }
                        
                    
                    Spacer()
                    
                    Button(action: self.clearCash) {
                        Image("clear")
                            .renderingMode(.template)
                            .resizable()
                            .foregroundColor(Color.blue)
                            .frame(width: 30, height:30)
                            .padding(.top, 40)
                            .padding(.trailing, 10)
                            
                    }
                }
            }
            Spacer()
        }.ignoresSafeArea()
    }
}

struct MainHeader_Previews: PreviewProvider {
    static var previews: some View {
        MainHeader(showInformationView: {print("show info")}, clearCash: {print("clear cash")})
    }
}
