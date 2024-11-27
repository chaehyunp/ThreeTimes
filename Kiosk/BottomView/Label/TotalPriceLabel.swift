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
        label.text = "결제금액"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .left
        return label
    }()
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = "\(self.price)원"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .right
        return label
    }()
    let price: Int = 0
    
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
        //총 금액 변경 메서드
    }
}
