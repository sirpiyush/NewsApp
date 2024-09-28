//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import Foundation
import Combine

class NewsListViewModel:ObservableObject {
    @Published var newsList: [Article] = []
    var cancellbale : Set<AnyCancellable> = []
    
    func getNewsList() {
        let urlRequest = Api.getURLRequest(.newslist(queryParam: "&country=us"))()!
        
        let publisher:AnyPublisher<NewsResponse,Error> = HTTPClient.shared.getData(urlRequest: urlRequest)
        
        publisher
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                print("Finished")
            case .failure(let error):
                print(error)
            }
        } receiveValue: {[weak self] response in
            if let self {
                self.newsList = response.articles
                print(self.newsList)
            }
        }.store(in: &cancellbale)
    }
    
}
