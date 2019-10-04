//
//  PostViewController.swift
//  openMic
//
//  Created by Adrian Wyllie on 9/30/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit
import Parse

class PostViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var postView: UITextView!
    @IBOutlet weak var postImage: UIImageView!
    @IBOutlet weak var addImageButton: UIButton!
    let imagePicker = UIImagePickerController()
    var reset:Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        self.postView.selectedRange = NSMakeRange(0, 0)
        self.postView.delegate = self
        self.postView.becomeFirstResponder()
        imagePicker.delegate = self
        if (postImage.image == nil) {
            postImage.isHidden = true
            addImageButton.isHidden = false
        } else {
            postImage.isHidden = false
            addImageButton.isHidden = true
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func imageAdd(_ sender: Any) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            postImage.contentMode = .scaleAspectFit
            postImage.image = pickedImage
            postImage.isHidden = false
            addImageButton.isHidden = true
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
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
