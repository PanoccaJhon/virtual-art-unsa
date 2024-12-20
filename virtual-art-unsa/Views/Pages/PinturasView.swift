//
//  PinturasView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct PinturasView: View {
    @StateObject var viewModel = PinturasViewModel()
    @Binding var selectedTab: TabModel
    var body: some View {
        NavigationView(){
            ZStack{
                ScrollView {
                    VStack{
                        HStack{
                            Text("Pinturas")
                                .font(Font.custom( "OldStandardTT-Bold", size:34))
                                .foregroundColor(Color(hex: "474747"))
                            Spacer()
                        }
                        VStack(spacing: 15){
                            ForEach(viewModel.works) { work in
                                NavigationLink(destination: WorkDetailView(workId: work.id)) {
                                    WorkCard(work: work)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                }
                .padding(20)
                .onAppear {
                    viewModel.fetchPaintings()
                }
                VStack {
                    Spacer()
                    HStack {
                        Image(systemName: "arrow.left")
                            .foregroundColor(.indigo)
                            .font(Font.custom( "OldStandardTT-Bold", size:20))
                            .frame(width: 50, height: 50)
                            .background(.white)
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.5), radius: 4, x:3,y:3)
                            .onTapGesture {
                                    viewModel.previousPage()
                            }
                            .disabled(viewModel.currentPage == 0)  // Deshabilita cuando no hay página anterior
                        
                        Spacer()
                        
                        Image(systemName: "arrow.right")
                            .foregroundColor(.purple)
                            .font(Font.custom( "OldStandardTT-Bold", size:20))
                            .frame(width: 50, height: 50)
                            .background(.white)
                            .cornerRadius(25)
                            .shadow(color: .black.opacity(0.5), radius: 4, x:3,y:3)
                            .onTapGesture {
                                    viewModel.nextPage()
                            }
                    }
                    .padding(.bottom, 150)
                    .padding(.horizontal, 20)
                }
                
                
            }
            .navigationTitle("Pinturas")
            .navigationBarHidden(true)
            
        }
        
    }
}

