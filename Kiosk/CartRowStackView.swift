//
//  CartRowStackView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
//임시 스택뷰 데이터
import UIKit

class CartRowStackView: UIStackView {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "상품이름"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "4,000"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        return label
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "x1"
        label.font = .systemFont(ofSize: 14)
        label.textColor = .darkGray
        return label
    }()
    
    init(productName: String, price: String, quantity: String) {
        super.init(frame: .zero)
        
        self.axis = .horizontal
        self.alignment = .center
        self.distribution = .fillProportionally
        self.spacing = 8
        
        titleLabel.text = productName
        priceLabel.text = price
        quantityLabel.text = quantity
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(priceLabel)
        addArrangedSubview(quantityLabel)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //데이터 업데이트
    func updateData(productName: String, price: String, quantity: String) {
            titleLabel.text = productName
            priceLabel.text = price
            quantityLabel.text = quantity
        }
}
