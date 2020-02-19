//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Akyya Mayberry on 2/14/20.
//  Copyright © 2020 Mayberry, Akyya. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK - Properties
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet var singleStackView: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    
    @IBOutlet var multipleStackView: UIStackView!
    @IBOutlet var multiLabel1: UILabel!
    @IBOutlet var multiLabel2: UILabel!
    @IBOutlet var multiLabel3: UILabel!
    @IBOutlet var multiLabel4: UILabel!
    
    @IBOutlet var rangedStackView: UIStackView!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    var questionIndex = 0
    var questions: [Question]!
    
    // MARK - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        questions = generateQuestions(3)
        updateUI()
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let question = questions[questionIndex]
        let answers = question.answers
        
        switch question.type {
        case .single:
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
        case .multiple:
            multipleStackView.isHidden = false
            multiLabel1.text = answers[0].text
            multiLabel2.text = answers[1].text
            multiLabel3.text = answers[2].text
            multiLabel4.text = answers[3].text
        case .ranged:
            rangedStackView.isHidden = false
            rangedLabel1.text = answers.first?.text
            rangedLabel2.text = answers.last?.text
        }
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = question.text
        questionProgressView.progress = Float(questionIndex) / Float(questions.count)
        
        
    }
    
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
