//
//  EmptyCartButotn.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

class EmptyButton: UIButton  {
    var buttonTapped: (() -> Void)?
    init() {
        super.init(frame: .zero)
        setupButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //버튼 셋업
    func setupButton() {
        let color = UIColor(named: "sub2")
        setTitle(NSLocalizedString("cancelAll", comment: ""), for: .normal)
        setTitleColor(color, for: .normal)
        setTitleColor(.gray, for: .highlighted)

        titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        backgroundColor = UIColor(named: "950")
        layer.cornerRadius = 15
        tintColor = .black
        //검정 테두리 추가
        layer.borderColor = UIColor(named: "sub2")?.cgColor
        layer.borderWidth = 2

        layer.cornerRadius = 15
        //클로저콜백
        self.addTarget(self, action: #selector(emptyButtonTapped), for: .touchUpInside)
    }
    
    
    
    @objc private func emptyButtonTapped() {
        buttonTapped?()
    }
}
