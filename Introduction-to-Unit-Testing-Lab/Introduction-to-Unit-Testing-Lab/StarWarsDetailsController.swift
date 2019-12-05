//
//  StarWarsDetailsController.swift
//  Introduction-to-Unit-Testing-Lab
//
//  Created by Maitree Bain on 12/4/19.
//  Copyright © 2019 Maitree Bain. All rights reserved.
//

import UIKit

class StarWarsDetailsController: UIViewController {

    
    @IBOutlet weak var crawlText: UITextView!
    
    var movie: MovieInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        crawlText.text = movie?.openingCrawl.description
    }
    


}
