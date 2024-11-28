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
            HStack {
                // Imagen de ejemplo (asumiendo que tienes una forma de cargar la imagen de URL)
                AsyncImage(url: URL(string: "\(APIService.baseURL)/img/\(work.image)")) { phase in
                   switch phase {
                   case .empty:
                       // Cuando la imagen aún se está cargando
                       ProgressView()
                           .progressViewStyle(CircularProgressViewStyle())
                   case .success(let image):
                       // Imagen cargada exitosamente
                       image.resizable()
                           .scaledToFit()
                           .frame(width: 200, height: 200)
                   case .failure:
                       // Si hubo un error al cargar la imagen
                       Image(systemName: "exclamationmark.triangle.fill")
                           .resizable()
                           .frame(width: 200, height: 200)
                           .foregroundColor(.red)
                   @unknown default:
                       EmptyView()
                   }
               }
                
                //Informacion de la pintura
                VStack(alignment: .leading) {
                    Text(work.title)
                        .font(.headline)
                    Text(work.dimension)
                        .font(.headline)
                    Text("Técnica: \(work.technique)")
                        .font(.subheadline)
                    
                    
                }
            }
            .background(Color.white)
            .cornerRadius(10)
            .shadow(radius: 5)
            .clipped()
            
        }
}
