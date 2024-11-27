//
//  PurchaseButton.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

class PurchaseButton: UIButton  {
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        setTitle("결제하기", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20)
        backgroundColor = UIColor(red: 226/255, green: 114/255, blue: 0/255, alpha: 1.0)
        layer.cornerRadius = 15
        tintColor = .white
    }
}
