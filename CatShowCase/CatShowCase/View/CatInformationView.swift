//
//  CatInformationView.swift
//  CatShowCase
//
//  Created by XIN LIU on 2/14/23.
//

import UIKit

/// Cat Information View to present cat image and cat fact
class CatInformationView: UIView {
    
    /// Label to display cat fact
    private let catFactLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// Image view to display cat image, use center mode to display the original size
    private let catImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addSubviews()
        setupLayouts()
    }
    
    private func addSubviews() {
        addSubview(catImageView)
        addSubview(catFactLabel)
    }
    
    private func setupLayouts() {
        NSLayoutConstraint.activate([
            self.catImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            self.catImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.catImageView.heightAnchor.constraint(equalToConstant: 400),
            self.catImageView.widthAnchor.constraint(equalToConstant: 300)
        ])
        
        NSLayoutConstraint.activate([
            self.catFactLabel.topAnchor.constraint(equalTo: self.catImageView.bottomAnchor, constant: 20),
            self.catFactLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            self.catFactLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.catFactLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -25)
        ])
    }
    
    func configure(image: UIImage, text: String) {
        DispatchQueue.main.async {
            self.catImageView.image = image
            self.catFactLabel.text = text
        }
    }

}

