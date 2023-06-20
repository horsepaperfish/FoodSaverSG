//
//  ArticleDetailView.swift
//  iExpire
//
//  Created by Ma Zhiyu on 19/6/23.
//

import SwiftUI

struct ArticleDetailView: View {

    let article: Article
    
    var body: some View {
        ScrollView {
            VStack{
                Text(article.title)
                    .font(.headline)
                    .frame(width: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                Image(article.picture)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, alignment: .center)
                Text(article.content)
                    .frame(width: .infinity, alignment: .leading)
            }
            .padding(20)
        }
      //  .navigationBarTitle(article.title)
    }
}

