//
//  ExhibitionDetail.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import SwiftUI

struct ExhibitionDetailView: View {
    let id: Int
    @StateObject var viewModel = ExhibitionDetailViewModel()
    var body: some View {
        
        ScrollView{
            if let item = viewModel.exhibition {
                VStack{
                    Text("\(item?.name ?? "")")
                        .font(Font.custom( "OldStandardTT-Bold", size:22))
                        .foregroundColor(Color(hex: "272727"))
                        .padding(.bottom, 10)
                        .padding(.top, 10)
                    HStack {
                        VStack(alignment: .leading){
                            Text("Artista")
                                .font(Font.custom( "OldStandardTT-Regular", size:14))
                                .foregroundColor(Color(hex: "686868"))
                                .padding(.top, 10)
                            Text("\(item?.artistname ?? "") \(item?.artistlastname ?? "")")
                                .font(Font.custom( "OldStandardTT-Bold", size:16))
                                .foregroundColor(Color(hex: "474747"))
                                .padding(.bottom, 8)
                            Text("Ubicación")
                                .font(Font.custom( "OldStandardTT-Regular", size:14))
                                .foregroundColor(Color(hex: "686868"))
                                .padding(.top, 10)
                            Text("\(item?.gallery ?? "")")
                                .font(Font.custom( "OldStandardTT-Bold", size:16))
                                .foregroundColor(Color(hex: "474747"))
                                .padding(.bottom, 8)
                            Text("Periodo")
                                .font(Font.custom( "OldStandardTT-Regular", size:14))
                                .foregroundColor(Color(hex: "686868"))
                                .padding(.top, 10)
                            Text("\(item?.period ?? "")")
                                .font(Font.custom( "OldStandardTT-Bold", size:16))
                                .foregroundColor(Color(hex: "474747"))
                                .padding(.bottom, 8)
                            Text("Descripción")
                                .font(Font.custom( "OldStandardTT-Regular", size:14))
                                .foregroundColor(Color(hex: "686868"))
                                .padding(.top, 10)
                            Text("\(item?.description_text ?? "")")
                                .font(Font.custom( "OldStandardTT-Bold", size:16))
                                .foregroundColor(Color(hex: "474747"))
                                .padding(.bottom, 8)
                        }
                        .padding(15)
                        Spacer()
                    }
                    VStack{
                        Text("Imagenes")
                    }
                }
            }
        }
        .onAppear(){
            viewModel.fetchExhibition(exhibitionId: id)
        }
    }
}

