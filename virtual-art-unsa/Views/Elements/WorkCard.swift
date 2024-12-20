//
//  WorkCard.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct WorkCard: View {
    var work: Work
    
    var body: some View {
            ZStack {
                AsyncImage(url: URL(string: "\(APIService.baseURL)/img/\(work.image)")) { phase in
                   switch phase {
                   case .empty:
                       // Cuando la imagen aún se está cargando
                       ProgressView()
                           .progressViewStyle(CircularProgressViewStyle())
                   case .success(let image):
                       // Imagen cargada exitosamente
                       image.resizable()
                           .scaledToFill()
                           .frame(width: .infinity, height: 200)
                           .clipped()
                   case .failure:
                       // Si hubo un error al cargar la imagen
                       Image(systemName: "exclamationmark.triangle.fill")
                           .resizable()
                           .frame(width: 50, height: 50)
                           .foregroundColor(.red)
                   @unknown default:
                       EmptyView()
                   }
               }
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]),
                                           startPoint: .bottom, endPoint: .top)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                //Informacion de la pintura
                VStack(alignment: .leading) {
                    Spacer()
                    HStack{
                        VStack (alignment: .leading){
                            Text(work.title)
                                .font(Font.custom( "Roboto-Bold", size:20))
                            Text(work.dimension)
                                .font(Font.custom( "Roboto", size:14))
                            Text("Técnica: \(work.technique)")
                                .font(Font.custom( "Roboto", size:15))
                        }
                        .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .font(Font.custom( "OldStandardTT-Bold", size:25))
                            .foregroundColor(.white)
                    }
                }
                .padding(15)
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .frame(width: .infinity)
            .clipped()
            
        }
}
