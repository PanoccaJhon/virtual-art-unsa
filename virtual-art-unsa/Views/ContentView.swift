//
//  ContentView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tabSelected: TabModel = .house
        
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            VStack {
                TabView(selection: $tabSelected) {
                    if let index = TabModel.allCases.firstIndex(of: tabSelected){
                        PagesModel.allCases[index].view(tabSelector: $tabSelected)
                    }else {
                        Text("Vista no encontrada")
                    }
                }
            }
            VStack {
                Spacer()
                CustomTabBar(selectedTab: $tabSelected)
            }
        }
    }
}



