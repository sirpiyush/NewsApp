//
//  ContentView.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 25/09/24.
//

import SwiftUI
import CoreData

struct NewsListView: View {
    /*@Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>*/
    
    @StateObject private var viewModel = NewsListViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.newsList) {news in
                NavigationLink {
                    NewsDetail(article: news)
                } label: {
                    Card(title: news.title, description: news.description, imageURL: news.urlToImage)
                }
            }.onAppear{
                viewModel.getNewsList()
            }
            .navigationBarTitle("Top Headlines")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    NewsListView()
}



