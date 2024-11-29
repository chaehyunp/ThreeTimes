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
    let priceLabel: TotalPriceLabel = TotalPriceLabel()
    let quantityLabel: TotalQuantityLabel = TotalQuantityLabel()
    
    private var cartViewHeight: NSLayoutConstraint!// 카트의 높이 동적 변화를 위한 프로퍼티
    
    init() {
        super.init(frame: .zero)
        setupBottomView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //하단 뷰 셋업
    private func setupBottomView() {
        [cartView, buttons, priceLabel, quantityLabel].forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        setupLayout()
    }
    //레이아웃 셋업
    private func setupLayout() {
        cartViewHeight = cartView.heightAnchor.constraint(equalToConstant: 50)
        NSLayoutConstraint.activate([
            //수량 레이아웃
            quantityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            quantityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            //장바구니 레이아웃
            cartView.topAnchor.constraint(equalTo: quantityLabel.bottomAnchor, constant: 20),
            cartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            cartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            cartViewHeight,
            
            //금액 레이아웃
            priceLabel.topAnchor.constraint(equalTo: cartView.bottomAnchor, constant: 20),
            priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            
            //버튼 레이아웃
            buttons.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 40),
            buttons.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            buttons.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            buttons.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    //장바구니 높이 동적 변화를 위한 메서드
    func updateCartHeight() {
        cartView.layoutIfNeeded()
        let cartHeight = cartView.contentSize.height
//        cartViewHeight.constant = cartHeight
        cartViewHeight.constant = max(cartHeight, 50)
    }
    
    
}
