//
//  Card.swift
//  NewsApp
//
//  Created by Dipendra Dubey on 29/09/24.
//

import SwiftUI
import Kingfisher

struct Card:View {
    let title:String?
    let description:String?
    let imageURL:String?
    var body: some View {
        VStack{
            if let imageURL {
                KFImage(URL(string: imageURL)!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
            }
            VStack {
                Text(title ?? "")
                    .font(.headline)
                    .lineLimit(1)
                
                Text(description ?? "")
                    .font(.subheadline)
            }
            
        }
    }
}
