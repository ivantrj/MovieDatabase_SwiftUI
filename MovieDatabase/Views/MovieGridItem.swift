//
//  MovieGridItem.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import SwiftUI

struct MovieGridItem: View {
    let movie: Movie
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath)")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 200)
            .cornerRadius(10)

            VStack(alignment: .leading, spacing: 8) {
                Text(movie.title)
                    .font(.headline)
                    .lineLimit(2)

                Text("Release Date: \(movie.releaseDate)")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            .padding(EdgeInsets(top: 8, leading: 12, bottom: 12, trailing: 12))
            .cornerRadius(10)
            .shadow(radius: 3)
        }
    }
}

struct MovieGridItem_Previews: PreviewProvider {
    static var previews: some View {
        MovieGridItem(movie: MockData.sampleMovie)
    }
}
