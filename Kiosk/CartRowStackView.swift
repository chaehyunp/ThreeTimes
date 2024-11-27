//
//  CartRowStackView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
//임시 스택뷰 데이터
import UIKit
import SnapKit

class CartRowStackView: UIStackView {
    
    // UI 요소 정의
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "피자 붕어빵"
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.503, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2,400원"
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    // 초기화
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }
    
    private func setupUI() {
        axis = .horizontal
        spacing = 10
        alignment = .center
        distribution = .fillProportionally
        
        // 수량 조절 스택뷰
        let quantityStackView = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        quantityStackView.axis = .horizontal
        quantityStackView.spacing = 1
        quantityStackView.alignment = .center
        
        // MainStackView에 추가
        addArrangedSubview(productLabel)
        addArrangedSubview(quantityStackView)
        addArrangedSubview(priceLabel)
        addArrangedSubview(deleteButton)
        
        // 레이아웃 설정
        minusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.width.equalTo(40)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.width.height.equalTo(35)
        }
    }
    
    func updateData() {
        //데이터 업데이트
    }
}
