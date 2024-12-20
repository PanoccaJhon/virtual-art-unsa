//
//  ExhibitionViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import Foundation
import Combine

class ExhibitionDetailViewModel: ObservableObject {
    @Published var exhibition: ExhibitionDetail??
    var cancellables = Set<AnyCancellable>()
    
    func fetchExhibition(exhibitionId:Int){
        let urlString = "\(APIService.baseURL)/exhibitions/\(exhibitionId)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ExhibitionDetailResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching paintings: \(error)")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.exhibition = response.data
                }
                
            })
            .store(in: &cancellables)
    }
}
