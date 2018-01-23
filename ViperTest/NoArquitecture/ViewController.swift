//
//  ViewController.swift
//  ViperTest
//
//  Created by santi on 20/1/18.
//  Copyright © 2018 santiagofranco. All rights reserved.
//

import UIKit

class NoArchitectureViewController: UIViewController {

    @IBOutlet weak var searchTextfield: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var moviesTableview: UITableView!
    
    var movies: [MovieModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableview.delegate = self
        moviesTableview.dataSource = self
        
    }
    
    @IBAction func onSearchButtonClick(_ sender: Any) {
        let searchText = self.searchTextfield.text ?? "" //Lógica de vista
        loadMovies(with: searchText) //Lógica del presenter
    }
    
    
    fileprivate func loadMovies(with searchText: String) {
        
        //Lógica de vista y presenter mezclada
        if searchText.isEmpty {
            
            return
            
        }
        
        //Acceso a datos: responsabilidad de un modelo
        let url = URL(string: "https://www.omdbapi.com/?s=\(searchText)&apikey=196e8f5")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else { return }
                do {
                    //Mapeo de datos: resposabilidad de un modelo
                    let decoder = JSONDecoder()
                    let movie = try decoder.decode(SearchMovie.self, from: data)
                    self.movies = movie.search //Pasar datos al view controller: responsabilidad del presenter
                    self.moviesTableview.reloadData() //Recargar los datos: responsabilidad de la vista
                } catch let err {
                    print("Err", err)
                }
            }
            
            
        }
        
        task.resume()
        
    }


}

extension NoArchitectureViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        openDetail(of: currentMovie)
    }
    
    fileprivate func openDetail(of movie: MovieModel) {
        
        print(movie.title)
        //TODO: Crear otro view controller para el detalle y abrirlo desde aquí por código
        
        
        //Aquí metemos navegación: Responsabilidad de un Router
    }
}

