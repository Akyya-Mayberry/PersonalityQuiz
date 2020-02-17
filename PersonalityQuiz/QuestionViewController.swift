//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Akyya Mayberry on 2/14/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

// MARK - Extensions

extension QuestionViewController {
    func generateQuestions(_ number: Int) -> [Question] {
        return [
            Question(text: "Which food do you like most?",
                     type: .single,
                     answers: [
                        Answer(text: "Steak", type: .dog),
                        Answer(text: "Fish", type: .cat),
                        Answer(text: "Carrots", type: .rabbit),
                        Answer(text: "Corn", type: .turtle)
            ]),
            Question(text: "Which activities do you enjoy?",
                     type: .multiple,
                     answers: [
                        Answer(text: "Sleeping", type: .cat),
                        Answer(text: "Cuddling", type: .rabbit),
                        Answer(text: "Swimming", type: .turtle),
                        Answer(text: "Eating", type: .dog)
            ]),
            Question(text: "How much do you enjoy car rides?",
                     type: .ranged,
                     answers: [
                        Answer(text: "I love them", type: .dog),
                        Answer(text: "I dislike them", type: .cat),
                        Answer(text: "I get a little nervous", type: .rabbit),
                        Answer(text: "I barely notice them", type: .turtle)
            ])
        ]
    }
}
