//
//  ListInteractor.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

class ListInteractor: ListInteractorProtocol {
    
    var delegate: ListInteractorDelegate?
    
    func loadMovies(with searchText: String) {
        
        
        let url = URL(string: "https://www.omdbapi.com/?s=\(searchText)&apikey=196e8f5")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    let search = try decoder.decode(APIMovieSearch.self, from: data)
                    
                    let movies: [Movie] = search.movies.map({ (apiMovie) -> Movie in
                        return Movie(id: apiMovie.identifier,
                                     title: apiMovie.name,
                                     poster: apiMovie.image)
                    })
                    
                    self.delegate?.onLoaded(movies: movies)
                    
                } catch {
                    self.delegate?.onLoadedMoviesError()
                }
            }
        
        }
        task.resume()
    }
}
