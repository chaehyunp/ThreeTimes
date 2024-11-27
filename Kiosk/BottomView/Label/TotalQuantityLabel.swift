//
//  Untitled.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

class TotalQuantityLabel: UILabel {
    let quantity: Int = 0
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel() {
        text = "총 \(quantity)개"
        textColor = .black
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textAlignment = .left
    }
    
    func updateLabel(to quantity: Int) {
        //총 수량 변경 메서드
    }
}
