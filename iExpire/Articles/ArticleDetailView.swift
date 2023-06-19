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
            Text(article.content)
                .padding()
            
            Spacer()
            
        }
        .navigationBarTitle(article.title)
    }
}
//
//struct ArticleDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ArticleDetailView(article: <#Article#>)
//    }
//}
