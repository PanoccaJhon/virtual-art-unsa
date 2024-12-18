//
//  RegisterViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/28/24.
//

import Foundation

@MainActor
class UserViewModel: ObservableObject {
    // Propiedades de entrada
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var phone: String = ""
    @Published var password: String = ""
    @Published var photoURL: String = ""

    // Propiedades de estado
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    @Published var isRegistered: Bool = false

    // Método para enviar los datos a la API
    func createUser() async {
        isLoading = true
        errorMessage = nil

        // Crear el objeto `User`
        let user = User(
            id: 0, // Asumimos que el servidor genera el ID
            name: name,
            email: email,
            phone: phone,
            password: password,
            photoURL: photoURL
        )
        do {

            // Enviar la solicitud
            let response: User = try await APIService.shared.postData(endpoint: "users/create", payload: user, responseType: User.self)

            // Actualiza los estados según la respuesta
            print("Usuario registrado con éxito: \(response)")
            isRegistered = true
        } catch {
            errorMessage = "Error al registrar usuario: \(error.localizedDescription)"
        }

        isLoading = false
    }
}
