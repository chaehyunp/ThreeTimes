//
//  CartTableViewCell.swift
//  Kiosk
//
//  Created by 박진홍 on 11/26/24.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    static let identifier: String = "CartTableViewCell"
    private let productRow: CartRowStackView = CartRowStackView(productName: "임시데이터", price: "임시데이터", quantity: "임시데이터") //솔님의 스택뷰
    
    init(style: UITableViewCell.CellStyle = .default,
                  reuseIdentifier: String?,
                  productData: String) {//추후 실제 데이터로 변경
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(productRow)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //테이블뷰 셀 세팅
    func setupInfoStack(data: String) {//추후 실제 데이터 타입으로 변경
        let cell = CartRowStackView(productName: data, price: data, quantity: data)//솔님이 작성한 스택뷰로 변경
        contentView.addSubview(cell)
    }
    
    func configure(with data: String) {
        //productRow의 데이터 구성
        productRow.updateData(productName: data, price: data, quantity: data)
    }
}
