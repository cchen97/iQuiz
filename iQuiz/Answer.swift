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
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let Question = segue.destination as! Question
//        Question.currentQuestion = currQuestion + 1
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionText = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        questionText.text = questions
       let correctAnswer = UILabel(frame: CGRect(x: 50, y: 300, width: 200, height: 200))
        let correctAnswerText = "The correct answer is " + String(correctNumber)
        correctAnswer.text = correctAnswerText
       let result = UILabel(frame: CGRect(x: 50, y: 400, width: 500, height: 100))
        if choice == correctNumber {
            result.text = "Congradulations! You got it right!"
            totalCorrect = totalCorrect + 1
        } else {
            result.text = "Oh no you missed it!"
        }
        let nextButton = UIButton(frame: CGRect(x: 50, y: 500, width: 200, height: 200))
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
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
            self.present(destination, animated: true, completion: nil)
        } else {
            let destination = self.storyboard?.instantiateViewController(withIdentifier: "Question") as! Question
            destination.currentQuestion = currQuestion + 1
            destination.type = quizType
            destination.correctCount = totalCorrect
            self.present(destination, animated: true, completion: nil)
        }
    }


}
