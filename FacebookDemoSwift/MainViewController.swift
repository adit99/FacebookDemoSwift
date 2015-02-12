//
//  MainViewController.swift
//  FacebookDemoSwift
//
//  Created by Timothy Lee on 2/11/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var posts : NSArray?
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib(nibName: "PhotoViewCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(nib, forCellReuseIdentifier: "photocell")
     
        let status_nib = UINib(nibName: "StatusViewCell", bundle: NSBundle.mainBundle())
        tableView.registerNib(status_nib, forCellReuseIdentifier: "statuscell")
        
        tableView.rowHeight = UITableViewAutomaticDimension
        
        reload()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func reload() {
        FBRequestConnection.startWithGraphPath("/me/home", parameters: nil, HTTPMethod: "GET") { (connection: FBRequestConnection!, result: AnyObject!, error: NSError!) -> Void in
            //println("\(result)")
            
            self.posts = result["data"] as? NSArray
            //println(self.posts)
            self.tableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let post = posts![indexPath.row] as NSDictionary
        //var cell : UITableViewCell?
        
        if let message = (post["message"] as? NSString) {
            println(message)

            if let pictureURL = (post["picture"] as? NSString) {
                println(pictureURL)
                let cell = tableView.dequeueReusableCellWithIdentifier("photocell") as PhotoViewCell
                cell.imageView?.setImageWithURL(NSURL(string: pictureURL))
                cell.messageLabel.text = message
                return cell
            } else {
                let cell = tableView.dequeueReusableCellWithIdentifier("statuscell") as StatusViewCell
                cell.statusLabel.text = message
                return cell
            }
        
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("statuscell") as StatusViewCell
            cell.statusLabel.text = "No Message"
            return cell
        }
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("called numberOfRowsInSection")
        if let array = posts {
            println(array.count)
            return array.count
        }
        else {
            return 0
        }
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
