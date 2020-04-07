//
//  ViewController.swift
//  Santander
//
//  Created by Cátia Souza on 06/04/20.
//  Copyright © 2020 Cátia Souza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userTF: UITextField!
    
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var loginB: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configButton()
        
    }

    @IBAction func loginPressed(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
       
        let controler = storyboard.instantiateViewController(identifier: "user")
        present(controler,animated: true,completion: nil)
    }
    func configButton(){
        loginB.layer.cornerRadius = 4
        loginB.layer.masksToBounds = true
    }
}

