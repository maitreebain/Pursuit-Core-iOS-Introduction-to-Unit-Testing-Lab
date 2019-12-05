//
//  ViewController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class OfficialJokeController: UIViewController {

    @IBOutlet weak var jokesTableView: UITableView!
    
    var jokes = [JokeData]() {
        didSet {
            jokesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jokesTableView.dataSource = self
        jokes = JokeData.getJokesData()
        jokesTableView.delegate = self
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let jokeDetailController = segue.destination as? JokeDetailViewController,
            let indexPath = jokesTableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let selectedJoke = jokes[indexPath.row]
        
        jokeDetailController.joke = selectedJoke
        
    }

}

extension OfficialJokeController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}


extension OfficialJokeController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jokes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokesCell", for: indexPath)
        
        let jokeSelected = jokes[indexPath.row]
        
        cell.textLabel?.text = jokeSelected.setup
        
        return cell
    }
}
