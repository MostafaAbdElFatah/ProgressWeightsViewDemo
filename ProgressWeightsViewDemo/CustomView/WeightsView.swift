//
//  WeightsView.swift
//  ProgressWeightsViewDemo
//
//  Created by Mostafa Abd ElFatah on 1/20/21.
//  Copyright © 2021 MostafaAbdElFatah. All rights reserved.
//

import UIKit

class WeightsView: UIView {
    
    var leastWeight:Int!
    var mostWeight:Int!
    var currentWeight:Int = 0 {
        didSet{
            makeMarkerView()
        }
    }
    
    var weightsList: [Weight] = [] {
        didSet {
            leastWeight = weightsList.first!.from
            mostWeight = weightsList.last!.to
            makeWeightViews()
        }
    }
    
    private(set) var markerView: MarkerView!
    private(set) var weightViews: [UIView] = []
    
    private func makeMarkerView() {
        markerView = MarkerView(frame: .zero)
        markerView.markerNumber = currentWeight
        addSubview(markerView)
    }
    private func makeWeightViews() {
        weightViews = weightsList.map { weight in
            let sview = UIView(frame: .zero)
            sview.backgroundColor = weight.color
            return sview
        }
        weightViews.forEach({
            addSubview($0)
        })
    }
    
    func layoutWeightViews() {
        for i in (0..<weightsList.count) {
            let weight = weightsList[i]
            weightViews[i].frame = convert(weight: weight)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutWeightViews()
        markerView.frame = convert(weight: currentWeight)
        weightViews.first!.roundCorners(corners: [.topLeft, .bottomLeft], radius: 5)
        weightViews.last!.roundCorners(corners: [.topRight, .bottomRight], radius: 5)
        bringSubviewToFront( markerView)
    }
    
    
    func convert(weight:Int) -> CGRect {
        let totalLine:CGFloat = CGFloat(mostWeight - leastWeight)
        let x:CGFloat = (CGFloat(weight - leastWeight) * bounds.width) / totalLine
        return CGRect(x: x - 25, y: 18, width: 50, height: 60)
    }
    
    func convert(weight:Weight) -> CGRect {
        let totalLine:CGFloat = CGFloat(mostWeight - leastWeight)
        let weightLine:CGFloat = CGFloat(weight.to - weight.from)
        let weightWidthLine:CGFloat = (weightLine * bounds.width) / totalLine
        
        let x:CGFloat = (CGFloat(weight.from - leastWeight) * bounds.width) / totalLine
        
        return CGRect(x: x, y: 10, width: weightWidthLine, height: 10)
    }
    
}


extension UIView{
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
