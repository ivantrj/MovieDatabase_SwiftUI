//
//  MovieGridView.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var movieViewModel = MovieViewModel()
    @StateObject var viewModel = WatchlistViewModel()
    @State private var selectedMovie: Movie?


    
    var body: some View {
        ZStack {
            NavigationView {
                Group {
                    if movieViewModel.movies.isEmpty {
                        ProgressView("Loading Movies...")
                    } else {
                        ScrollView {
                            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150))], spacing: 10) {
                                ForEach(movieViewModel.movies) { movie in
                                    MovieGridItem(movie: movie)
                                        .onTapGesture {
                                            selectedMovie = movie
                                            viewModel.isShowingDetail = true
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("🍿Movies")
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear {
                movieViewModel.fetchMovies()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail {
                MovieDetailView(movie: selectedMovie!, isShowingDetail: $viewModel.isShowingDetail)
            }
        }
    }
}

//struct MovieGridView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieGridView()
//    }
//}
