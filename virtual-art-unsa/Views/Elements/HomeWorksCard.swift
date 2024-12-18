//
//  HomeWorksCard.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/18/24.
//

import SwiftUI

struct HomeWorksCard: View {
    var body: some View {
        
        VStack {
<<<<<<< HEAD
            Text("Imagenes aca")
        }
    }
}

#Preview {
    HomeWorksCard()
}
=======
            HStack {
                Spacer()
            }
            HStack {
                Text("Pinturas")
                    .font(Font.custom( "OldStandardTT-Bold", size:20))
                    .foregroundColor(Color(hex:"3d6373"))
                Spacer()
                Image(systemName: "chevron.right")
                    .font(Font.custom( "OldStandardTT-Bold", size:20))
                    .foregroundColor(Color(hex:"3d6373"))
                    .onTapGesture {
                        print("Presionado")
                    }
            }
            .padding()
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.4), radius: 4, x: 1, y: 4)
        
    }
}

>>>>>>> 58fa396 (Initial Commit)
