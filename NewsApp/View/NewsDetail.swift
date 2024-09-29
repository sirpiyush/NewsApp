//
//  NewsDetail.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 28/09/24.
//
import SwiftUI
struct NewsDetail:View {
    @Environment(\.managedObjectContext) var moc
    @State var showingAlert:Bool = false
    @State var alertText:String = ""
//    var alertText:String{
//        showingAlert ?
//        "Your article has been saved" : "Sorry, article couldn't saved"
//    }
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
        .alert(alertText, isPresented: $showingAlert) {
                    Button("OK") { }
                }
        .navigationTitle("Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func save(){
        let article = Bookmark(context: moc)
        article.id = self.article?.id
        article.title = self.article?.title
        article.desc = self.article?.description
        article.urlToImage = self.article?.urlToImage
        article.url = self.article?.url
        article.publishedAt = self.article?.publishedAt
        if let _ = try? moc.save(){
            alertText = "Your article has been saved"
            showingAlert = true
        }else{
            alertText = "Sorry, article couldn't saved!"
            showingAlert = true
        }
    }
}

#Preview {
    NewsDetail(article: nil)
}
