//
//  Products.swift
//  Spotify
//
//  Created by Puneet on 15/10/24.
//

import Foundation

// MARK: - ProductArray
struct ProductArray: Codable {
    let products: [Product]
    let total, skip, limit: Int
}

// MARK: - Product
struct Product: Codable, Identifiable {
    let id: Int
    let title, description: String
    let category: Category
    let price, discountPercentage, rating: Double
    let stock: Int
    let tags: [String]
    let brand: String?
    let sku: String
    let weight: Int
    let dimensions: Dimensions
    let warrantyInformation, shippingInformation: String
    let availabilityStatus: AvailabilityStatus
    let reviews: [Review]
    let returnPolicy: ReturnPolicy
    let minimumOrderQuantity: Int
    let meta: Meta
    let images: [String]
    let thumbnail: String
    
    var firstImage: String {
        images.first ?? Constants.randomImage
    }
    
    static var mock: Product {
        Product(
            id: 123,
            title: "Product Title",
            description: "This is a product description",
            category: Category.beauty,
            price: 999,
            discountPercentage: 10,
            rating: 4,
            stock: 50,
            tags: ["Beauty", "Fragrance", "Perfume"],
            brand: "Gucci",
            sku: "Perfume",
            weight: 5,
            dimensions: Dimensions(width: 5, height: 5, depth: 5),
            warrantyInformation: "",
            shippingInformation: "",
            availabilityStatus: AvailabilityStatus.inStock,
            reviews: [Review(rating: 1, comment: "", date: CreatedAt.the20240523T085621618Z, reviewerName: "", reviewerEmail: "")],
            returnPolicy: ReturnPolicy.the30DaysReturnPolicy,
            minimumOrderQuantity: 1,
            meta: Meta(createdAt: CreatedAt.the20240523T085621618Z, updatedAt: CreatedAt.the20240523T085621618Z, barcode: "", qrCode: ""),
            images: [Constants.randomImage, Constants.randomImage, Constants.randomImage],
            thumbnail: Constants.randomImage
        )
    }
}

enum AvailabilityStatus: String, Codable {
    case inStock = "In Stock"
    case lowStock = "Low Stock"
}

enum Category: String, Codable {
    case beauty = "beauty"
    case fragrances = "fragrances"
    case furniture = "furniture"
    case groceries = "groceries"
}

// MARK: - Dimensions
struct Dimensions: Codable {
    let width, height, depth: Double
}

// MARK: - Meta
struct Meta: Codable {
    let createdAt, updatedAt: CreatedAt
    let barcode: String
    let qrCode: String
}

enum CreatedAt: String, Codable {
    case the20240523T085621618Z = "2024-05-23T08:56:21.618Z"
    case the20240523T085621619Z = "2024-05-23T08:56:21.619Z"
    case the20240523T085621620Z = "2024-05-23T08:56:21.620Z"
}

enum ReturnPolicy: String, Codable {
    case noReturnPolicy = "No return policy"
    case the30DaysReturnPolicy = "30 days return policy"
    case the60DaysReturnPolicy = "60 days return policy"
    case the7DaysReturnPolicy = "7 days return policy"
    case the90DaysReturnPolicy = "90 days return policy"
}

// MARK: - Review
struct Review: Codable {
    let rating: Int
    let comment: String
    let date: CreatedAt
    let reviewerName, reviewerEmail: String
}

struct ProductRow: Identifiable {
    let id = UUID().uuidString
    let title: String
    let products: [Product]
}
