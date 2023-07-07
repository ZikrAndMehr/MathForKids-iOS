//
//  Protocols.swift
//  MathForKids
//
//  Created by Zokirjon Mamadjonov on 07/07/2023.
//

import Foundation

protocol PreviousViewControllerDelegate: AnyObject {
    func didReceiveData(_ data: [String: Any])
}
