//
//  MapGalleryViewModel.swift
//  virtual-art-unsa
//
//  Created by panocca on 12/19/24.
//

import Foundation
import Combine
class MapGalleryViewModel: ObservableObject {
    
    var id: Int?
    @Published var images: [ImageExhibition] = []
    var cancellables = Set<AnyCancellable>()
    
    func fetchImages(id:Int) {
        let urlString = "\(APIService.baseURL)/works-images-list/\(id)"
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .decode(type: ImagesExhibitionListResponse.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    print("Error fetching paintings: \(error)")
                }
            }, receiveValue: { response in
                DispatchQueue.main.async {
                    self.images = response.data
                }
                
            })
            .store(in: &cancellables)
    }
    
    
    
    
}
