//
//  RootView.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//
import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            NewsListView()
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
            
            BookmarkView()
                .tabItem {
                    Image(systemName: "bookmark.fill")
                    Text("Bookmarks")
                }
        }
    }
}

#Preview {
    RootView()
}
