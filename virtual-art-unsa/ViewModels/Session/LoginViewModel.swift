//
//  LoginViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation

@MainActor
class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage: String?
    
    public static func checkIfUserIsAuthenticated() -> Bool {
        // Recuperar el estado de autenticación de UserDefaults
        let storedEmail = UserDefaults.standard.string(forKey: "user_email")
        let storedPassword = UserDefaults.standard.string(forKey: "user_password")

        // Si el correo y la contraseña coinciden con los almacenados, el usuario está autenticado
        if let _ = storedEmail, let _ = storedPassword{
            return true
        } else {
            return false
        }
    }
    
    // Función para realizar el login
    public func login() async ->Bool{
        // Validar que los campos no estén vacíos
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Por favor, completa todos los campos."
            return false
        }
        // Consular base de datos
        do {
            let params = [
                "email":self.email,
                "password": self.password
            ]
            // Llamar a la función genérica, esperando una respuesta de tipo LoginResponse
            let loginResponse: LoginResponse = try await APIService.shared.getRequestWithParams(endpoint: "login", params: params)
            
            if(!loginResponse.exists){
                return false
            }
        }catch{
            errorMessage = "No se pudo verificar usuario "
            return false
        }
        

        // Guardar los datos del usuario en UserDefaults
        UserDefaults.standard.set(email, forKey: "user_email")
        UserDefaults.standard.set(password, forKey: "user_password")
            
        // Establecer que el usuario está autenticado
        errorMessage = nil
        
        return true
    }

    // Función para cerrar sesión
    static func logout() {
        // Eliminar los datos del usuario de UserDefaults
        UserDefaults.standard.removeObject(forKey: "user_email")
        UserDefaults.standard.removeObject(forKey: "user_password")
            
    }
}
