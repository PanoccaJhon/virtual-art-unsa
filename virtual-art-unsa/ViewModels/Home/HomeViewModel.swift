//
//  HomeViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/18/24.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var worksImages: [RandomWorkImage] = []
    @Published var exhibitionImages: [String] = []
    
    func fetchImages(){
        let urlString = "\(APIService.baseURL)/random-works-images"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: RandomWorksResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching paintings: \(error)")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.worksImages = response.data
                }
                
            })
            .store(in: &cancellables)
    }
    
}
