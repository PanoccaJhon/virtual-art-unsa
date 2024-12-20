//
//  GalleryMapView.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import SwiftUI

struct GalleryMapView: View {
    var title: String = "GALERIA X"
    
    var body: some View {
        VStack{
            HStack{
                Text("Centro Cultural - UNSA")
                Spacer()
            }
            VStack{
                Text("\(title)")
                ZStack{
                    GaleriaShape(cornerRadius: 10)
                        .frame(width: .infinity,height: 300)
                }
            }
            
        }
    }
}

