//
//  SplashView.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    @State private var opacity = 0.0

    var body: some View {
        VStack {
            if isActive {
                //if(LoginViewModel.checkIfUserIsAuthenticated()){
                //    ContentView()
                //}
                //LoginView()
                ContentView()
            } else {
                // El contenido de tu splash screen
                VStack {
                    Image(systemName: "text.below.photo") // Reemplaza con el logo de tu app
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(Color(hex:"686868"))
                    Text("Virtual Art UNSA")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color(hex:"484848"))
                }
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.5)) {
                        opacity = 1.0 // Animación de aparición
                    }
                    // Retraso antes de cambiar a ContentView
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                        withAnimation {
                            isActive = true
                        }
                    }
                }
            }
        }
    }
}
