//
//  ListContract.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

/***
 
     Protocol de la vista para esta funcionalidad, se encarga de pintar datos según le diga el presenter y recoger inputs del usuario
 git comm
 **/
protocol ListView {
    
    var delegate: ListViewDelegate? { get set }
    var searchText: String { get set }
    
    func showMessageEmptySearchText()
    func print(movies: [Movie])
    func showErrorLoadingMovies()
}

/***
 Protocol para delegar los inputs del usuario, en este ejemplo los implementa el presenter.
 **/
protocol ListViewDelegate {
    
    func onSearchButtonTap()
    func onMovieTap(_ movie: Movie)
}

/***
 Protocol que define a que datos vamos a tener acceso y como los vamos a obtener
 
 En este ejemplo solo tenemos acceso a un listado de películas, pudiendo filtrar por texto de búsqueda.
 
 Si por ejemplo tuvieramos versión offline de la app, el interactor recibiría por inyección de dependecias un DataManager usando un patrón repositorio
 **/
protocol ListInteractorProtocol {
    
    var delegate: ListInteractorDelegate? { get set }
    
    func loadMovies(with searchText: String)
    
}

/***
 Protocol para delegar las respuestas de la persintencia, ya sean errores o los datos en si
 En este ejmeplo lo implementa el presenter
**/
protocol ListInteractorDelegate  {
    
    func onLoaded(movies: [Movie])
    func onLoadedMoviesError()
}

/***
 
 En VIPER tenemos una clase aparte para la navegación, se suele encontrar como wireframe
 **/

protocol ListWireframeProtocol {
    
    func open(movie: Movie, from view: ListView)
    
}
