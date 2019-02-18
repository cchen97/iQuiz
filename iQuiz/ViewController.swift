//
//  ViewController.swift
//  iQuiz
//
//  Created by Charlene on 2/12/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizzes = ["Mathematics", "Marvel Super Heroes", "Science"]
    var quizDetails = ["Challenge yourself with math questions!", "Come have fun with superhero questions!", "Love science? Try our science questions!"]
    var images : [UIImage] = [UIImage(named: "1.png")!,UIImage(named: "2.png")!,UIImage(named: "3.png")! ]
    
    var quizType = ""
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let Question = segue.destination as! Question
        Question.type = quizType
        Question.currentQuestion = 0
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "reusedCell"
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.subtitle, reuseIdentifier: identifier)
        }
        let rowNum = indexPath.row
        cell?.textLabel?.text = quizzes[rowNum]
        cell?.detailTextLabel?.text = quizDetails[rowNum]
        cell?.imageView?.image = images[rowNum]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let destination = storyboard.instantiateViewController(withIdentifier: "Question") as! Question
        switch indexPath.row {
        case 0:
            quizType = "Math"
        case 1:
            quizType = "Superhero"
        default:
            quizType = "Science"
        }
            self.present(destination, animated: true, completion: nil)
            
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let rect = CGRect(x: 0, y: 150, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        let tableView = UITableView(frame: rect)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview((tableView))
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "My Alert", message: "Settings go here", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))

        self.present(alert, animated: true, completion: {
            print("This is hte completion handler for the present() code")
        })
    }
    
 
    
}

