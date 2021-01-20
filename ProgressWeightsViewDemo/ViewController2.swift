//
//  ViewController.swift
//  ProgressWeightsViewDemo
//
//  Created by Mostafa Abd ElFatah on 1/20/21.
//  Copyright © 2021 MostafaAbdElFatah. All rights reserved.
//

import UIKit


struct Weight {
    let from:Int
    let to:Int
    let color:UIColor
}

class ViewController: UIViewController {

    @IBOutlet weak var weightsView: WeightsView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let weightsList:[Weight] = [                        //110
            Weight(from: 40, to: 57, color: .white),        //19
            Weight(from: 57, to: 76, color: .green),        //15
            Weight(from: 77, to: 92, color: .yellow),       //15
            Weight(from: 92, to: 107, color: .orange),      //15
            Weight(from: 107, to: 129, color: .blue),       //22
            Weight(from: 130, to: 150, color: .red)         //20
        ]
        
        //let weights = Weights(currentWeight: 109, weidgets: weightsList)
        weightsView.weightsList = weightsList
        weightsView.currentWeight = 150
    }
    
}

