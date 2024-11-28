//
//  Untitled.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
import UIKit

class TotalQuantityLabel: UILabel {
    let quantity: Int = 0
    init() {
        super.init(frame: .zero)
        setupLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //레이블 셋업
    private func setupLabel() {
        let total = NSLocalizedString("total", comment: "")
        let gae = NSLocalizedString("gae", comment: "")
        text = "\(total) \(quantity)\(gae)"
        textColor = UIColor(named: "950")
        font = UIFont.systemFont(ofSize: 18, weight: .bold)
        textAlignment = .left
    }
    
    func updateLabel(to quantity: Int) {
        //총 수량 변경 메서드
    }
}
