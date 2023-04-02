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
        VStack {
            TextField("Ваш запрос", text: $viewModel.searchText)
                .textFieldStyle(.roundedBorder)
                .padding(16)
                .onSubmit {
                    viewModel.performSearch()
                }
            LoadingView(isShowing: $viewModel.isSearchEnabled) {
                List {
                    Section {
                        ForEach($viewModel.articles) { article in
                            NewsListView(data: article)
                        }
                    }
                }.resignKeyboardOnDragGesture()
            }
        }.onViewDidLoad {
            viewModel.resetSearch()
        }
    }
}

struct NewsListScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreenView(viewModel: NewsListViewModel(networkManager: NetworkManager.shared))
    }
}
