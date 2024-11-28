//
//  LoginView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//


import SwiftUI

struct LoginView: View {

    @StateObject private var userLogin = LoginViewModel()
    @State private var errorMessage: String? = nil
    @State private var navigateToRegistry: Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Text("Correo Electronico")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextField("Escribe tu direccion de correo", text: $userLogin.email)
                    .textFieldStyle(.roundedBorder)
                
                Text("Contraseña")
                    .frame(maxWidth: .infinity, alignment: .leading)
                SecureField("Escribe tu contraseña", text: $userLogin.password)
                    .textFieldStyle(.roundedBorder)
                
                Button(action:{
                    
                } ){
                    Text("Iniciar Sesión")
                        .font(.system(size: 18, weight:  .medium))
                        .foregroundColor(.white)
                        .padding(.vertical , 10)
                        .padding(.horizontal, 10)
                        .background(Color.red)
                        .cornerRadius(10)
                }
                .padding()
                // Si hay un mensaje de error, lo mostramos
                if let message = errorMessage {
                    Text(message)
                        .foregroundColor(.red)
                        .padding()
                }
                
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
                    
                }.padding()
                HStack{
                    Text("Crea una cuenta")
                        .foregroundColor(.black)
                    Button(action:{
                        self.navigateToRegistry = true
                    }){
                        Text("Registrate")
                            .foregroundColor(Color.red)
                    }
                    .background(
                        NavigationLink(
                            destination: RegisterView(isPresented: $navigateToRegistry),
                            isActive: $navigateToRegistry,
                            label: { EmptyView() }
                        )
                    )
                }
                .padding()
            }
            .padding()
            .navigationTitle("Iniciar Sesión")
        }
        
    }
    
    func btnLogin() async {
        let success = await userLogin.login()
        
        if success {
            
        }else {
            //Mostrar error
            
        }
    }
    
    func btnGoogle(){
        
    }
}


