//
//  TelaInicialVendasController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation
import UIKit

class TelaInicialVendasController: UIViewController {
    
    private var customView: TelaInicialVendasView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    func buildView() {
        view = TelaInicialVendasView()
        customView = view as? TelaInicialVendasView
    }
}
