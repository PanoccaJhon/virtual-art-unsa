//
//  HomeView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {

        VStack {
            VStack (alignment: .leading) {
                Text("Virtual Art UNSA")
                    .font(Font.custom( "OldStandardTT-Bold", size:34))
                    .foregroundColor(Color(hex: "474747"))
                    .padding(.bottom, 10)
                Text("Explora el increible mundo del arte a travez de su aplicativo de confianza")
                    .font(Font.custom("OldStandardTT-Regular", size:20))
                    .foregroundColor(Color(hex: "686868"))

            }
<<<<<<< HEAD
            
=======
            .padding(.bottom, 10)
            VStack {
                HomeWorksCard()
            }
>>>>>>> 58fa396 (Initial Commit)
            Spacer()
        }
        .padding()
    }
}

