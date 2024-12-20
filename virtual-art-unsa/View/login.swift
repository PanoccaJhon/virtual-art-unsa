//
//  login.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/12/24.
//

import SwiftUI

struct login: View {
//    @Binding var isloggedin:Bool
    @State private var nombre=""
    var body: some View {
        VStack {
           
            
            Text("Correo Electronico")
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("Escribe tu direccion de correo", text: $nombre)
                .textFieldStyle(.roundedBorder)
            
            Text("Contraseña")
                .frame(maxWidth: .infinity, alignment: .leading)
            SecureField("Escribe tu contraseña", text: $nombre)
                .textFieldStyle(.roundedBorder)
            
            Button(action: {
                btnRegister()
            }){
                Text("Registrarse")
                    .font(.system(size: 18, weight:  .medium))
                    .foregroundColor(.white)
                    .padding(.vertical , 10)
                    .padding(.horizontal, 10)
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding()
            
            Button(action:{
                
            }){
                Text("Olvide mi contraseña")
            }
            
            Text("- O continua con -")
                .foregroundColor(.gray)
            
            HStack{
                Button(action: {
                    print("Google")
                }){
                    
                    HStack{
                        Image("google")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Google")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(30)
                }
                
                Button(action: {
                    print("Facebook")
                }){
                    
                    HStack{
                        Image("facebook")
                            .resizable()
                            .frame(width: 20, height: 20)
                        Text("Facebook")
                            .font(.system(size: 16))
                            .foregroundColor(.gray)
                    }
                    .padding()
                    .background(Color.pink.opacity(0.2))
                    .cornerRadius(30)
                }
                HStack{
                    Text("Creaa una cuenta")
                        .foregroundColor(.black)
                    Button(action:{
                        
                    }){
                        Text("Registrate")
                            .foregroundColor(Color.red)
                    }
                }
                .padding()            }.padding()
        }
        .padding()
    }
    func btnRegister(){
       
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
