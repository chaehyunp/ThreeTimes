//
//  ViewController.swift
//  Kiosk


import UIKit
import SnapKit
import SwiftUI

class ViewController: UIViewController {
    
    // 상품 이름 Label
    private let productLabel: UILabel = {
        let label = UILabel()
        label.text = "피자 붕어빵" // 상품명
        label.font = .systemFont(ofSize: 17)
        // #808080 색상을 UIColor로 변환하여 적용
        label.textColor = UIColor(red: 0.503, green: 0.502, blue: 0.502, alpha: 1)
        return label
    }()
    
    // 갯수 조절(-)
    private let minusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("−", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        // #C6B2A5 색상을 UIColor로 변환하여 적용
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    // 갯수 표시 Label
    private let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = .systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    // 갯수 조절 (+)
    private let plusButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20)
        // #C6B2A5 색상을 UIColor로 변환하여 적용
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.layer.cornerRadius = 15
        button.tintColor = .white
        return button
    }()
    
    // 가격 표시 Label
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "2,400원" // 가격 표시
        label.font = .systemFont(ofSize: 16)
        label.textColor = UIColor(red: 0.647, green: 0.647, blue: 0.647, alpha: 1)
        label.textAlignment = .right
        return label
    }()
    
    // 삭제 버튼 (×)
    private let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("×", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 23)
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
        quantityStackView.spacing = 1
        quantityStackView.alignment = .center
        
        let mainStackView = UIStackView(arrangedSubviews: [productLabel, quantityStackView, priceLabel, deleteButton])
        mainStackView.axis = .horizontal
        mainStackView.spacing = 10
        mainStackView.alignment = .center
        mainStackView.distribution = .fillProportionally
        
        // StackView를 View에 추가
        view.addSubview(mainStackView)
        
        // AutoLayout 설정!
        mainStackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(17) // 좌우 여백
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
            make.width.height.equalTo(35) // 삭제 버튼 크기
        }
    }
}

// UIViewControllerRepresentable
struct ViewControllerPreview: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        return ViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

#Preview("ViewController") {
    ViewControllerPreview()
}
