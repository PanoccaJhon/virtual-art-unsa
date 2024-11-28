//
//  RegisterView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//
import SwiftUI

struct RegisterView: View {
    @Binding var isPresented: Bool
    @StateObject private var userReg = UserViewModel()
    
    var body: some View {
        NavigationView{
            VStack {
                Text("Nombre")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Escribe tu nombre", text: $userReg.name)
                    .textFieldStyle(.roundedBorder)
                
                Text("Correo Electronico")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Escribe tu direccion de correo", text: $userReg.email)
                    .textFieldStyle(.roundedBorder)
                Text("Celular")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Ingrese su número de celular", text: $userReg.phone)
                    .textFieldStyle(.roundedBorder)
                Text("Contraseña")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Escribe una contraseña", text: $userReg.password)
                    .textFieldStyle(.roundedBorder)
                Text("Confirme la contraseña")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Vuelve a escribir la contraseña", text: $userReg.password)
                    .textFieldStyle(.roundedBorder)
                Spacer()
                Button(action: {
                    Task{
                        await userReg.createUser()
                    }
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
                        self.isPresented = false
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

