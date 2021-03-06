//
//  loginViewController.swift
//  Twitter
//
//  Created by Avani Hall on 3/5/21.
//  Copyright © 2021 Dan. All rights reserved.
//

import UIKit

class loginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    //once page shows up..
    override func viewDidAppear(_ animated: Bool) {
        
        if UserDefaults.standard.bool(forKey:"userLoggedIn") == true
            {
                self.performSegue(withIdentifier: "loginToHome", sender: self)
            }
     
    }
    
    @IBAction func onLoginButton(_ sender: Any)
    {
        let myURL = "https://api.twitter.com/oauth/request_token"
        TwitterAPICaller.client?.login(url: myURL, success: {
            //stores in memory that user is logged in
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            self.performSegue(withIdentifier: "loginToHome", sender: self)
        }, failure: { (Error) in
            print("Could not log in!")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}