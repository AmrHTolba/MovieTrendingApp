//
//  APICaller.swift
//  Movie Trending
//
//  Created by Amr El-Fiqi on 17/07/2023.
//

import Foundation
import UIKit

// MARK: - Enums
enum APIError: Error {
    case failedToGetData
}

class APICaller {
    
    static let shared = APICaller()
    
    static func getTrendingMovies(completion: @escaping (Result<TrendingMoviesModel, Error>) -> Void) {
        
        let task  = URLSession.shared.dataTask(with: URLRequest(url: getFullURL())) {
            data, response, error in
            guard let data = data, error == nil else {
                print(String(describing: error))
                print("1111111111")
                return
            }
            do {
                let results = try JSONDecoder().decode(TrendingMoviesModel.self , from: data)
                print(results)
                print("0000000000000000")
                completion(.success(results))
            }
            catch{
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    static func getFullURL() -> URL {
        guard let url = URL(string: "\(NetworkConstant.baseURL)\(NetworkConstant.trendingMovies)\(NetworkConstant.API_KEY)") else {
            return URL(string: NetworkConstant.baseURL)!}
        return url
        }
    
}
