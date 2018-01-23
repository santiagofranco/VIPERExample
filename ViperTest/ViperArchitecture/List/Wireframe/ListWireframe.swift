//
//  ListWireframe.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import Foundation
import UIKit

class ListWireframe: ListWireframeProtocol {
    
    static func createModule() -> UIViewController {
        
    
        if let view = UIStoryboard(name: "Main", bundle: Bundle.main)
            .instantiateViewController(withIdentifier: "ListViewController") as? ViperListViewController {
            
            let interactor = ListInteractor()
            let router = ListWireframe()
            
            _ = ListPresenter(interactor: interactor, view: view, router: router)
            
            return view
        }
        
        
        return UIViewController()
        
    }
    
    func open(movie: Movie, from view: ListView) {
        print(movie.title)
        //TODO: Crear toda la funcionalidad con VIPER para el detalle dentro de la carpeta Details y abrirlo desde aquí por código
        
    }
    
}
