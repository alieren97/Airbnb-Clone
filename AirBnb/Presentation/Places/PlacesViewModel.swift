//
//  PlacesViewModel.swift
//  AirBnb
//
//  Created by Gedikoglu, Ali on 18.03.2023.
//

import UIKit

class PlacesViewModel: PlacesViewModelProtocol {

    var delegate: PlacesViewModelDelegate?

    let categories: [CategoryCellComponentData] = [
        CategoryCellComponentData(title: "Tasarım", image: "sun.min"),
        CategoryCellComponentData(title: "Kuzey Kutbu", image: "snowflake"),
        CategoryCellComponentData(title: "Küçük evler", image: "moon.fill"),
        CategoryCellComponentData(title: "Kubbeler", image: "moon.haze.fill"),
        CategoryCellComponentData(title: "Göl yakınında", image: "cloud.drizzle.fill"),
        CategoryCellComponentData(title: "Olağanüstü", image: "cloud.hail.fill"),
        CategoryCellComponentData(title: "Milli Parklar", image: "snowflake"),
        CategoryCellComponentData(title: "Milli Parklar", image: "snowflake")
    ]

    let places: [Place] = [
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
        Place(placeImages:  [
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!,
            URL(string: "https://a0.muscache.com/im/pictures/72ca78de-ef2b-48a9-a457-e0c66ff0a31b.jpg?im_w=1440")!,
            URL(string: "https://a0.muscache.com/im/pictures/950aadd4-4c99-4cab-abb3-7cb64e4ac1eb.jpg?im_w=1200")!
        ], placeName: "Guyonvelle,Fransa Muhtesem Ev",placeLocation: "Denmark, Copenhagen", placeRank: 4.5, placeDistance: "2.329", placeDate: "28 Ek-6 Kas", placePrice: 2000),
    ]

    func loadCategories() {
        self.notify(.categoryList(CategoryCellComponentListData(list: categories)))
    }

    func loadPlaces() {
        self.notify(.placesList(places))
    }

    private func notify(_ output: PlacesViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }
}
