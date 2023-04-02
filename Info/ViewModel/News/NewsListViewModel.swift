//
//  NewsListViewModel.swift
//  Infos
//
//  Created by Михаил Зиновьев on 29.03.2023.
//

import SwiftUI

class NewsListViewModel: BaseViewModel {
    
    private enum Constants {
        static let sthWentWrongErrorMessage = "Ой, что-то пошло не так"
        static let minSearchCharactersCount = 1
        static let searchDelayTimeInterval: DispatchTimeInterval = .milliseconds(500)
        static let defaultSearchText = "Недавнее"
    }
    
    @Published var articles: [ArticleListObject] = []
    @Published var isSearchEnabled: Bool = false
    @Published var searchText: String = "" {
        didSet {
            newsWorkItem?.cancel()
//            isSearchEnabled = (searchText.count > Constants.minSearchCharactersCount)
            performSearch()
        }
    }
    
    private let networkManager: NewsManaging
    
    private var newsWorkItem: DispatchWorkItem?
    
    private var totalResults: Int = 0
    
    // MARK: Init
    init(networkManager: NewsManaging) {
        self.networkManager = networkManager
    }
    
    func selectNews(by index: Int) {
        guard articles.count > index else { return }
        //        selectNewsHandler?(articles[index])
    }
    
    func resetSearch() {
        searchText.removeAll()
        makeSearch(for: Constants.defaultSearchText)
    }
    
    func performSearch() {
        makeSearch(for: searchText)
    }

}

// MARK: Private
private extension NewsListViewModel {
    
    func makeSearch(for text: String) {
        guard text.count > Constants.minSearchCharactersCount else {
            isSearchEnabled = false
            return
        }
        let workItem = DispatchWorkItem { [weak self] in
            self?.getNews(for: text)
        }
        isSearchEnabled = true
        newsWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + Constants.searchDelayTimeInterval, execute: workItem)
    }

    func getNews(for text: String) {
        networkManager.requestNews(query: text) { [weak self] result in
            switch result {
            case .success(let value):
                self?.articles = value.articles.map {ArticleListObject(article: $0)}
                self?.totalResults = value.totalResults
                self?.isSearchEnabled = false
            case .failure(let error):
                print("error: \(error.localizedDescription)")
                self?.isSearchEnabled = false
            }
        }
    }
}

