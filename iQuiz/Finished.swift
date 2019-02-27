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

        let questionText = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        questionText.text = "Perfect!"
        questionText.translatesAutoresizingMaskIntoConstraints = true
        questionText.center = CGPoint(x: view.bounds.midX, y: 50)
        questionText.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        let percentText = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        percentText.text = "You got " + String(correct) + " out of " + String(totalQuestions) + " right!"
        percentText.translatesAutoresizingMaskIntoConstraints = true
        percentText.center = CGPoint(x: view.bounds.midX, y: 150)
        percentText.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
        
        let nextButton = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
        nextButton.setTitle("Back to home", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(pressedAction(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = true
        nextButton.center = CGPoint(x: view.bounds.midX, y: 200)
        nextButton.autoresizingMask = [UIView.AutoresizingMask.flexibleLeftMargin, UIView.AutoresizingMask.flexibleRightMargin, UIView.AutoresizingMask.flexibleTopMargin, UIView.AutoresizingMask.flexibleBottomMargin]
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
