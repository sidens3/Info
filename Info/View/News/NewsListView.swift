//
//  NewsListView.swift
//  Info
//
//  Created by Михаил Зиновьев on 02.04.2023.
//

import SwiftUI
import Kingfisher

struct NewsListView: View {
    @Binding var data: ArticleListObject
    
    var body: some View {
        HStack {
            KFImage(URL(string: data.article.urlToImage ?? ""))
                .placeholder {
                    Image("placeholder")
                        .resizable()
                        .scaledToFit()
                }
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .cornerRadius(16)
                .padding(.trailing, 16)
            Text(data.article.title)
                .foregroundColor(.primary)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .textSelection(.disabled)
        }
    }
}

struct NewsListView_Previews: PreviewProvider {

    static var previews: some View {
        StatefulPreviewWrapper(ArticleListObject(article: Article.getDefault())) { NewsListView(data: $0 ) }
    }
}
