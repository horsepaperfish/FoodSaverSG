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
        VStack{
            Text("Hello World")
        }
        .navigationBarTitle(article.title)
    }
}

