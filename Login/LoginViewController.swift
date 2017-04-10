//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    var width90: CGFloat = 0.0
    var viewhight: CGFloat = 0.0

    
    // Constants used in the LoginViewController
    struct Constants {
//        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)

        


        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
        
        
        // label
        static let labelMargin: CGFloat = 100
        static let labelW: CGFloat = 250
        static let labelH: CGFloat = 30
        static let textColor = UIColor.white
        
        // secondView
        static let secondViewMargin: CGFloat = 130
        static let secondViewH: CGFloat = 200
        
        
    }

    // TODO: instantiate the views needed for your project
    
    var loginLabel: UILabel = {
        let label = UILabel()
        label.text = "LOGIN"
        label.textColor = Constants.textColor
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        return label
    }()
    
    var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.cornerRadius = 10
        return view
    }()
    
    var emailText: UITextField = {
        let textField = UITextField()
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        textField.layer.shadowRadius = 2.0
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 0.0
        
        var placeholder = NSAttributedString(string: "berkeley.edu account name", attributes: [NSForegroundColorAttributeName : UIColor(white: 0.6, alpha: 0.5)])
        textField.attributedPlaceholder=placeholder

        return textField
    }()
    
    var passwordText: UITextField = {
        let textField = UITextField()
        textField.layer.backgroundColor = UIColor.white.cgColor
        textField.layer.masksToBounds = false
        textField.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        textField.layer.shadowRadius = 2.0
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.5
        textField.layer.shadowRadius = 0.0
        
        var placeholder = NSAttributedString(string: "password", attributes: [NSForegroundColorAttributeName : UIColor(white: 0.6, alpha: 0.5)])
        textField.attributedPlaceholder=placeholder
        
        return textField
    }()
    
    var buttonContinue: UIButton = {
        let button = UIButton()
        let borderAlpha : CGFloat = 0.7
        
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        button.setTitle("Get Started", for: UIControlState.normal)
        button.setTitleColor(UIColor.black, for: UIControlState.normal)
        button.backgroundColor = UIColor.clear
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.opacity = 0.5
        button.layer.cornerRadius = 10
        
        
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup background
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "3")?.draw(in: self.view.bounds)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        width90 = view.frame.size.width * 0.9
        viewhight = view.frame.height
        print(viewhight)
        
        // add target to the button (so it will call `loginButton` when pressed)
        buttonContinue.addTarget(self, action: #selector(loginButton), for: .touchDown)
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        view.addSubview(loginLabel)
        view.addSubview(secondView)
        
        secondView.addSubview(emailText)
        secondView.addSubview(passwordText)
        secondView.addSubview(buttonContinue)
        
        // TODO: layout your views using frames or AutoLayout
        
        setupLabelConstraints()
        setupViewConstrains()
        setupEmailTextConstrains()
        setupPassTextConstrains()
        setupContinueConstrains()

    }
    
    // TODO: create an IBAction for your login button
    func setupLabelConstraints(){
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: loginLabel, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.labelW)
        
        let heightConstraint = NSLayoutConstraint(item: loginLabel, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: Constants.labelH)
        
        let horizontalConstraint = NSLayoutConstraint(item: loginLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: loginLabel, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: viewhight * 0.1)
        
        loginLabel.addConstraint(widthConstraint)
        loginLabel.addConstraint(heightConstraint)
        view.addConstraints([horizontalConstraint, topConstraint])
    }
    
    func setupViewConstrains(){
        secondView.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: secondView, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width90)
        
        let heightConstraint = NSLayoutConstraint(item: secondView, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: viewhight * 0.3)
        secondView.addConstraint(widthConstraint)
        secondView.addConstraint(heightConstraint)
        
        let horizontalConstraint = NSLayoutConstraint(item: secondView, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: secondView, attribute: .top, relatedBy: .equal, toItem: loginLabel, attribute: .top, multiplier: 1, constant: viewhight * 0.14)
        
        view.addConstraints([horizontalConstraint, topConstraint])
        
    }
    
    func setupEmailTextConstrains(){
        emailText.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: emailText, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width90 - 30)
        
        let heightConstraint = NSLayoutConstraint(item: emailText, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        emailText.addConstraint(widthConstraint)
        emailText.addConstraint(heightConstraint)
        
        let horizontalConstraint = NSLayoutConstraint(item: emailText, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: emailText, attribute: .top, relatedBy: .equal, toItem: secondView, attribute: .top, multiplier: 1, constant: 50)
        
        view.addConstraints([horizontalConstraint, topConstraint])
    }
    
    func setupPassTextConstrains(){
        passwordText.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: passwordText, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width90 - 30)
        
        let heightConstraint = NSLayoutConstraint(item: passwordText, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 30)
        passwordText.addConstraint(widthConstraint)
        passwordText.addConstraint(heightConstraint)
        
        let horizontalConstraint = NSLayoutConstraint(item: passwordText, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: passwordText, attribute: .top, relatedBy: .equal, toItem: emailText, attribute: .top, multiplier: 1, constant: 50)
        
        view.addConstraints([horizontalConstraint, topConstraint])
    }
    
    func setupContinueConstrains(){
        buttonContinue.translatesAutoresizingMaskIntoConstraints = false
        
        let widthConstraint = NSLayoutConstraint(item: buttonContinue, attribute: .width, relatedBy: .equal,
                                                 toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: width90 - 60)
        
        let heightConstraint = NSLayoutConstraint(item: buttonContinue, attribute: .height, relatedBy: .equal,
                                                  toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 40)
        buttonContinue.addConstraint(widthConstraint)
        buttonContinue.addConstraint(heightConstraint)
        
        let horizontalConstraint = NSLayoutConstraint(item: buttonContinue, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: view, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        
        let topConstraint = NSLayoutConstraint(item: buttonContinue, attribute: .top, relatedBy: .equal, toItem: passwordText, attribute: .top, multiplier: 1, constant: 50)
        
        view.addConstraints([horizontalConstraint, topConstraint])

    }
    
    @IBAction func loginButton(sender: UIButton) {
        authenticateUser(username: emailText.text, password: passwordText.text)
    }
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
