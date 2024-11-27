//
//  CartTableViewCell.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit


class CartTableViewCell: UITableViewCell {
    static let identifier: String = "CartTableViewCell"
    private let productRow: CartRowStackView = CartRowStackView() //솔님의 스택뷰
    
    override init(style: UITableViewCell.CellStyle = .default,
                  reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productRow)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //테이블뷰 셀 세팅
    func setupInfoStack(data: String) {//추후 실제 데이터 타입으로 변경
        let cell = CartRowStackView()//솔님이 작성한 스택뷰로 변경
        contentView.addSubview(cell)
    }
    
    func configure(with data: String) {
        //productRow의 데이터 구성
        productRow.updateData()
    }
    
    private func setupConstraints() {
            productRow.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                productRow.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
                productRow.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
                productRow.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
                productRow.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
            ])
        }
}