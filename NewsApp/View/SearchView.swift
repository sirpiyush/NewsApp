//
//  SearchView.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//


import SwiftUI

struct SearchView: View {
    @StateObject private var viewModel = SearchViewModel()
    @State var searchText: String = ""
    var body: some View {
        NavigationView {
            VStack {
                
                // Search Bar
                                TextField("Search news by category...", text: $searchText)
                                    .textFieldStyle(RoundedBorderTextFieldStyle())
                                    .padding()
                                    .onSubmit {
                                        viewModel.performSearch(query: searchText)
                                    }
                
                List(viewModel.newsList) {news in
                    NavigationLink {
                        NewsDetail(article: news)
                    } label: {
                        Text(news.title ?? "")
                    }
                }
                .navigationBarTitle("Search")
            }
        }
    }
}

#Preview {
    SearchView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
