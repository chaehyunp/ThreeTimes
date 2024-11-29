import Foundation

struct Product: Hashable {//딕셔너리 사용을 위해 Hashable 준수_bom
    let img: String
    let name: String
    let price: String
}

struct ProductData {
    static let productCategories: [String: [Product]] = [
        "finshBun": [
            Product(img: "ImgFishBunRedBean", name: "fishBunRedBean", price: "1000"),
            Product(img: "ImgFishBunCustard", name: "fishBunCustard", price: "1000"),
            Product(img: "ImgFishBunCheese", name: "fishBunCheese", price: "1500"),
            Product(img: "ImgFishBunChoco", name: "fishBunChoco", price: "1500"),
            Product(img: "ImgFishBunPizza", name: "fishBunPizza", price: "2000"),
            Product(img: "ImgFishBunMatcha", name: "fishBunMatcha", price: "2000")
        ],
        "hoppang": [
            Product(img: "ImghoppangHoney", name: "hoppangHoney", price: "1200"),
            Product(img: "ImghoppangBubble", name: "hoppangBubble", price: "1800"),
            Product(img: "ImghoppangRedBean", name: "hoppangRedBean", price: "2000"),
            Product(img: "ImghoppangMatcha", name: "hoppangMatcha", price: "2000"),
            Product(img: "ImghoppangChoco", name: "hoppangChoco", price: "2000"),
        ],
        "skewer": [
            Product(img: "ImgSkewerSoySauce", name: "skewerSoySauce", price: "1200"),
            Product(img: "ImgSkewerGreenOnion", name: "skewerGreenOnion", price: "1500"),
            Product(img: "ImgSkewerHotFried", name: "skewerHotFried", price: "1800"),
            Product(img: "ImgSkewerFried", name: "skewerFried", price: "2000"),
            Product(img: "ImgSkewerHotBar", name: "skewerHotBar", price: "2000")
        ],
        "else": [
            Product(img: "ImgRoastedChestnuts", name: "roastedChestnuts", price: "1200"),
            Product(img: "ImgRoastedSweetPotatoes", name: "roastedSweetPotatoes", price: "1500"),
            Product(img: "ImgTakoyaki", name: "takoyaki", price: "1800"),
            Product(img: "ImgTenWonBread", name: "tenWonBread", price: "2000"),
            Product(img: "ImgDeliManju", name: "deliManju", price: "2000")
        ]
    ]
    static let segmentedControlTitles = ["fishBun", "hoppang", "skewer", "else"]
}


