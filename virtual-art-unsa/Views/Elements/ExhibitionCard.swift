//
//  ExhibitionCard.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import SwiftUI

struct ExhibitionCard: View {
    var images: [RandomWorkImage]
    var title: String = ""
    let imgUrl: String = "\(APIService.baseURL)/img"
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                VStack {
                    if let firstImage = images.first?.image {
                        AsyncImage(url: URL(string: "\(imgUrl)/\(firstImage)")) { img in
                            img
                                .resizable()       // Permite redimensionar la imagen
                                .scaledToFill()    // Llena el contenedor manteniendo la relación de aspecto
                                .frame(width: .infinity, height: 160) // Define el tamaño del contenedor
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Text("No image available")
                    }
                }
                .frame(height: 160)
                VStack(spacing: 0) {
                    if images.indices.contains(1) {
                        let secondImage = images[1].image
                        AsyncImage(url: URL(string: "\(imgUrl)/\(secondImage)")) { img in
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width:.infinity, height: 80)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Text("No image available for second item")
                    }

                    if images.indices.contains(2) {
                        let thirdImage = images[2].image
                        AsyncImage(url: URL(string: "\(imgUrl)/\(thirdImage)")) { img in
                            img
                                .resizable()
                                .scaledToFill()
                                .frame(width: .infinity, height: 80)
                                .clipped()
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Text("No image available for third item")
                    }
                }
                .frame(height: 160)
                
                
            }
            .frame(width: .infinity , height: 160)
            HStack {
                Text("\(title)")
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
        .frame(width: .infinity)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: .black.opacity(0.4), radius: 4, x: 1, y: 4)
        
    }
}
