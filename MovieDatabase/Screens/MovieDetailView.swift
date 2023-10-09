//
//  MovieDetailView.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import SwiftUI

struct MovieDetailView: View {
    
    let movie: Movie
    @Binding var isShowingDetail: Bool
    @State private var isAddedToWatchlist = false
    @StateObject var viewModel = WatchlistViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                AsyncImage(url: URL(string:  "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                            .padding()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                    } else {
                        ProgressView()
                    }
                }
                .frame(width: 200, height: 300)
                .cornerRadius(12)
                
                
                Spacer()

                VStack {
                    Text(movie.title)
                        .multilineTextAlignment(.center)
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("Release Date: \(movie.releaseDate)")
                        .multilineTextAlignment(.center)
                        .bold()
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    Text(movie.overview)
                        .multilineTextAlignment(.center)
                        .font(.body)
                        .padding()
                    
                    Button(action: {
                                if isAddedToWatchlist {
                                    viewModel.removeMovieFromWatchlist(movie: movie)
                                } else {
                                    viewModel.addMovieToWatchlist(movie: movie)
                                }
                                isAddedToWatchlist.toggle()
                            }) {
                                Text(isAddedToWatchlist ? "Remove from Watchlist" : "Add to Watchlist")
                                    .font(.title3)
                                    .fontWeight(.semibold)
                                    .frame(width: 260, height: 50)
                                    .foregroundColor(.white)
                                    .background(isAddedToWatchlist ? .red : .blue)
                                    .cornerRadius(10)
                                    .padding(.bottom, 30)
                            }
                }
            }
            
        }
        .frame(width: 300, height: 520)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .opacity(0.8)
        .overlay(Button {
            isShowingDetail = false
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.white)
                    .opacity(0.6)
                
                Image(systemName: "xmark")
                    .imageScale(.small)
                    .frame(width: 44, height: 44)
                    .foregroundColor(.black)
            }
        }, alignment: .topTrailing)
    }
}

//struct MovieDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieDetailView(movie: MockData.sampleMovie, isShowingDetail: .constant(true), watchlistViewModel: WatchlistViewModel)
//    }
//}
