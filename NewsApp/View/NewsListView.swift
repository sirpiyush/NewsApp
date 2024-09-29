//
//  ContentView.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import SwiftUI
import CoreData

struct NewsListView: View {
    @StateObject private var viewModel = NewsListViewModel()
    var body: some View {
        NavigationView {
            ZStack{
                if viewModel.newsList.isEmpty {
                    ProgressView {
                        Text("Loading...")
                    }
                }else {
                    List(viewModel.newsList) {news in
                        NavigationLink {
                            NewsDetail(article: news)
                        } label: {
                            Card(title: news.title, description: news.description, imageURL: news.urlToImage)
                        }
                    }
                }
            }
            .onAppear{
                 viewModel.getNewsList()
             }
             .navigationBarTitle("Top Headlines")
        }
    }
}

#Preview {
    NewsListView()
}



