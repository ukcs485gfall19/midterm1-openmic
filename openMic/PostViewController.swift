//
//  PostViewController.swift
//  openMic
//
//  Created by Adrian Wyllie on 9/30/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var postView: UITextView!
    var reset:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.postView.selectedRange = NSMakeRange(0, 0)
        self.postView.delegate = self
        self.postView.becomeFirstResponder()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func cancelPressed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        let testObject = PFObject(className: "openMic")
        testObject["text"] = self.postView.text
        testObject["count"] = 0
        testObject["replies"] = 0
        testObject.saveInBackground()
        self.dismiss(animated: true, completion: nil)
    }
}
