//
//  MovieTaableCellViewModel.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 18/07/2023.
//

import Foundation


class MovieTableCellViewModel {
    
    // MARK: - Variables
    
    var id:  Int
    var title: String
    var date: String
    var rating: String
    var imageUrl: URL?
    
    // MARK: - Initializer
    
    init(movie: Movie) {
        self.id = movie.id
        self.title = movie.title
        self.date = movie.releaseDate
        self.rating = "\(movie.voteAverage)"
        self.imageUrl = makeImageURL(movie.posterPath)
    }
    
    
    private func makeImageURL(_ imageCode: String) -> URL? {
        URL(string: "\(NetworkConstant.imageAddress)\(imageCode)")
    }
}
