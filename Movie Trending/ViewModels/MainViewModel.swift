//
//  MainViewModel.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 17/07/2023.
//

import Foundation

class MainViewModel {
    
    // MARK: - Variables
    
    var isLoading: Observable<Bool> = Observable(value: false)
    var cellDataSource: Observable<[MovieTableCellViewModel]> = Observable(value: nil)
    var dataSource: TrendingMoviesModel?
    
    // MARK: - Class Methods
    
    // Returns the number of sections in the table view
    func numberOfSections() -> Int {
        return 1
    }
    
    // Returns the number of rows in the specified table view section
    func numberOfRows(in section: Int) -> Int {
        return self.dataSource?.results.count ?? 0
    }
    
    // Fetches data from the API
    func getData() {
        if isLoading.value ?? true {
            return
        }
        
        isLoading.value = true
        
        APICaller.getTrendingMovies { [weak self] result in
            self?.isLoading.value = false
            
            switch result {
            case .success(let data):
                print("Top Trending Counts: \(data.results.count)")
                self?.dataSource = data
                self?.mapCellData()
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // Maps the data source to the cell data source
    func mapCellData() {
        self.cellDataSource.value = self.dataSource?.results.compactMap({MovieTableCellViewModel(movie: $0)})
    }
    
    // Returns the title of a movie
    func getMovieTitle(_ movie: Movie) -> String {
        return movie.title
    }
}
