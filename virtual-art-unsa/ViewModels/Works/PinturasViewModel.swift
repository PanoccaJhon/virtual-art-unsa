//
//  PinturasViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 11/13/24.
//

import Foundation
import Combine

class PinturasViewModel: ObservableObject {
    @Published var works: [Work] = []
    @Published var currentPage: Int = 0
    let limit: Int = 5  // Elementos por página
    var cancellables = Set<AnyCancellable>()
    
    func fetchPaintings() {
        let urlString = "\(APIService.baseURL)/works?offset=\(currentPage * limit)&limit=\(limit)"
                guard let url = URL(string: urlString) else { return }
                
                URLSession.shared.dataTaskPublisher(for: url)
                    .map { $0.data }
                    .decode(type: WorkResponse.self, decoder: JSONDecoder())
                    .receive(on: DispatchQueue.main)
                    .sink(receiveCompletion: { completion in
                        if case .failure(let error) = completion {
                            print("Error fetching paintings: \(error)")
                        }
                    }, receiveValue: { response in
                        DispatchQueue.main.async {
                            self.works = response.data
                        }
                        
                    })
                    .store(in: &cancellables)
        
    }
    
    func nextPage() {
        currentPage += 1
        fetchPaintings()
    }
    
    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
            fetchPaintings()
        }
    }
}
