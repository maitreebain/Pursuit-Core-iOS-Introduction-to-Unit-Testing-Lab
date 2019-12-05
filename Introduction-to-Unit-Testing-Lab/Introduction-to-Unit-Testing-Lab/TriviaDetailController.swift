//
//  TriviaDetailController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit


class TriviaDetailController: UIViewController {
    
    @IBOutlet weak var aLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var cLabel: UILabel!
    
    @IBOutlet weak var dLabel: UILabel!
    
    
    var trivia: TriviaData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        randomAns()
        bLabel.text = trivia?.correct_answer.removingPercentEncoding
    }
    
    
    func randomAns() {
        
//repeat while? 
        for answer in trivia!.incorrect_answers {
        
            
                aLabel.text = answer.removingPercentEncoding
                cLabel.text = answer.removingPercentEncoding

                dLabel.text = answer.removingPercentEncoding
            
        }
}
    
}
