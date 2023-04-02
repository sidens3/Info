//
//  CountriesScreenView.swift
//  Info
//
//  Created by Михаил Зиновьев on 09.06.2022.
//

import SwiftUI
import Kingfisher

struct CountriesScreenView: View {
    
    @StateObject var viewModel: CountriesViewModel
    
    init(viewModel: CountriesViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            TextField("Search", text: $viewModel.searchText)
                .textFieldStyle(.roundedBorder)
                .padding(16)
                .onSubmit {
                    viewModel.performSearch()
                }
            
            Spacer()
            KFImage(viewModel.imageUrl)
                .placeholder {
                    ZStack {
                        
                        Image(systemName: "arrow.down.doc.fill")
                        .symbolRenderingMode(.monochrome)
                        .foregroundColor(Color.accentColor)
                        .font(.system(size: 16, weight: .regular))
                    }
                }
                .background(.secondary)
                .cornerRadius(8)
                .padding(16)
                .frame(width: UIScreen.main.bounds.width - 32,
                       height: UIScreen.main.bounds.height / 3,
                       alignment: .center)
            Spacer()
            
            Button {
                viewModel.performSearch()
            } label: {
                Text("Search ")
                    .font(.title2)
                    .frame(
                        maxWidth: UIScreen.main.bounds.width - 32,
                        maxHeight: 44,
                        alignment: .center)
            }
            .buttonStyle(.bordered)
            .disabled(!viewModel.isSearchEnabled)
            .padding( 16)

        }.navigationTitle("Flags")
            .background(Color(uiColor: .systemBackground))
    }
}

struct CountriesScreen_Previews: PreviewProvider {
    static var previews: some View {
        CountriesScreenView(viewModel: CountriesViewModel())
    }
}
