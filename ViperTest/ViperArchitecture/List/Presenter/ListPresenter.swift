//
//  ListPresenter.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation

/***
 
 Los presenter son los que llevan todo la lógica de negocio en cada funcionalidad, y esa es la responsabilidad que tienen, básicamente el flujo sería:
 
     1. La vista le notifica (mediante delegate) cuando el usuario realiza una acción
     2. Según la lógica que requiera cada acción puede actualizar la vista o puede pedir datos al interactor, que representa el acceso a los datos
     3. En caso de pedir datos al interactor, se reciben los datos (ya sea que la petición vaya bien o haya fallado por algo), y según la lógica se actualiza la vista o se piden más datos
 
     Otra opción que se puede dar según la lógica es navegar a otra pantalla, en este ejemplo se encarga un router. Aunque lo podría hacer la vista, pero me parecen demasiadas responsabilidades.
 
 **/
class ListPresenter {
    
    var interactor: ListInteractorProtocol
    var view: ListView
    let router: ListWireframeProtocol
    
    init(interactor: ListInteractorProtocol, view: ListView, router: ListWireframeProtocol) {
        self.interactor = interactor
        self.view = view
        self.router = router
        
        self.view.delegate = self
        self.interactor.delegate = self
    }
    
    fileprivate func loadMovies() {
        
        let searchText = view.searchText
        
        if searchText.isEmpty {
            view.showMessageEmptySearchText()
            return
        }
        
        interactor.loadMovies(with: searchText)
    }
    
}

extension ListPresenter: ListViewDelegate {

    func onSearchButtonTap() {
        loadMovies()
    }
    
    func onMovieTap(_ movie: Movie) {
        router.open(movie: movie, from: view)
    }
    
}

extension ListPresenter: ListInteractorDelegate {
    
    func onLoaded(movies: [Movie]) {
        view.print(movies: movies)
    }
    
    func onLoadedMoviesError() {
        view.showErrorLoadingMovies()
    }
    
}

