//
//  CartRowStackView.swift
//  Kiosk
//
//  Created by 박진홍 on 11/27/24.
//
//솔님이 작성해주신 스택뷰
import UIKit
import SnapKit

class CartRowStackView: UIStackView {
    
    // UI 요소 정의
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "피자 붕어빵"
        label.font = .systemFont(ofSize: 17)
        label.textColor = UIColor(named: "500")
        return label
    }()
    
    private let minusButton: UIButton = {
        let button = UIButton()
        if let buttonImage = UIImage(named: "IcMinus") {
              button.setBackgroundImage(buttonImage, for: .normal)
            }
            button.clipsToBounds = true
            button.imageView?.contentMode = .scaleAspectFill
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
        if let buttonImage = UIImage(named: "IcPlus") {
              button.setBackgroundImage(buttonImage, for: .normal)
            }
            button.clipsToBounds = true
            button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2,400" + NSLocalizedString("won", comment: "")
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(named: "600")
        label.textAlignment = .right
        return label
    }()
    
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        if let buttonImage = UIImage(named: "IcDelete") {
              button.setBackgroundImage(buttonImage, for: .normal)
            }
            button.clipsToBounds = true
            button.imageView?.contentMode = .scaleAspectFill
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
