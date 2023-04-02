//
//  NewsListScreenView.swift
//  Info
//
//  Created by Михаил Зиновьев on 02.04.2023.
//

import SwiftUI

struct NewsListScreenView: View {
    
    @StateObject var viewModel: NewsListViewModel
    
    init(viewModel: NewsListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                LoadingView(isShowing: $viewModel.isSearchEnabled) {
                    List {
                        ForEach($viewModel.articles) { data in
                            NewsListView(data: data)
                        }
                    }.resignKeyboardOnDragGesture()
                }
            }.onViewDidLoad {
                viewModel.resetSearch()
            }
            .searchable(text: $viewModel.searchText, prompt: "Ваш запрос")
//            .navigationTitle("Новости") // TODO: nav title destroy tabBar presentation
//            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct NewsListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreenView(viewModel: NewsListViewModel(networkManager: NetworkManager.shared))
    }
}
