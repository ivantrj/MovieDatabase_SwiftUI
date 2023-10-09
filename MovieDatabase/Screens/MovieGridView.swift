//
//  MovieGridView.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import SwiftUI

struct MovieGridView: View {
    @ObservedObject var movieViewModel = MovieViewModel()
    @State private var selectedMovie: Movie?
    @State private var isShowingDetail = false

    
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
                                            isShowingDetail = true
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                }
                .navigationTitle("🍿Movies")
                .disabled(isShowingDetail)
            }
            .onAppear {
                movieViewModel.fetchMovies()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                MovieDetailView(movie: selectedMovie!, isShowingDetail: $isShowingDetail)
            }
        }
    }
}

struct MovieGridView_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridView()
    }
}
