//
//  WatchlistViewModel.swift
//  MovieDatabase
//
//  Created by Ivan Trajanovski on 09.10.23.
//

import Foundation

final class WatchlistViewModel: ObservableObject {
    @Published var watchlist = Watchlist()
    @Published var isShowingDetail = false

    func addMovieToWatchlist(movie: Movie) {
        watchlist.movies.append(movie)
    }

    func removeMovieFromWatchlist(movie: Movie) {
        if let index = watchlist.movies.firstIndex(where: { $0.id == movie.id }) {
            watchlist.movies.remove(at: index)
        }
    }
}
