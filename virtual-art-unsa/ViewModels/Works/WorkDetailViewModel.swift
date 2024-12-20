//
//  WorkDetailViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import Foundation
import Combine

class WorkDetailViewModel: ObservableObject {
    @Published var work: WorkDetail??
    var cancellables = Set<AnyCancellable>()
    
    func fetchWork(workId:Int){
        let urlString = "\(APIService.baseURL)/works/\(workId)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: WorkDetailResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching paintings: \(error)")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.work = response.data
                }
                
            })
            .store(in: &cancellables)
    }
}
