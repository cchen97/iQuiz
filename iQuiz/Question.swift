//
//  Question.swift
//  iQuiz
//
//  Created by Charlene on 2/17/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class Question: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var question = ""
    var choices = ["A", "B", "C", "D"]
    var type = 0
    var currentQuestion = 0
    var correctAnswer = 0
    var userChoice = 0
    var questionCount = 0
    var correctCount = 0
    var custom = false
    var URL = "https://tednewardsandbox.site44.com/questions.json"

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        }
        let rowNum = indexPath.row
        cell?.textLabel?.text = choices[rowNum]
        return cell!
    }
    
    struct Quizzes: Decodable {
        var title: String
        var desc: String
        var questions: [Questions]
    }
    struct Questions: Decodable {
        var text: String
        var answer: String
        var answers: [String]
    }
    func loadJson(filename fileName: String) {
        var qUrl: URL?
        if (!custom) {
            qUrl = Bundle.main.url(forResource: fileName, withExtension: "json")
        } else {
            qUrl = NSURL(string: URL)! as URL
        }
        do {
            let data = try Data(contentsOf: qUrl!)
            let decoder = JSONDecoder()
            let quizzes = try decoder.decode([Quizzes].self, from: data)
            question = quizzes[type].questions[currentQuestion].text
            choices = quizzes[type].questions[currentQuestion].answers
            correctAnswer = Int(quizzes[type].questions[currentQuestion].answer) ?? 0
            questionCount = quizzes[type].questions.count
        } catch {
            print("error:\(error)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadJson(filename: "questions")
        let questionText = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        questionText.text = question
        let rect = CGRect(x: 0, y: 200, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        let tableView = UITableView(frame: rect)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        
        let submitButton = UIButton(frame: CGRect(x: 200, y: 500, width: 200, height: 200))
        submitButton.setTitle("Submit", for: .normal)
        submitButton.setTitleColor(UIColor.blue, for: .normal)
        submitButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
        self.view.addSubview(questionText)
        self.view.addSubview((tableView))
        self.view.addSubview(submitButton)
        // Do any additional setup after loading the view.
    }
    
    @objc func pressedAction(_ sender: UIButton) {
        let destination = self.storyboard?.instantiateViewController(withIdentifier: "Answer") as! Answer
        destination.currQuestion = currentQuestion
        destination.choice = userChoice
        destination.correctNumber = correctAnswer
        destination.questions = question
        destination.qCount = questionCount
        destination.quizType = type
        destination.totalCorrect = correctCount
        destination.url = URL
        self.present(destination, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userChoice = indexPath.row + 1
    }

}
