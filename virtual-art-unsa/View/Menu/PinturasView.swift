//
//  PinturasView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct PinturasView: View {
    @StateObject var viewModel = PinturasViewModel()
    
    var body: some View {
        NavigationView(){
            VStack {
                ScrollView {
                    ForEach(viewModel.works) { work in
                        NavigationLink(destination: WorkDetailView(work: work)) {
                            WorkCard(work: work)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                
                HStack {
                    Text("Anterior")
                        .foregroundColor(viewModel.currentPage == 0 ? .gray : .blue)
                        .onTapGesture {
                                viewModel.previousPage()
                        }
                        .disabled(viewModel.currentPage == 0)  // Deshabilita cuando no hay página anterior
                    
                    Spacer()
                    
                    Text("Siguiente")
                        .foregroundColor(.blue)
                        .onTapGesture {
                            viewModel.nextPage()
                        }
                }
                .padding()
            }
            .onAppear {
                viewModel.fetchPaintings()
            }
            .navigationTitle("Trabajos")
            .navigationBarHidden(true)
        }
    }
}

