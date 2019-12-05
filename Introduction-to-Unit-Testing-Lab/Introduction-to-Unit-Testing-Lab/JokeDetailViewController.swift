//
//  JokeDetailViewController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class JokeDetailViewController: UIViewController {
    
    @IBOutlet weak var punchlineLabel: UILabel!
    
    var joke: JokeData?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        punchlineLabel.text = joke?.punchline.description
    }
    


}
