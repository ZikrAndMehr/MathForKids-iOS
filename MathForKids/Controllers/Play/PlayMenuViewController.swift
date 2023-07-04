//
//  PlayMenuViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 17/06/2023.
//

import UIKit

class PlayMenuViewController: UIViewController {
    
    @IBAction private func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction private func additionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.addition)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction private func subtractionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.subtraction)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction private func multiplicationButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.multiplication)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
    
    @IBAction private func divisionButtonClicked(_ sender: Any) {
        let gameModeVC = GameModeViewController(keyOperation: AppConstants.division)
        self.navigationController?.pushViewController(gameModeVC, animated: true)
    }
}
