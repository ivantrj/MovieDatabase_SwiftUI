//
//  WatchlistView.swift
//  MovieDatabase
//
//  Created by Ivan Trajanovski on 09.10.23.
//

import SwiftUI

struct WatchlistView: View {
    @StateObject var viewModel = WatchlistViewModel()



    var body: some View {
        NavigationView {
            List(viewModel.watchlist.movies) { movie in
                NavigationLink(destination: MovieDetailView(movie: movie, isShowingDetail: $viewModel.isShowingDetail)) {
                    Text(movie.title)
                }
            }
            .navigationTitle("Watchlist")
        }
    }
}


//#Preview {
//    WatchlistView()
//}
