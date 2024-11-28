//
//  CartData.swift
//  Kiosk
//
//  Created by 박진홍 on 11/28/24.
//
/*
 장바구니 데이터를 위한 클래스
 외부에서 필요한 작업 -> '+', '-', 'x', 'get 수량, 가격'
 */
final class CartData {
    private var productsInCart: ProductToQuantity = [Product(img: "ImgFishBunRedBean", name: "팥 붕어빵", price: "1,000원"): 1]
    private(set) var product: Product
    private var totalQuantity: Int = 0
    private var totalPrice: Int = 0
    
    init(product: Product) {
        self.product = product
    }
    
    //총 수량을 재계산 하는 메서드_bom
    private func updateQuantity() {
        totalQuantity = productsInCart.values.reduce(0, +)
    }
    //총 가격 재계산 메서드_bom
    private func updatPrice() {
        totalPrice = 0
        for product in productsInCart.keys {
            if let price = Int(product.price.filter({ $0.isNumber})) {//숫자만 필터링
                totalPrice += price
            }
        }
    }
    //상품 수량 증가
    func increaseProduct(index: Int) {
        updatPrice()
        updateQuantity()
    }
    //상품 수량 감소
    func decreaseProduct(idnex: Int) {
        updatPrice()
        updateQuantity()
    }
    //상품 삭제
    func deleteProduct(index: Int) {
//        productsInCart g하 근데 딕셔너리면 인덱스접그닝 ㅏㄴ 도니네 패스
    }
}


extension CartData {
    typealias ProductToQuantity = [Product: Int]//Int가 뜻하는 바를 전하기 위함
}
