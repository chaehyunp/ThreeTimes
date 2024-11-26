//
//  ViewController.swift
//  Kiosk


import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // 상품 이름 Label
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "피자붕어빵" // 상품명
        label.font = .systemFont(ofSize: 17)
        label.textColor = .black
        return label
    }()
    
    // 갯수 조절(-)
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    // 갯수 표시 Label
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    // 갯수 조절 (+)
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    // 가격 표시 Label
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "1,500원" // 가격 표시
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    // 삭제 버튼 (×)
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 15
        button.tintColor = .black
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // 가독성 향상!
        setupUI()
    }
    
    private func setupUI() {
        // StackView 생성
        let quantityStackView = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        quantityStackView.axis = .horizontal
        quantityStackView.spacing = 10
        quantityStackView.alignment = .center
        
        let mainStackView = UIStackView(arrangedSubviews: [productLabel, quantityStackView, priceLabel, deleteButton])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 30
        mainStackView.alignment = .center
        mainStackView.distribution = .fillProportionally
        
        // StackView를 View에 추가
        view.addSubview(mainStackView)
        
        // AutoLayout 설정!
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10) // 좌우 여백
        }
        
        minusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        plusButton.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 버튼 크기
        }
        
        quantityLabel.snp.makeConstraints { make in
            make.width.equalTo(40) // 수량 표시 크기
        }
        
        deleteButton.snp.makeConstraints { make in
            make.width.height.equalTo(30) // 삭제 버튼 크기
        }
    }
}
