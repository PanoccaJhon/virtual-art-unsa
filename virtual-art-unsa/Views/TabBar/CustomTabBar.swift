//
//  CustomTabBar.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/17/24.
//

import SwiftUI

struct CustomTabBar: View {
    @Binding var selectedTab: TabModel
    private var fillImage: String {
        selectedTab.rawValue + ".fill"
    }
    private var tabColor: Color {
        switch selectedTab {
        case .house:
            return .blue
        case .photo:
            return .indigo
        case .event:
            return .purple
        case .map:
            return .green
        case .person:
            return .orange
        }
    }
    
    
    var body: some View {
        VStack {
            HStack {
                ForEach(TabModel.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: selectedTab == tab ? fillImage : tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? tabColor : .white)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.black)
            .cornerRadius(30)
            .padding()
        }
    }
}

