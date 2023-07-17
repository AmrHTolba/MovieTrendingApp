//
//  MainViewModel.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 17/07/2023.
//

import Foundation

struct MainViewModel {
    
    
    func numberOfSections() -> Int {
        
        return 1
    }
    
    func numberOfRows(in section: Int) -> Int {
        return 10
    }
    
    func getData() {
        APICaller.getTrendingMovies { result in
            switch result {
            case .success(let data):
                print("Top Tredning Counts:\(data.results.count)")
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
