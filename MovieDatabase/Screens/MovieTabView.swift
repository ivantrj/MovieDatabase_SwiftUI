//
//  ContentView.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import SwiftUI

struct MovieTabView: View {
    var body: some View {
        TabView {
            MovieGridView()
                .tabItem {
                    Image(systemName: "popcorn")
                    Text("Movies")
                }
            
            SearchView()
                .tabItem{
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieTabView()
    }
}
