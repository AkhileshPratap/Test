//
//  ViewController.swift
//  Test
//
//  Created by Akhilesh Singh on 26/03/21.
//  Copyright © 2021 demo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var calculateAreaTextView: UITextView!
    
    var calulatorViewModel = CalculatorViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyTapped(_ sender: Any) {
        let calculatedValue = calulatorViewModel.calculateValue(values: "((5-7)*8)+3")
        print(calculatedValue)
    }
    
}
