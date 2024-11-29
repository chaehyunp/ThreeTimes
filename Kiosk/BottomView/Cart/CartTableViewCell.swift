//
//  CartTableViewCell.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit


class CartTableViewCell: UITableViewCell {
    static let identifier: String = "CartTableViewCell"//셀 재사용을 위한 식별자
    private let productRow: CartRowStackView = CartRowStackView() //솔님의 스택뷰
    var rowTapped: ((String) -> Void)?//클로저 콜백 정의
        
    override init(style: UITableViewCell.CellStyle = .default,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //productRow의 데이터 구성
    func configure(with product: CartData) {
        self.productRow.updateData(product: product)
        updateMinusButton() 
    }
    //테이블뷰 셋업
    private func setupTableView() {
        contentView.addSubview(productRow)
        setupLayout()
        
        productRow.buttonTapped = { [weak self] action in
            self?.rowTapped?(action)
        }
    }
    //akdlsjtm 버튼
    private func updateMinusButton() {
        if productRow.product.quantity == 1 {
            productRow.changeMinusToDelete()
        } else {
            productRow.resetMinusButton()
        }
    }
    
    //셀의 레이아웃 설정
    private func setupLayout() {
            productRow.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                productRow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                productRow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                productRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                productRow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
        }
    
}
