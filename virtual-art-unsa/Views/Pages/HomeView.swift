//
//  HomeView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct HomeView: View {
    @StateObject var randomImagen = HomeViewModel()
    @Binding var selectedTab: TabModel
    var body: some View {

        ScrollView {
            VStack (alignment: .leading) {
                Text("Virtual Art UNSA")
                    .font(Font.custom( "OldStandardTT-Bold", size:34))
                    .foregroundColor(Color(hex: "474747"))
                    .padding(.bottom, 10)
                    .padding(.top, 10)
                Text("Explora el increible mundo del arte a travez de su aplicativo de confianza")
                    .font(Font.custom("OldStandardTT-Regular", size:20))
                    .foregroundColor(Color(hex: "686868"))

            }
            .onAppear{
                randomImagen.fetchWorkImages()
            }
            .padding(.bottom, 15)
            VStack (spacing:25){
                HomeWorksCard(worksImages:randomImagen.worksImages,title:"Pinturas")
                    .onTapGesture {
                        selectedTab = TabModel.photo
                    }
                HomeWorksCard(worksImages:randomImagen.worksImages, title:"Exhibiciones")
                    .onTapGesture {
                        selectedTab = TabModel.event
                    }
                HomeWorksCard(worksImages:randomImagen.worksImages, title:"Galerias")
                    .onTapGesture {
                        selectedTab = TabModel.map
                    }
                Spacer()
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            }
            Spacer()
        }
        .padding()
    }
}

