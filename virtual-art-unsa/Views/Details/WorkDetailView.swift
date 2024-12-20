//
//  WorkDetailView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct WorkDetailView: View {
    let workId: Int
    @StateObject var workViewModel = WorkDetailViewModel()

        var body: some View {
            ScrollView{
                if let work = workViewModel.work {
                    VStack{
                        ZStack{
                            AsyncImage(url: URL(string: "\(APIService.baseURL)/img/\(work?.image ?? "")")) { phase in
                                switch phase {
                                case .empty:
                                    // Cuando la imagen aún se está cargando
                                    ProgressView()
                                        .progressViewStyle(CircularProgressViewStyle())
                                case .success(let image):
                                    // Imagen cargada exitosamente
                                    image.resizable()
                                        .scaledToFill()
                                        .frame(width: 300, height: 300)
                                        .cornerRadius(150)
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
                        }
                        VStack{
                            Text("\(work?.title ?? "")")
                                .font(Font.custom( "OldStandardTT-Bold", size:22))
                                .foregroundColor(Color(hex: "272727"))
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            HStack{
                                VStack(alignment: .leading){
                                    Text("Artista")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 10)
                                    Text("\(work?.artistname ?? "") \(work?.artistslastname ?? "")")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                        .padding(.bottom, 8)
                                    
                                    Text("Ubicación")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 8)
                                    Text("\(work?.exhibition ?? "")")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                    Text("\(work?.gallery ?? "")")
                                        .font(Font.custom( "OldStandardTT-Regular", size:15))
                                        .foregroundColor(Color(hex: "383838"))
                                        .padding(.bottom, 8)
                                    
                                    Text("Técnica")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 8)
                                    Text("\(work?.technique ?? "")")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                        .padding(.bottom, 8)
                                    
                                    Text("Dimensiones")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 8)
                                    Text("\(work?.dimension ?? "")")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                        .padding(.bottom, 8)
                                    
                                    Text("Año")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 8)
                                    Text("\(work?.year ?? 0)")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                        .padding(.bottom, 8)
                                    
                                    Text("Descripción")
                                        .font(Font.custom( "OldStandardTT-Regular", size:14))
                                        .foregroundColor(Color(hex: "686868"))
                                        .padding(.top, 8)
                                    Text("\(work?.description ?? "")")
                                        .font(Font.custom( "OldStandardTT-Bold", size:16))
                                        .foregroundColor(Color(hex: "474747"))
                                        .padding(.bottom, 8)
                                }
                                .padding(10)
                                Spacer()
                            }
                            
                        }
                        Spacer()
                        
                    }
                    .padding(15)
                } else {
                    Text("No hay detalles de trabajo disponibles.")
                }
                
                
            }
            .onAppear{
                workViewModel.fetchWork(workId: workId)
            }
        }
}
