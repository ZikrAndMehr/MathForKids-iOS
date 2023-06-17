//
//  OptionsViewController.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 16/06/2023.
//

import UIKit

class OptionsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Hide the back button in the navigation bar
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
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
