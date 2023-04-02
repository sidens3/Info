//
//  NewsListView.swift
//  Info
//
//  Created by Михаил Зиновьев on 02.04.2023.
//

import SwiftUI
import Kingfisher

struct NewsListView: View {
    @State var article: Article
    
    var body: some View {
        HStack {
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60, alignment: .center)
                .clipShape(RoundedRectangle(cornerRadius: 16))
                .padding(.trailing, 16)
            Text(article.title)
                .foregroundColor(.primary)
                .fontWeight(.regular)
                .multilineTextAlignment(.leading)
                .textSelection(.disabled)
        }.padding(.init(top: 8,
                        leading: 16,
                        bottom: 8,
                        trailing: 16))
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView(article: Article.getDefault())
    }
}
