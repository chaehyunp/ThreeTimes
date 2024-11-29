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
    //버튼 셋업
    func setupButton() {
        setTitle(NSLocalizedString("payment", comment: ""), for: .normal)
        setTitleColor(.white, for: .normal)
        setTitleColor(.lightGray, for: .highlighted)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backgroundColor = UIColor(red: 226/255, green: 114/255, blue: 0/255, alpha: 1.0)
        layer.cornerRadius = 15
        tintColor = .white
    }
}
