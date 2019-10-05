//
//  ViewController.swift
//  openMic
//
//  Created by Adrian Wyllie on 9/12/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let userNameTextField = UITextField()
    let passwordTextField = UITextField()
    let loginButton = UIButton()
    var signInDictionary = [String:String] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func setupView()
    {
        
        let Title = UILabel()
        Title.text = "Log In"
        Title.textColor = .blue
        Title.translatesAutoresizingMaskIntoConstraints = false
//          Title.backgroundColor = .yellow
        Title.font = UIFont.systemFont(ofSize: 36)
        Title.textAlignment = .center
        
        
        
        
            // Why was it never mutated?
            // let is a constant , var is a variable
            // colons definitions , = is a definition
        userNameTextField.placeholder = "Username"
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.layer.borderColor = UIColor.black.cgColor
        userNameTextField.layer.borderWidth = 2.0
        
        
        
            // Why was it never mutated?
        passwordTextField.placeholder = "Password"
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.isSecureTextEntry = true
            //keyboard will not pop up
        passwordTextField.becomeFirstResponder()
        
        loginButton.backgroundColor = .green
        loginButton.setTitle("Log In", for: .normal)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.setTitleColor(.blue, for: .normal)
        loginButton.addTarget(self, action: #selector (loginUser), for: .touchUpInside)
        
        
        view.backgroundColor = .white
            // pass the labels/ text fields to the view
        view.addSubview(Title)
        view.addSubview(userNameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        
            // x/y coordinates, height and width factors
        Title.centerXAnchor.constraint(equalTo: view.centerXAnchor ).isActive = true
        Title.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        Title.heightAnchor.constraint(equalToConstant: 200).isActive = true
        Title.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        userNameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        userNameTextField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        userNameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        userNameTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 325).isActive = true
        passwordTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true
        passwordTextField.widthAnchor.constraint(equalToConstant: 250).isActive = true
        
        
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.centerYAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        
        

        
    }
    
    @objc func loginUser() {
        
        print("Username: " + userNameTextField.text!)
        print("Password: " + passwordTextField.text!)
        if (userNameTextField.text != "" && passwordTextField.text != "")
        {
            if (signInDictionary[userNameTextField.text!] == nil)
            {
                signInDictionary[userNameTextField.text!] = passwordTextField.text!
                presentSignInPage()
            }
            else
            {
                presentHomePage()
                print("Glad to see you back!")
            }
        }
        else
        {
            print("Please sign in!")
        }
    }
    
    func presentHomePage()
    {
       print("Welcome")
        let destination = TableViewController()
        destination.modalTransitionStyle = .crossDissolve
        print("Presenting table view controller")
        present(TableViewController(), animated: true)
        {
            print("Clearing text fields")
            self.clearTextFields()
        }
        print("Printing ")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
    }
    func clearTextFields()
    {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    func presentSignInPage()
    {
        print("Hold on, we got you!")
        let destination = SignUpViewController()
        destination.modalTransitionStyle = .crossDissolve
        present(SignUpViewController(), animated: true, completion: nil)
    }

}


