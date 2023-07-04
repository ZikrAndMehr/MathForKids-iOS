//
//  ViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 15/06/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction private func playButtonClicked(_ sender: Any) {
        let playMenuVC = PlayMenuViewController(nibName: "PlayMenuViewController", bundle: nil)
        self.navigationController?.pushViewController(playMenuVC, animated: true)
    }
    
    @IBAction private func optionsButtonClicked(_ sender: Any) {
        let optionsVC = OptionsViewController(nibName: "OptionsViewController", bundle: nil)
        self.navigationController?.pushViewController(optionsVC, animated: true)
    }

    @IBAction private func exitButtonClicked(_ sender: Any) {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }
}
