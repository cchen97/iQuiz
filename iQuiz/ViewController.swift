//
//  ViewController.swift
//  iQuiz
//
//  Created by Charlene on 2/12/19.
//  Copyright © 2019 Charlene. All rights reserved.
//

import UIKit
import Foundation
import SystemConfiguration

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var quizzes = ["Mathematics", "Marvel Super Heroes", "Science"]
    var quizDetails = ["Challenge yourself with math questions!", "Come have fun with superhero questions!", "Love science? Try our science questions!"]
    var images : [UIImage] = [UIImage(named: "1.png")!,UIImage(named: "2.png")!,UIImage(named: "3.png")! ]
    
    var quizType = 0
    var url = "https://tednewardsandbox.site44.com/questions.json"
    var customURL = false
    
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
        quizType = indexPath.row
        destination.type = quizType
        destination.currentQuestion = 0
        destination.URL = url
        destination.custom = customURL
            self.present(destination, animated: true, completion: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 50, width: self.view.bounds.size.width, height: 50))
        self.view.addSubview(toolBar)
        let settings = UIBarButtonItem(title: "Settings", style: UIBarButtonItem.Style.plain, target: self, action: #selector(alert(_:)))
        toolBar.setItems([settings], animated: false)
        let rect = CGRect(x: 0, y: 150, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        let tableView = UITableView(frame: rect)
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview((tableView))
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func alert(_ sender: Any) {
        let alert = UIAlertController(title: "Enter URL", message: "Enter url to download quiz", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter URL"
            textField.textAlignment = .center
        }
        alert.addAction(UIAlertAction(title: "Check now", style: .destructive, handler: {(a: UIAlertAction!) in
            if !self.isInternetAvailable() {
                    alert.title = "No internet available"
                    alert.addAction(UIAlertAction(title: "Cancel", style: .cancel) { _ in
                        print("Canelled")
                    })
                } else {
                    let textField = alert.textFields?.first
                self.url = textField?.text ?? ""
                    self.customURL = true
                    print("url received")
                }
            }
        ))
        self.present(alert, animated: true, completion: {
            print("This is hte completion handler for the present() code")
        })
    }
    
    func isInternetAvailable() -> Bool {
        var zeroAddress = sockaddr_in()
        zeroAddress.sin_len = UInt8(MemoryLayout.size(ofValue: zeroAddress))
        zeroAddress.sin_family = sa_family_t(AF_INET)
        
        let defaultRouteReachability = withUnsafePointer(to: &zeroAddress) {
            $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {zeroSockAddress in
                SCNetworkReachabilityCreateWithAddress(nil, zeroSockAddress)
            }
        }
        
        var flags = SCNetworkReachabilityFlags()
        if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
            return false
        }
        let isReachable = flags.contains(.reachable)
        let needsConnection = flags.contains(.connectionRequired)
        return (isReachable && !needsConnection)
    }
    
 
    
}

