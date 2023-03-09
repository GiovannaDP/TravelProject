//
//  DadosDoUsuarioCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 09/03/23.
//

import Foundation
import UIKit

protocol DadosDoUsuarioCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesViewModel?)
}


class DadosDoUsuarioCellController: UITableViewCell {
    
    private var customView: DadosDoUsuarioCell = DadosDoUsuarioCell()
    
    weak var delegate: DadosDoUsuarioCellControllerDelegate?

}
