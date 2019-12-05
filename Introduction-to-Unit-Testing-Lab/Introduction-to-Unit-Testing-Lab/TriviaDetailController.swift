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

        var counter = 0
        var textA = ""
        var textD = ""
        var textC = ""
        var textArray = [String]()
      

        for answer in trivia!.incorrect_answers {
            
            guard trivia!.incorrect_answers.count > 1 else {
                aLabel.text = answer.removingPercentEncoding
                textA.append(aLabel.text!)
                textD = ""
                textC = ""
                textArray.append(textA)
                textArray.append(textD)
                textArray.append(textC)
                return
            }

            
            switch counter {
            case 0:
                aLabel.text = answer.removingPercentEncoding
                textA.append(aLabel.text!)
                textArray.append(textA)
                counter += 1
            case 1:
                dLabel.text = answer.removingPercentEncoding
                counter += 1
                textD.append(dLabel.text!)
                textArray.append(textD)
            case 2:
                cLabel.text = answer.removingPercentEncoding
                counter = 0
                textC.append(cLabel.text!)
                textArray.append(textC)
            default:
                print("no label")
            }
        }
      
                textArray.shuffle()
                aLabel.text = textArray[0]
                dLabel.text = textArray[1]
                cLabel.text = textArray[2]
                     

        
}
    
    
    
    
}
