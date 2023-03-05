//
//  TelaInicialVendasSemAnuncioController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 22/02/23.
//

import Foundation
import UIKit

class TelaInicialVendasSemAnuncioController: UIViewController {
    
    private var customView: TelaInicialVendasSemAnuncioView? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildView()
    }
    
    func buildView() {
        view = TelaInicialVendasSemAnuncioView()
        customView = view as? TelaInicialVendasSemAnuncioView
    }
}
