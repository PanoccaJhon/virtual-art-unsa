//
//  PinturaView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/12/24.
//

import SwiftUI

struct Cuadro: Identifiable {
    let id: Int
    let nombre: String
    let imagen: String
}

struct PinturaView: View {
    @State private var cuadros: [Cuadro] = []
    
    var body: some View {
        VStack {
            Text("Galería de Cuadros")
                .font(.largeTitle)
                .padding()
            
            List(cuadros) { cuadro in
                HStack {
                    Image(cuadro.imagen)
                        .resizable()
                        .frame(width: 50, height: 50)
                        .cornerRadius(8)
                    
                    Text(cuadro.nombre)
                }
            }
            
            Button(action: {
                cargarCuadrosRapidos { cuadrosCargados in
                    self.cuadros = cuadrosCargados
                }
                cargarCuadroAsincronamente(id: 3) { cuadroCargado in
                    self.cuadros.append(cuadroCargado)
                }
            }) {
                Text("Cargar Cuadros")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
    
    func cargarCuadrosRapidos(completar: ([Cuadro]) -> Void) {
        let cuadros = [
            Cuadro(id: 1, nombre: "Cuadro 1", imagen: "imagen1"),
            Cuadro(id: 2, nombre: "Cuadro 2", imagen: "imagen2")
        ]
        completar(cuadros)
    }
    
    func cargarCuadroAsincronamente(id: Int, completion: @escaping (Cuadro) -> Void) {
        DispatchQueue.global().async {
            sleep(2)
            let cuadro = Cuadro(id: id, nombre: "Cuadro Asíncrono", imagen: "imagen3")
            
            DispatchQueue.main.async {
                completion(cuadro)
            }
        }
    }
}
