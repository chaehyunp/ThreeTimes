//
//  EmptyCartButotn.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

class EmptyButton: UIButton  {
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
        backgroundColor = .white
        layer.cornerRadius = 15
        tintColor = .white
        //검정 테두리 추가
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 15
    }
}
