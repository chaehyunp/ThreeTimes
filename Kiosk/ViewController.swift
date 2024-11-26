//
//  ViewController.swift
//  Kiosk
//
//  Created by CHYUN on 11/25/24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let productUIView: UIView = {
        
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 6
        return view
    }()
    
    
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = UIColor(red: 245.0 / 255.0, green: 245.0 / 255.0, blue: 245.0 / 255.0, alpha: 1.0)
        imageView.layer.cornerRadius = 6
        return imageView
    }()
    
    let productNameLabel: UILabel = {
        let label = UILabel()
        label.text = "붕어빵"
        label.backgroundColor = .white
        label.textColor = .black
        label.font = .systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    let productPriceLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = "1,000원"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    let productLabelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 4
        sv.alignment = .leading
        return sv
    }()
    
    let addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 198/255, green: 178/255, blue: 165/255, alpha: 1.0)
        button.setTitle("+", for: .normal)
        button.tintColor = .white
        button.titleLabel?.font = .boldSystemFont(ofSize: 15)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        configureUI()
        
        setupProductUIView()
    }
    
    func configureUI() {
        
        view.addSubview(productUIView)
        
        productUIView.addSubview(productImageView)
        
        productLabelStackView.addArrangedSubview(productNameLabel)
        productLabelStackView.addArrangedSubview(productPriceLabel)
        
        productUIView.addSubview(productLabelStackView)
        productUIView.addSubview(addButton)
        
    }
    
    // 그리드 안에 들어갈 UI뷰 오토레이아웃
    func setupProductUIView() {
        
        productUIView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(200)
            $0.leading.equalToSuperview().inset(30)
            $0.height.equalTo(186)
            $0.width.equalTo(173)
        }
        
        // 이미지 뷰 오토레이아웃
        productImageView.snp.makeConstraints {
            $0.top.equalTo(productUIView.snp.top).inset(12)
            $0.leading.equalTo(productUIView.snp.leading).inset(12)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(12)
            $0.height.equalTo(112)
        }
        
        // 상품 이름,가격 스택뷰 오토레이아웃
        productLabelStackView.snp.makeConstraints {
            $0.bottom.equalTo(productUIView.snp.bottom).inset(12)
            $0.leading.equalTo(productUIView.snp.leading).inset(8)
        }
        
        // 버튼 오토레이아웃
        addButton.snp.makeConstraints {
            $0.bottom.equalTo(productUIView.snp.bottom).inset(16)
            $0.trailing.equalTo(productUIView.snp.trailing).inset(16)
        }
        
    }
    
    @objc func addButtonTapped() {
        print("상품이 추가되었습니다.")
        
    }
    

}

