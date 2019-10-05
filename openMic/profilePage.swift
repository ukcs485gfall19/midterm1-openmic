//
//  profilePage.swift
//  openMic
//
//  Created by Garrett Spencer on 10/2/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit

class profilePage: UIViewController {
    
    @IBOutlet weak var userNameView: UITextView!
    @IBOutlet weak var bioView: UITextView!
    
    var userName: String = "User's Name";
    var userBio: String = "Bio";
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func profileSettingsButton(_ sender: Any) {
        let settingsVC = storyboard?.instantiateViewController(withIdentifier: "profilePageSettings") as? profilePageSettings
        settingsVC?.delegate = self
        navigationController?.pushViewController(settingsVC!, animated: true)
    }
    
    
}

extension profilePage: changeProfile{
    func transferData(name: String, bio: String) {
        userNameView.text = name
        bioView.text = bio
    }
}
