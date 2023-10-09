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
            
            WatchlistView()
                .tabItem{
                    Image(systemName: "bookmark")
                    Text("Watch List")
                }
        }
    }
}



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieTabView()
//    }
//}
