//
//  PacotesCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation
import UIKit

protocol PacotesCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesViewModel?)
}

class PacotesCellController: UITableViewCell {
    
    private var customView: PacotesCellView = PacotesCellView()
    
    weak var delegate: PacotesCellControllerDelegate?

}
