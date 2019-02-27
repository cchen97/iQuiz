//
//  Finished.swift
//  iQuiz
//
//  Created by Charlene on 2/17/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class Finished: UIViewController {
    var correct = 0
    var totalQuestions = 0
    var URL = "https://tednewardsandbox.site44.com/questions.json"
    override func viewDidLoad() {
        super.viewDidLoad()

        let questionText = UILabel(frame: CGRect(x: 50, y: 50, width: 200, height: 200))
        questionText.text = "Perfect!"
        let percentText = UILabel(frame: CGRect(x: 50, y: 300, width: 400, height: 400))
        percentText.text = "You got " + String(correct) + " out of " + String(totalQuestions) + " right!"
        let nextButton = UIButton(frame: CGRect(x: 50, y: 500, width: 200, height: 200))
        nextButton.setTitle("Back to home", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
        self.view.addSubview(questionText)
        self.view.addSubview(percentText)
        self.view.addSubview(nextButton)
        
        
    }
    @objc func pressedAction(_ sender: UIButton) {
         let destination = self.storyboard?.instantiateViewController(withIdentifier: "Start") as! ViewController
        destination.url = URL
        self.present(destination, animated: true, completion: nil)
    }
    

}
