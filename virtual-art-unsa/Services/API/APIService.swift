//
//  APIService.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//
import Foundation

class APIService {
    static let shared = APIService() // Singleton para reutilizar el servicio
    
    static public let baseURL = "https://danp-deploy-production.up.railway.app/api"

    
    private init() {} // Evita la inicialización externa
    
    // Función para realizar una solicitud GET con parámetros
    func getRequestWithParams<T: Decodable>(endpoint: String, params: [String: String]) async throws -> T {
        var urlComponents = URLComponents(string: "\(APIService.baseURL)/\(endpoint)")
        
        // Convertir el diccionario de parámetros a una lista de query items
        urlComponents?.queryItems = params.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        // Asegurarse de que la URL esté correctamente formateada
        guard let url = urlComponents?.url else {
            throw URLError(.badURL)
        }
        
        // Crear la solicitud GET
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Realizar la solicitud y obtener la respuesta
        let (data, response) = try await URLSession.shared.data(for: request)
        
        // Verificar si la respuesta fue exitosa (código 200)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        // Decodificar la respuesta en el tipo genérico T
        let decoder = JSONDecoder()
        
        // Intenta decodificar los datos de la respuesta en el tipo esperado T
        do {
            let decodedData = try decoder.decode(T.self, from: data)
            return decodedData
        } catch {
            throw URLError(.cannotDecodeContentData)
        }
    }
    
    // Función genérica para realizar una solicitud GET
    func fetchData<T: Decodable>(endpoint: String, type: T.Type) async throws -> T {
        guard let url = URL(string: "\(APIService.baseURL)/\(endpoint)") else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        
        return decodedData
    }
    
    // Función para manejar una solicitud POST
    func postData<T: Encodable, U: Decodable>(endpoint: String, payload: T, responseType: U.Type) async throws -> U {
        // Crear la URL
        guard let url = URL(string: "\(APIService.baseURL)/\(endpoint)") else {
            throw URLError(.badURL)
        }

        // Configurar la solicitud
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        // request.setValue("Bearer \(yourAuthToken)", forHTTPHeaderField: "Authorization") // Opcional: Autenticación

        do {
            // Codificar los datos del payload
            let encodedData = try JSONEncoder().encode(payload)
            
            request.httpBody = encodedData

            // Realizar la solicitud y capturar la respuesta
            let (data, response) = try await URLSession.shared.upload(for: request, from: encodedData)

            // Validar el código de respuesta HTTP
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                throw URLError(.badServerResponse)
            }

            // Decodificar la respuesta en el tipo esperado
            let decodedResponse = try JSONDecoder().decode(U.self, from: data)
            return decodedResponse

        } catch {
            print("Error al realizar la solicitud POST: \(error.localizedDescription)")
            throw error
        }
    }
}
