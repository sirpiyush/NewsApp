//
//  SearchViewModel.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//

import UIKit
import Combine

class SearchViewModel: ObservableObject {
    @Published var newsList: [Article] = []
    private var cancellables = Set<AnyCancellable>()
    
    //Used debounce if searching text once user type
    /*@Published var searchText: String = ""
    init() {
        setupSearch()
    }
    
    func setupSearch() {
        // Observe changes to searchText and debounce the input
        $searchText
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main) // Add debounce to delay the API call
            .removeDuplicates() // Only trigger when the text actually changes
            .sink { [weak self] text in
                self?.performSearch(query: text)
            }
            .store(in: &cancellables)
    }
    */
    
    func performSearch(query: String) {
        guard !query.isEmpty else {
            newsList = []
            return
        }
        
        let urlRequest = Api.getURLRequest(.newslist(queryParam: "&country=us&category=\(query)"))()!
        
        let publisher:AnyPublisher<NewsResponse,Error> = HTTPClient.shared.getData(urlRequest: urlRequest)
        
        publisher
            .map(\.articles)
            .receive(on: RunLoop.main)
            .sink { completion in
            switch completion {
            case .finished:
                ()
            case .failure(let error):
                print(error)
            }
        } receiveValue: {[weak self] articles in
            self?.newsList = articles
        }.store(in: &cancellables)
    }
}
