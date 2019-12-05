//
//  TriviaDetailController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit


class TriviaDetailController: UIViewController {
    
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var aLabel: UILabel!
    
    @IBOutlet weak var bLabel: UILabel!
    
    @IBOutlet weak var cLabel: UILabel!
    
    @IBOutlet weak var dLabel: UILabel!
    
    @IBOutlet weak var aButtonOut: UIButton!
    
    @IBOutlet weak var bButtonOut: UIButton!
    
    @IBOutlet weak var cButtonOut: UIButton!
    
    @IBOutlet weak var dButtonOut: UIButton!
    
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
                textArray.append(textA)
                textArray.append(textD)
                textArray.append(textC)
                dLabel.text = textArray[1]
                cLabel.text = textArray[2]
                cButtonOut.isHidden = true
                dButtonOut.isHidden = true
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
    
    func buttonDisable() {
        aButtonOut.isEnabled = false
        bButtonOut.isEnabled = false
        cButtonOut.isEnabled = false
        dButtonOut.isEnabled = false
    }
    
    
    
    @IBAction func aButton(_ sender: UIButton) {
        view.backgroundColor = .red
        answerLabel.text = "Wrong!"
        buttonDisable()

    }
    
    @IBAction func bButton(_ sender: UIButton) {
        view.backgroundColor = .green
        answerLabel.text = "Correct!"
        buttonDisable()
    }
    
    @IBAction func cButton(_ sender: UIButton) {
        view.backgroundColor = .red
        answerLabel.text = "Wrong!"
        buttonDisable()
    }
    
    @IBAction func dButton(_ sender: UIButton) {
        view.backgroundColor = .red
        answerLabel.text = "Wrong!"
        buttonDisable()
    }
}
