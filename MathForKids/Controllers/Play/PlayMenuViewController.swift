//
//  PlayMenuViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 17/06/2023.
//

import UIKit

class PlayMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func additionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.addition)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction func subtractionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.subtraction)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction func multiplicationButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.multiplication)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction func divisionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.division)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
}
