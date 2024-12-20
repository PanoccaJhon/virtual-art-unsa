//
//  WorkDetailView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct WorkDetailView: View {
    let work: Work

        var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                Text(work.title)
                    .font(.largeTitle)
                    .padding()

                Text("Año: \(work.year)")
                Text("Técnica: \(work.technique)")
                Text("Dimensiones: \(work.dimension)")
                Text("Descripción: \(work.description)")

                Spacer()
            }
            .padding()
            .navigationTitle("Detalle de Pintura")
        }
}
