//
//  Answer.swift
//  iQuiz
//
//  Created by Charlene on 2/17/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class Answer: UIViewController {
    
    var currQuestion = 0
    var choice = 0
    var questions = ""
    var correctNumber = 0
    var qCount = 0
    var quizType = 0
    var totalCorrect = 0
    var url = "https://tednewardsandbox.site44.com/questions.json"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionText = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        questionText.text = questions
        questionText.translatesAutoresizingMaskIntoConstraints = true
        questionText.center = CGPoint(x: view.bounds.midX, y: 50)
        questionText.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
       
        let correctAnswer = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        let correctAnswerText = "The correct answer is " + String(correctNumber)
        correctAnswer.text = correctAnswerText
        correctAnswer.translatesAutoresizingMaskIntoConstraints = true
        correctAnswer.center = CGPoint(x: view.bounds.midX, y: 100)
        correctAnswer.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
       let result = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        if choice == correctNumber {
            result.text = "Congradulations! You got it right!"
            totalCorrect = totalCorrect + 1
        } else {
            result.text = "Oh no you missed it!"
        }
        result.translatesAutoresizingMaskIntoConstraints = true
        result.center = CGPoint(x: view.bounds.midX, y: 150)
        result.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        
        let nextButton = UIButton(frame: CGRect(x: 0, y: 00, width: 200, height: 200))
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = true
        nextButton.center = CGPoint(x: view.bounds.midX, y: 250)
        nextButton.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        self.view.addSubview(questionText)
        self.view.addSubview((correctAnswer))
        
        self.view.addSubview((result))
        self.view.addSubview((nextButton))
        // Do any additional setup after loading the view.
    }
    
    @objc func pressedAction(_ sender: UIButton) {
        if currQuestion + 1 == qCount {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "Finished") as! Finished
            destination.correct = totalCorrect
            destination.totalQuestions = qCount
            destination.URL = url
            self.present(destination, animated: true, completion: nil)
        } else {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "Question") as! Question
            destination.currentQuestion = currQuestion + 1
            destination.type = quizType
            destination.correctCount = totalCorrect
            destination.URL = url
            self.present(destination, animated: true, completion: nil)
        }
    }


}
