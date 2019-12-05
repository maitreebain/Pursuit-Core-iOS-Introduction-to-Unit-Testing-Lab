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
        
        bLabel.text = trivia?.correct_answer.removingPercentEncoding
        randomAns()
    }
    
    
    func randomAns() {

//        aLabel.text = trivia?.incorrect_answers[0].removingPercentEncoding
//        cLabel.text = trivia?.incorrect_answers[1].removingPercentEncoding
//        dLabel.text = trivia?.incorrect_answers[2].removingPercentEncoding
        
        var counter = 0
        
        for 
        
}
    
    
    
    
}
