//
//  profilePageSettings.swift
//  openMic
//
//  Created by Garrett Spencer on 10/3/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit

protocol changeProfile {
    func transferData(name: String, bio: String)
}

class profilePageSettings: UIViewController {
    
    @IBOutlet weak var userNameEditor: UITextField!
    @IBOutlet weak var bioEditor: UITextField!
    
    var delegate: changeProfile?
    
    @IBAction func saveProfileSettings (_ sender: Any) {
        delegate?.transferData(name: userNameEditor.text!, bio: bioEditor.text!)
        navigationController?.popViewController(animated: true)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let profPage = segue.destination as! profilePage
        profPage.userName = userNameEditor.text!
        profPage.userBio = bioEditor.text!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

}
