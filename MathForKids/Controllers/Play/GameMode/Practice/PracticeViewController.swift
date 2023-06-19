//
//  PracticeViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 18/06/2023.
//

import UIKit

class PracticeViewController: UIViewController {
    
    @IBOutlet weak var currentQuestionNumber: UILabel!
    
    @IBOutlet weak var numberOfCorrectQuestion: UILabel!
    @IBOutlet weak var numberOfWrongQuestion: UILabel!
    
    @IBOutlet weak var a: UILabel!
    @IBOutlet weak var operation: UILabel!
    @IBOutlet weak var b: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupQuestion()
    }
    
    private func setupQuestion() {
        
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func optionAClicked(_ sender: Any) {
    }
    
    @IBAction func optionBClicked(_ sender: Any) {
    }
    
    @IBAction func optionCClicked(_ sender: Any) {
    }
    
    @IBAction func optionDClicked(_ sender: Any) {
    }
}
