//
//  BookmarkView.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//

import SwiftUI

public struct BookmarkView: View {
    @FetchRequest(sortDescriptors: []) var articles: FetchedResults<Bookmark>
    @Environment(\.managedObjectContext) var moc
    public var body: some View {
        NavigationView {
            List{
                ForEach(articles) { news in
                    NavigationLink {
                        NewsDetail(article: news.getArticle())
                    } label: {
                        Card(title: news.title, description: news.desc, imageURL: news.urlToImage)
                    }
                }.onDelete(perform: deleteItems)
                
            }
            .navigationBarTitle("Bookmark")
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { articles[$0] }.forEach(moc.delete)
            do {
                try moc.save()
            } catch {
                let nsError = error as NSError
                print("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
