//
//  ViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 15/06/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func playButtonClicked(_ sender: Any) {
        let playMenuVC = PlayMenuViewController(nibName: "PlayMenuViewController", bundle: nil)
        self.navigationController?.pushViewController(playMenuVC, animated: true)
    }
    
    @IBAction func optionsButtonClicked(_ sender: Any) {
        let optionsVC = OptionsViewController(nibName: "OptionsViewController", bundle: nil)
        self.navigationController?.pushViewController(optionsVC, animated: true)
    }

    @IBAction func exitButtonClicked(_ sender: Any) {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
    }
}

