//
//  ViewController.swift
//  iQuiz
//
//  Created by Charlene on 2/12/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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

