//
//  ContentView.swift
//  Info
//
//  Created by Михаил Зиновьев on 07.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabSelection: Int = 0
    
    var body: some View {
        let tabView = TabView(selection: $tabSelection) {
            
            NewsListScreenView()
                .tag(0)
                .tabItem {
                    Image(systemName: "newspaper")
                    Text("News")
                }
            
            CountriesScreenView(viewModel: CountriesViewModel())
                .tag(1)
                .tabItem {
                    Image(systemName: "flag")
                    Text("Countries")
                }
        }
        return tabView
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
