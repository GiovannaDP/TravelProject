//
//  PacotesCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation
import UIKit

protocol PacotesCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: Viagem?)
}

class PacotesCellController: UITableViewCell {
    
    private var customView: PacotesCellView = PacotesCellView()
    
    weak var delegate: PacotesCellControllerDelegate?
    private var viagens: [Viagem]?
    
    func configuraCelula(_ viagem: Viagem?) {
        customView.configuraCelula(viagem)
    }

}
