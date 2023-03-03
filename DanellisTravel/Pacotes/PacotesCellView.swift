//
//  PacotesCellView.swift
//  DanellisTravel
//
//  Created by Giovanna Danelli Pau on 15/02/23.
//

import Foundation
import UIKit

class PacotesCellView: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        
        setupView()
        configuraConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    lazy var mainView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.alignment = .fill
        view.contentMode = .scaleToFill
        view.spacing = 20
        return view
    }()
    
    lazy var firstView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView(frame: UIScreen.main.bounds)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var firstImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "car")
        return view
    }()
    
    lazy var secondImageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        view.image = UIImage(systemName: "car")
        return view
    }()
    
    lazy var firstTituloVigemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GRAMADO"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 16)
        return label
    }()
    
    lazy var secondTituloVigemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "GRAMADO"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 16)
        return label
    }()
    
    lazy var firstSubtituloVigemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AEREO + HOTEL"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var secondSubtituloVigemLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AEREO + HOTEL"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    
    lazy var firstPrecoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "R$500,00"
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        label.textColor = UIColor.init(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0)
        return label
    }()
    
    lazy var secondPrecoLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "IowanOldStyle-Bold", size: 14)
        label.textColor = UIColor.init(red: 255/255, green: 149/255, blue: 0/255, alpha: 1.0)
        label.text = "R$700,00"
        return label
    }()

    lazy var firstParcelasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "12x sem juros"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    lazy var secondParcelasLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "14x sem juros"
        label.font = UIFont(name: "IowanOldStyle-Roman", size: 14)
        return label
    }()
    
    func setupView() {
        addSubview(mainView)

        mainView.addSubview(firstImageView)
        mainView.addSubview(firstTituloVigemLabel)
        mainView.addSubview(firstSubtituloVigemLabel)

        mainView.addSubview(firstPrecoLabel)
        mainView.addSubview(firstParcelasLabel)
    }
    
    func configuraCelula(_ viagem: Viagem?) {
        firstImageView.image = UIImage(named: viagem?.asset ?? "")
        firstTituloVigemLabel.text = viagem?.titulo ?? ""
        firstSubtituloVigemLabel.text = viagem?.subtitulo ?? ""
        firstPrecoLabel.text = "R$ \(viagem?.preco ?? 0)"
        
        
        DispatchQueue.main.async {
            self.mainView.addSombra()
        }
    }
    
    func configuraConstraints(){
        NSLayoutConstraint.activate([
            self.mainView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            self.mainView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            self.mainView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            self.mainView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            self.firstImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20),
            self.firstImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            self.firstImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            self.firstImageView.heightAnchor.constraint(equalToConstant: 100),

            self.firstTituloVigemLabel.topAnchor.constraint(equalTo: firstImageView.bottomAnchor, constant: 20),
            self.firstTituloVigemLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
//            self.firstTituloVigemLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            
            self.firstSubtituloVigemLabel.topAnchor.constraint(equalTo: firstTituloVigemLabel.bottomAnchor, constant: 5),
            self.firstSubtituloVigemLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
//            self.firstSubtituloVigemLabel.trailingAnchor.constraint(equalTo: firstView.trailingAnchor),
            
            self.firstPrecoLabel.topAnchor.constraint(equalTo: firstSubtituloVigemLabel.bottomAnchor, constant: 10),
            self.firstPrecoLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 20),
            self.firstPrecoLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10),
            
            self.firstParcelasLabel.leadingAnchor.constraint(equalTo: firstPrecoLabel.trailingAnchor, constant: 15),
            self.firstParcelasLabel.centerYAnchor.constraint(equalTo: firstPrecoLabel.centerYAnchor),
    
            ])
            
        }

}
