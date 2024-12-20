//
//  MapView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct MapView: View {
    @Binding var selectedTab: TabModel
    var body: some View {
        ZStack{
            // Galeria 1
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 1")
                }
                .frame(width: 200, height: 100)
                .position(x:110, y:600)
            Text("Galeria I")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:110 ,y:600)
            //Puerta 1
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 50, height: 20)
                .position(x:160,y:550)
            //GAleria 2
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 2")
                }
                .frame(width: 100, height: 130)
                .position(x:60, y:480)
            Text("Galeria II")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:60 ,y:480)
            //Puerta 2
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 20, height: 50)
                .position(x:110,y:480)
            //Galeria 3
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 3")
                }
                .frame(width: 200, height: 100)
                .position(x:110, y:355)
            Text("Galeria III")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:160 ,y:350)
            //Puerta 3
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 50, height: 20)
                .position(x:160,y:400)
            //Galeria 5
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 5")
                }
                .frame(width: 100, height: 130)
                .position(x:60, y:230)
            Text("Galeria V")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:60 ,y:230)
            //Puerta 5
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 20, height: 50)
                .position(x:110,y:230)
            // Galeria 6
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 6")
                }
                .frame(width: 200, height: 100)
                .position(x:110, y:107)
            Text("Galeria VI")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:160 ,y:107)
            // Puerta 6
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 50, height: 20)
                .position(x:160,y:153)
            
            //Galleria 4
            GaleriaShape(cornerRadius: 10)
                .fill(Color.gray.opacity(0.4))
                .onTapGesture {
                    print("Gal 4")
                }
                .frame(width: 100, height: 580)
                .position(x:350, y:360)
            Text("Galeria IV")
                .font(Font.custom( "OldStandardTT-Regular", size:15))
                .position(x:350 ,y:480)
            //Puerta 4
            GaleriaShape(cornerRadius: 10)
                .fill(Color.green)
                .frame(width: 20, height: 50)
                .position(x:300,y:480)
            
            //Puerta general
            GaleriaShape(cornerRadius: 2)
                .fill(Color.red)
                .frame(width: 110, height: 40)
                .position(x:255 ,y: 630)
            //Calle
            Text("Calle Santa Catalina")
                .font(Font.custom( "OldStandardTT-Regular", size:20))
                .position(x:220 ,y:690)
            //Flecha
            Image(systemName: "arrow.up")
                .font(Font.custom( "OldStandardTT-Bold", size:30))
                .foregroundColor(.gray)
                .position(x:250,y:550)
        }
    }
}

struct GaleriaShape: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect:CGRect) -> Path {
        var path = Path()
        path.addRoundedRect(in: rect, cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        
        return path
    }
}

