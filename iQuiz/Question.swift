//
//  Question.swift
//  iQuiz
//
//  Created by Charlene on 2/17/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class Question: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var questions = ["Question1", "Question2"]
    var choices = ["A", "B", "C", "D"]
    var type = ""
    var currentQuestion = 0
    var userChoice = 0
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Answer = segue.destination as! Answer
        Answer.currQuestion = currentQuestion
        Answer.choice = userChoice
    }
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let questionText = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        questionText.text = questions[currentQuestion]
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
        self.present(destination, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userChoice = indexPath.row
    }

}
