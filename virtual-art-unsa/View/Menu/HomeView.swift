//
//  HomeView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
   		Text("Virtual Art UNSA")
                    .font(Font.custom( "OldStandardTT-Bold", size:34))
            }
            .navigationTitle("Virtual Art UNSA")
            .edgesIgnoringSafeArea(.top)
        }
    }
}

