//
//  VoosCellController.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 27/02/23.
//

import Foundation
import UIKit

protocol VoosCellControllerDelegate: AnyObject {
    func didSelectView(_ viagem: PacotesViewModel?)
}


class VoosCellController: UITableViewCell {
    
    private var customView: VoosCellView = VoosCellView()
    
    weak var delegate: VoosCellControllerDelegate?

}
