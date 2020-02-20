//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Akyya Mayberry on 2/14/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
  
  // MARK: - Properties
  
  @IBOutlet weak var resultAnswerLabel: UILabel!
  @IBOutlet weak var resultDescriptionLabel: UILabel!
  
  var responses: [Answer]?

  // MARK: - Methods

    override func viewDidLoad() {
        super.viewDidLoad()
      
      navigationItem.hidesBackButton = true
      calculatePersonalityResults()
    }
  
  func calculatePersonalityResults() {
    let results = responses?.reduce(into: [:], { (counts, animalTypes) in
      counts[animalTypes.type, default: 0] += 1
    })
    
    let resultsSorted = results?.sorted(by: { (type1, type2) -> Bool in
      return type1.value > type2.value
    })
    
    if let animal = resultsSorted?.first {
      resultAnswerLabel.text = "You are a \(animal.key.rawValue)."
      resultDescriptionLabel.text = animal.key.definition
    }
  }
}
