//
//  ButtonStack.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

protocol ButtonStackDelegate: AnyObject {
    func purchaseButtonTapped()
}

class ButtonStack: UIStackView {
    weak var delegate: ButtonStackDelegate?
    @objc private func buttonTapped() {
        delegate?.purchaseButtonTapped()
    }
    
    let emptyButton: EmptyButton = EmptyButton()
    let purchaseButton: PurchaseButton = PurchaseButton()
    
    init() {
        super.init(frame: .zero)
        purchaseButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        setupStackView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //버튼 스택 셋업
    private func setupStackView() {
        axis = .horizontal
        spacing = 10
        alignment = .center
        distribution = .fillEqually
        
        [emptyButton, purchaseButton].forEach {
            addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            emptyButton.heightAnchor.constraint(equalToConstant: 50),
            purchaseButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
