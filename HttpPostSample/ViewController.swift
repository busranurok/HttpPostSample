//
//  ViewController.swift
//  HttpPostSample
//
//  Created by Yeni Kullanıcı on 21.09.2020.
//  Copyright © 2020 Busra Nur OK. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var sendMessageButton: UIButton!
    
    var sendURLMessageString : String!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSendMessageVC" {
            let destinationVC = segue.destination as! SendMessageViewController
            destinationVC.responseURLString = sendURLMessageString
        }
    }
    
    
    
    @IBAction func sendMessageClicked(_ sender: Any) {
        
        performSegue(withIdentifier: "toSendVC", sender: nil)
        
    }
    


}

