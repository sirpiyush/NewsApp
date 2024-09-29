//
//  NewsDetail.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//
import SwiftUI
struct NewsDetail:View {
    @Environment(\.managedObjectContext) var moc
    let article:Article?
    var body: some View {
        ZStack {
            WebView(urlString: article?.url ?? "")
                .navigationTitle(article?.title ?? "")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing) {
                        Button {
                            save()
                        } label: {
                            Image(systemName: "bookmark.fill")
                        }
                        
                    }
                }
        }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func save(){
        let article = Bookmark(context: moc)
        article.id = self.article?.id
        article.title = self.article?.title
        article.url = self.article?.url
        try? moc.save()
    }
}

#Preview {
    NewsDetail(article: nil)
}
