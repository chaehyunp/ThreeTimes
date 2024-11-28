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
    //버튼 셋업
    func setupButton() {
        setTitle(NSLocalizedString("cancelAll", comment: ""), for: .normal)
        setTitleColor(.black, for: .normal)
        setTitleColor(.gray, for: .highlighted)
        titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        backgroundColor = .white
        layer.cornerRadius = 15
        tintColor = .black
        //검정 테두리 추가
        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
        layer.cornerRadius = 15
    }
}
