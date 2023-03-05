//
//  VooViewController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 23/02/23.
//

import Foundation
import UIKit

class VooViewController: UIViewController {
    
    private var customView: VooView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
        
    }
    
    func buildView() {
        view = VooView()
        customView = view as? VooView
    }
}

