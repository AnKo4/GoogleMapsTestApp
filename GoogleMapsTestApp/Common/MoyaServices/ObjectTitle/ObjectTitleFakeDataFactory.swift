//
//  ObjectTitleFakeDataFactory.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 02.12.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class ObjectTitleFakeDataFactory {
    
    static private let fakeData: [ObjectTitleData] = [ObjectTitleData(objectTitle: "65Apps",
                                                                      objectDescription: "Good company",
                                                                      objectRating: RatingInfoData(stars: 5, voicesCount: 107442, agency: "Forbes"),
                                                                      distanceButtonTitle: "10 min walking"),
    ObjectTitleData(objectTitle: "Морг №1",
                    objectDescription: "Временный хостел",
                    objectRating: RatingInfoData(stars: 4,
                                                 voicesCount: 30232,
                                                 agency: "Ассоциация паталогоанатомов России"),
                    distanceButtonTitle: "56 hours fly"),
    ObjectTitleData(objectTitle: "Цирк",
                    objectDescription: "Сплошная клоунада",
                    objectRating: RatingInfoData(stars: 5,
                                                 voicesCount: 23,
                                                 agency: "Психбольница имени Карамзина"),
                    distanceButtonTitle: "1 hour drive"),
    ObjectTitleData(objectTitle: "Шашлычка",
                    objectDescription: "Для гурманов",
                    objectRating: RatingInfoData(stars: 4,
                                                 voicesCount: 1734524,
                                                 agency: "ООН"),
                    distanceButtonTitle: "3 min swim"),
    ObjectTitleData(objectTitle: "МакДак",
                    objectDescription: "Для самоубийц желудка",
                    objectRating: RatingInfoData(stars: 1,
                                                 voicesCount: 324,
                                                 agency: "Animal planet"),
                    distanceButtonTitle: "50 min on metro"),
    ObjectTitleData(objectTitle: "Клуб Ось",
                    objectDescription: "Для малолеток",
                    objectRating: RatingInfoData(stars: 2,
                                                 voicesCount: 4445,
                                                 agency: "Подслушано у школоты"),
                    distanceButtonTitle: "20 min bicycle"),
    ObjectTitleData(objectTitle: "Отель Хилтон",
                    objectDescription: "Первая брачная ночь после свадьбы в кредит",
                    objectRating: RatingInfoData(stars: 3,
                                                 voicesCount: 22033456,
                                                 agency: "ЗАГС"),
                    distanceButtonTitle: "17 days teleporting"),
    ObjectTitleData(objectTitle: "Люк канализационный",
                    objectDescription: "Дверь в ад",
                    objectRating: RatingInfoData(stars: 1,
                                                 voicesCount: 10,
                                                 agency: "Травмпункт"),
                    distanceButtonTitle: "1 sec fall")]
    
    static func data(objectId: Int) -> ObjectTitleData {
        return fakeData[objectId]
    }
}
