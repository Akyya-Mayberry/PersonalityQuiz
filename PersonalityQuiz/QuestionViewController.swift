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
  @IBOutlet var multiSwitch1: UISwitch!
  @IBOutlet var multiSwitch2: UISwitch!
  @IBOutlet var multiSwitch3: UISwitch!
  @IBOutlet var multiSwitch4: UISwitch!
  
  @IBOutlet var rangedStackView: UIStackView!
  @IBOutlet var rangedLabel1: UILabel!
  @IBOutlet var rangedLabel2: UILabel!
  @IBOutlet weak var rangedSlider: UISlider!
  
  var questionIndex = 0
  var questions: [Question]!
  var selectedAnswers: [Answer] = []
  
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
      updateMultipleStack(using: answers)
    case .ranged:
      updateRangedStack(using: answers)
    }
    
    navigationItem.title = "Question #\(questionIndex + 1)"
    questionLabel.text = question.text
    questionProgressView.progress = Float(questionIndex) / Float(questions.count)
    
  }
  
  @IBAction func didTapSingleAnswerButton(_ sender: UIButton) {
    
    let answers = questions[questionIndex].answers
    
    switch true {
    case sender == singleButton1:
      selectedAnswers.append(answers[0])
    case sender == singleButton2:
      selectedAnswers.append(answers[1])
    case sender == singleButton3:
      selectedAnswers.append(answers[2])
    case sender == singleButton4:
      selectedAnswers.append(answers[3])
    default:
      break
    }
    
    /* Alternative way to get answers
     // match selected answer to an answer in
     // the question's answer list
     let selectedButtonAnswer = sender.currentTitle
     for answer in answers {
     if answer.text == selectedButtonAnswer {
     selectedAnswers.append(answer)
     }
     }
     */
    
    print("first question answer: \(selectedAnswers[0])")
    
    nextQuestion()
    
  }
  
  @IBAction func didTapSubmitMultipleAnswerButton() {
    let answers = questions[questionIndex].answers
    
    if multiSwitch1.isOn {
      selectedAnswers.append(answers[0])
    }
    
    if multiSwitch2.isOn {
      selectedAnswers.append(answers[1])
    }
    
    if multiSwitch3.isOn {
      selectedAnswers.append(answers[2])
    }
    
    if multiSwitch4.isOn {
      selectedAnswers.append(answers[3])
    }
    
    print("first question answer: \(selectedAnswers)")
    nextQuestion()
  }
  
  @IBAction func didTapSubmitRangedAnswerButton() {
    let answers = questions[questionIndex].answers
    
    let index = Int(round(rangedSlider.value *
      Float(answers.count - 1)))
    
    selectedAnswers.append(answers[index])
    print("first question answer: \(selectedAnswers)")
    
    nextQuestion()
  }
  
  func nextQuestion() {
    questionIndex += 1
    
    if questionIndex < questions.count {
      updateUI()
    } else {
      print("Quiz is over")
      performSegue(withIdentifier: "ResultsSegue", sender: nil)
    }
  }
  
  func updateMultipleStack(using answers: [Answer]) {
    multipleStackView.isHidden = false
    multiLabel1.text = answers[0].text
    multiLabel2.text = answers[1].text
    multiLabel3.text = answers[2].text
    multiLabel4.text = answers[3].text
    multiSwitch1.isOn = false
    multiSwitch2.isOn = false
    multiSwitch3.isOn = false
    multiSwitch4.isOn = false
  }
  
  func updateRangedStack(using answers: [Answer]) {
    rangedStackView.isHidden = false
    rangedSlider.setValue(0.5, animated: true)
    rangedLabel1.text = answers.first?.text
    rangedLabel2.text = answers.last?.text
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
      Question(text: "Which animals do you like?",
               type: .multiple,
               answers: [
                Answer(text: "Cat", type: .cat),
                Answer(text: "Rabbit", type: .rabbit),
                Answer(text: "Turtle", type: .turtle),
                Answer(text: "Dog", type: .dog)
      ]),
      Question(text: "How much do you enjoy car rides?",
               type: .ranged,
               answers: [
                Answer(text: "I dislike them", type: .cat),
                Answer(text: "I get a little nervous", type: .rabbit),
                Answer(text: "I barely notice them", type: .turtle),                     Answer(text: "I love them", type: .dog)
      ])
    ]
  }
}
