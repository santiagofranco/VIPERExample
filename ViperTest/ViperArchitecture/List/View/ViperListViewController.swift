//
//  ViperListViewController.swift
//  ViperTest
//
//  Created by santi on 22/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import UIKit

class ViperListViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var delegate: ListViewDelegate?
    
    var searchText: String {
        get {
            return searchTextField.text ?? ""
        }
        set {}
    }
    
    var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
    }

    @IBAction func onSearchButtonTap() {
        delegate?.onSearchButtonTap()
    }

}

extension ViperListViewController: ListView {
    
    func print(movies: [Movie]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func showMessageEmptySearchText() {
        //TODO: Implementar un alert con una extension en UIViewController
        Swift.print("El campo de búsqueda tiene que tener datos")
    }
    
    func showErrorLoadingMovies() {
        //TODO: Implementar un alert con una extension en UIViewController
        Swift.print("Ocurrió un error cargando las películas")
    }
}

extension ViperListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            as? MovieModelTableViewCell{
            
            let currentMovie = movies[indexPath.row]
            cell.nameLabel.text = currentMovie.title
            cell.imageView?.setFrom(path: currentMovie.poster)
            return cell
            
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let currentMovie = movies[indexPath.row]
        self.delegate?.onMovieTap(currentMovie)
    }
}
