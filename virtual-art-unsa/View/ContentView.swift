//
//  ContentView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            ZStack {
                // Contenido principal con un TabView
                TabView {
                    HomeView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    PinturasView()
                        .tabItem {
                            Label("", systemImage: "paintbrush")
                        }
                    ExposicionesView()
                        .tabItem {
                            Label("", systemImage: "house")
                        }
                    MapView()
                        .tabItem {
                            Label("", systemImage: "map")
                        }
                    UserView()
                        .tabItem {
                            Label("", systemImage: "paintbrush")
                        }
                    
                }
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
                
            }
        }
        
        
    }
}

