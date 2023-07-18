//
//  MainViewModel.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 17/07/2023.
//

import Foundation

class MainViewModel {
    
    var isLoading: Observable <Bool> = Observable(value: false)
    var cellDataSource: Observable <[Movie]> = Observable(value: nil)
    var dataSource: TrendingMoviesModel?
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    func getData() {
        if isLoading.value ?? true {
            return
        }
        isLoading.value = true
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top Tredning Counts:\(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
                
            case .failure(let error):
                print(error)
            }
            
        }
    }
    
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results ?? []
    }
    
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title
    }
}
