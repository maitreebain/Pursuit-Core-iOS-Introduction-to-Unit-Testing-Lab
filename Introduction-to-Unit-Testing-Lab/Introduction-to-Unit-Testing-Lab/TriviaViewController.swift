//
//  TriviaViewController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/2/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var triviaTableView: UITableView!
    
    var trivia = [TriviaData]() {
        didSet {
            triviaTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        triviaTableView.dataSource = self
        loadData()
        triviaTableView.delegate = self
    }
    
    func loadData() {
        trivia = TriviaDataLoad.getTrivia()
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let triviaDetailController = segue.destination as? TriviaDetailController,
            let indexPath = triviaTableView.indexPathForSelectedRow else {
                fatalError("no segue found")
        }
        let selectedItem = trivia[indexPath.row]
        
        triviaDetailController.trivia = selectedItem
        
    }
}

extension TriviaViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension TriviaViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trivia.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)
        
        let selectedQuestion = trivia[indexPath.row]
        
        cell.textLabel?.text = selectedQuestion.question.removingPercentEncoding
        cell.detailTextLabel?.text = selectedQuestion.difficulty.capitalized
        
        return cell
    }
}
