//
//  MarkerView.swift
//  ProgressWeightsViewDemo
//
//  Created by Mostafa Abd ElFatah on 1/20/21.
//  Copyright © 2021 MostafaAbdElFatah. All rights reserved.
//

import UIKit

class MarkerView: UIView {

    
    var markerNumber:Int = 0{
        didSet{
            numberLabel.text = "\(markerNumber)"
        }
    }
   
    private lazy var imageView: UIImageView = {
        self.backgroundColor = .clear
        let imageView = UIImageView(image: UIImage(named: "marker"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            imageView.leftAnchor.constraint(equalTo: self.leftAnchor),
            imageView.rightAnchor.constraint(equalTo: self.rightAnchor),
        ])
        return imageView
    }()

    private lazy var numberLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 5),
            label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ])
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        bringSubviewToFront(numberLabel)
    }
    
}
