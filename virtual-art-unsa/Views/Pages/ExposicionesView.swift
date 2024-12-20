//
//  ExposicionesView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct ExposicionesView: View {
    @StateObject var exhibitionViewModel = ExhibitionsViewModel()
    @Binding var selectedTab: TabModel
    var body: some View {
        NavigationView(){
            ZStack{
                ScrollView {
                    VStack (alignment: .leading) {
                        Text("Exhibiciones")
                            .font(Font.custom( "OldStandardTT-Bold", size:34))
                            .foregroundColor(Color(hex: "474747"))
                            .padding(.bottom, 10)
                            .padding(.top, 10)
                        Text("Explora las presentaciones mas recientes")
                            .font(Font.custom("OldStandardTT-Regular", size:20))
                            .foregroundColor(Color(hex: "686868"))
                        
                    }
                    .onAppear{
                        exhibitionViewModel.fetchExhibitionsList()
                    }
                    .padding(.bottom, 15)
                    VStack (spacing:25){
                        ForEach(exhibitionViewModel.exhibitions ) {utem in
                            if let id = utem.id {
                                NavigationLink(destination: ExhibitionDetailView(id: id ?? 0)) {
                                    var imagene:[RandomWorkImage] = exhibitionViewModel.fetchExhibitionImages(exhibitionId: utem.id ?? 0) ?? [RandomWorkImage]()
                                    ExhibitionCard(images: imagene,title:utem.name)
                                }
                            } else {
                                Text("ID no disponible")
                            }
                        }
                        Spacer()
                            .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
                
            }
            .padding()
            .navigationTitle("Exposiciones")
            .navigationBarHidden(true)
        }
    }
}


