//
//  MovieViewModel.swift
//  MovieDatabase
//
//  Created by ivan ruwido  on 09.10.23.
//

import Foundation
import Combine
import SwiftUI

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = [] // Store the fetched movies
    private var cancellables: Set<AnyCancellable> = []
    
    func fetchMovies() {
        guard let url = URL(string: "https://api.themoviedb.org/3/discover/movie") else {
            return
        }

        let apiKey = "c64bdfb759c26da717733ddaa40f24c1"
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey),
            // Add other query parameters as needed
        ]

        if let apiUrl = components?.url {
            print("Fetching data from URL: \(apiUrl)")
            URLSession.shared.dataTaskPublisher(for: apiUrl)
                .map(\.data)
                .decode(type: MoviesResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break // The request completed successfully
                    case .failure(let error):
                        print("Error: \(error)") // Log and handle any errors
                    }
                }, receiveValue: { [weak self] moviesResponse in
                    self?.movies = moviesResponse.results
                })
                .store(in: &cancellables)
        }
    }

}

struct MoviesResponse: Decodable {
    let results: [Movie]
}
