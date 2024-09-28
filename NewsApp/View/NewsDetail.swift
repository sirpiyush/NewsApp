//
//  NewsDetail.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//
import SwiftUI
struct NewsDetail:View {
    let article:Article?
    var body: some View {
        WebView(urlString: article?.url ?? "")
            .navigationTitle(article?.title ?? "")
    }
}

#Preview {
    NewsDetail(article: nil)
}
