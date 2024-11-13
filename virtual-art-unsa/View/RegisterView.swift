//
//  RegisterView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//
import SwiftUI

struct RegisterView: View {
    @State private var nombre=""
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Nombre")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Escribe tu nombre", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                
                Text("Correo Electronico")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Escribe tu direccion de correo", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                
                Text("Contraseña")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Escribe una contraseña", text: $nombre)
                    .textFieldStyle(.roundedBorder)
                Text("Confirme la contraseña")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Vuelve a escribir la contraseña", text: $nombre)
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
                HStack{
                    Text("¿Ya tienes cuenta?")
                        .foregroundColor(.black)
                    Button(action:{
                        
                    }){
                        Text("Inicia Sesion")
                    }
                }
                .padding()
                
                
                
            }
            .padding()
            .navigationTitle("Registrarse")
        }
    }
    func btnRegister(){
        
    }
}

