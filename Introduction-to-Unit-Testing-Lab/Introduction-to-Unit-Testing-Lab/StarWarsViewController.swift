//
//  StarWarsViewController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {
    
    @IBOutlet weak var SWTableView: UITableView!
    
    var starWars = [MovieInfo]() {
        didSet {
            SWTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        SWTableView.dataSource = self
        loadData()
        SWTableView.delegate = self
    }
    
    func loadData() {
        starWars = StarWarsData.getMovieName()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let starWarsVC = segue.destination as? StarWarsDetailsController,
            let indexPath = SWTableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let movieSelected = starWars[indexPath.row]
        
        starWarsVC.movie = movieSelected
    }


}
extension StarWarsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension StarWarsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return starWars.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "starWarsCell", for: indexPath)
        
        let selectedMovie = starWars[indexPath.row]
        
        cell.textLabel?.text = selectedMovie.title
        
        return cell
    }
}
