//
//  CountriesViewModel.swift
//  Info
//
//  Created by Михаил Зиновьев on 09.06.2022.
//

import SwiftUI

class CountriesViewModel: BaseViewModel {
    var imageUrl: URL? = nil
    @Published var isSearchEnabled: Bool = false
    @Published var searchText: String = "" {
        didSet { isSearchEnabled = (searchText.count > 1) }
    }
    
    func performSearch() {
        updateImageUrl(by: searchText)
    }
    
    private func updateImageUrl(by country: String) {
        imageUrl = URL(string: "https://countryflagsapi.com/png/\(country)")
    }
}
