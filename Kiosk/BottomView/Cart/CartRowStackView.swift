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
    var buttonTapped: ((String) -> Void)?//클로저 콜백을 위한 프로퍼티
    var product: CartData = CartData(product: Product(img: "none", name: "***", price: "0원"))
    
    // UI 요소 정의
    private lazy var productLabel: UILabel = {
        let label = UILabel()
        label.text = product.product.name
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
    
    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "\(self.product.quantity)"
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
    
    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.text = String(product.price)
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
    init() {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        //버튼 액션 설정
        plusButton.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        minusButton.addTarget(self, action: #selector(minusButtonTapped), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        // 레이아웃 설정
        productLabel.snp.makeConstraints{ make in
            make.width.equalTo(120)
        }
        
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
            make.width.height.equalTo(20)
        }
    }
    
    func updateData(product: CartData) {
        self.product = product
        self.productLabel.text = product.product.name
        self.priceLabel.text = String(product.price)
        self.quantityLabel.text = String(product.quantity)
    }
    //버튼 전달
    @objc private func plusButtonTapped() {
        buttonTapped?("increase")
    }
    @objc private func minusButtonTapped() {
        buttonTapped?("decrease")
    }
    @objc private func deleteButtonTapped() {
        buttonTapped?("delete")
    }
}
