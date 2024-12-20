//
//  ExhibitionsViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import Foundation
import Combine

class ExhibitionsViewModel: ObservableObject {
    @Published var exhibitions: [ExhibitionItem] = []
    @Published var currentPage: Int = 0
    let limit: Int = 5  // Elementos por página
    var cancellables = Set<AnyCancellable>()
    
    func fetchExhibitionImages(exhibitionId:Int?) -> [RandomWorkImage]? {
        var returnData:[RandomWorkImage]?
        let urlString = "\(APIService.baseURL)/works-images-exhibition/\(exhibitionId ?? 1)"
        guard let url = URL(string: urlString) else { return nil }
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
                    returnData = response.data
                }
                
            })
            .store(in: &cancellables)
        
        return returnData
    }
    
    func fetchExhibitionsList() {
        let urlString = "\(APIService.baseURL)/exhibitions-list?offset=\(currentPage * limit)&limit=\(limit)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ExhibitionsListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching exhibitions: \(error)")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.exhibitions = response.data
                }
                
            })
            .store(in: &cancellables)
    }
    func nextPage() {
        currentPage += 1
        fetchExhibitionsList()
    }
    
    func previousPage() {
        if currentPage > 0 {
            currentPage -= 1
            fetchExhibitionsList()
        }
    }
    
}
