//
//  TotalPriceLabel.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//

import UIKit

class TotalPriceLabel: UIView {
    private var purchaseLabel: UILabel = {
        let label = UILabel()
        label.text = NSLocalizedString("total", comment: "")
        label.textColor = UIColor(named: "950")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(formatWithComma(self.price))\(NSLocalizedString("won", comment: ""))"
        label.textColor = UIColor(named: "950")
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    var price: Int = 0
    
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //레이블과 레이아웃 셋업
    private func setupLabel() {
        [purchaseLabel, priceLabel].forEach { UILabel in
            addSubview(UILabel)
            UILabel.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            purchaseLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func updateLabel(to price: Int) {
        self.price = price
        self.priceLabel.text = "\(formatWithComma(self.price))\(NSLocalizedString("won", comment: ""))"
    }
    
    func formatWithComma(_ number: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal // 자릿수 쉼표 스타일
        return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
    }
}
