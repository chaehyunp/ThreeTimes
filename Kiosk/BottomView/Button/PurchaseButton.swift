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
        setTitle("+", for: .normal)
        titleLabel?.font = .systemFont(ofSize: 20)
        backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        layer.cornerRadius = 15
        tintColor = .white
    }
    
}
