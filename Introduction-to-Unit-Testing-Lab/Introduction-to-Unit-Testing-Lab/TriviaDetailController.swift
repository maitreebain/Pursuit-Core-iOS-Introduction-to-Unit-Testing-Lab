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
        
        var varA = ""
        var varD = ""
        var varC = ""
        

        aLabel.text = trivia?.incorrect_answers.randomElement()?.removingPercentEncoding
        varA.append(contentsOf: aLabel.text!)
        cLabel.text = trivia?.incorrect_answers.randomElement()?.removingPercentEncoding
        varC.append(contentsOf: bLabel.text!)
        dLabel.text = trivia?.incorrect_answers.randomElement()?.removingPercentEncoding
        varD.append(contentsOf: cLabel.text!)

    

}
    
    
    
    
}
