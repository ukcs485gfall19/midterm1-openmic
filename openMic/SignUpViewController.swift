//
//  SignUpViewController.swift
//  openMic
//
//  Created by Steven Roberts on 10/3/19.
//  Copyright © 2019 Adrian Wyllie. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    let Title = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    var signUpButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupView()
    {

        view.backgroundColor = .white


        Title.text = "Sign Up"
        Title.textColor = .red
        Title.textAlignment = .center
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.font = UIFont.systemFont(ofSize: 40)
//      Title.backgroundColor = .yellow

        usernameTextField.placeholder = "Username"
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.layer.borderColor = UIColor.black.cgColor
        usernameTextField.layer.borderWidth = 2.0

        passwordTextField.layer.borderWidth = 2.0
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.borderColor = UIColor.black.cgColor
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.isSecureTextEntry = true

        signUpButton.backgroundColor = .orange
        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.setTitleColor(.blue, for: .normal)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.addTarget(self, action: #selector (signUpUser), for: .touchUpInside)


        view.addSubview(Title)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signUpButton)

        Title.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        Title.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        Title.widthAnchor.constraint(equalToConstant: 300).isActive = true
        Title.heightAnchor.constraint(equalToConstant: 100).isActive = true

        usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        usernameTextField.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 50).isActive = true
        usernameTextField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        usernameTextField.heightAnchor.constraint(equalToConstant: 25).isActive = true


        passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 10).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: usernameTextField.widthAnchor).isActive = true
        passwordTextField.heightAnchor.constraint(equalTo: usernameTextField.heightAnchor).isActive = true

        signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20).isActive = true
        signUpButton.widthAnchor.constraint(equalTo: passwordTextField.widthAnchor).isActive = true
        signUpButton.heightAnchor.constraint(equalToConstant: 75).isActive = true


    }

    @objc func signUpUser()
    {

        if (usernameTextField.text != "" && passwordTextField.text != "")
        {
            presentHomePage()
        }
        else {
                print("Please sign up!")
        }
    }

    func presentHomePage()
    {
        let destination = TableViewController()
        destination.modalTransitionStyle = .crossDissolve
        present(destination, animated: true, completion: nil)
    }
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destinationViewController.
         Pass the selected object to the new view controller.
    }
    */

}
