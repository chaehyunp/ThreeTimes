//
//  BottomView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
//상품 총 수량 레이블, 장바구니, 총 가격 레이블, 결제하기, 전체취소, 직원 호출 버튼
//결제, 취소, 호출은 별개의 스택으로 붙여두기
import UIKit

class BottomView: UIView {
    let cartView: CartTableView = CartTableView()
    let buttons: ButtonStack = ButtonStack()
    
    private var cartViewHeight: NSLayoutConstraint!// 카트의 높이 동적 변화를 위한 프로퍼티
    
    init() {
        super.init(frame: .zero)
        setupBottomView()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBottomView() {
        backgroundColor = .lightGray
        [cartView, buttons].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    private func setupLayout() {
        cartViewHeight = cartView.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            //장바구니 레이아웃
            cartView.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            cartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cartViewHeight,
            
            //버튼 레이아웃
            buttons.topAnchor.constraint(equalTo: cartView.bottomAnchor, constant: 20),
            buttons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttons.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
    func updateCartHeight() {
        cartView.layoutIfNeeded()
        let cartHeight = cartView.contentSize.height
        cartViewHeight.constant = cartHeight
    }
}
