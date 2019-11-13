//
//  Coordinates.swift
//  GoogleMapsTestApp
//
//  Created by Andrey on 11.10.2019.
//  Copyright © 2019 Andrey. All rights reserved.
//

import Foundation

class MockCoordinates: ClusterConfiguratorDataSourceProtocol {
    var mapPoints: [MapPointType]

    init() {
        self.mapPoints = [MapPoint(lat: 54.3143937208559, long: 48.39280074899831, name: "Моя хата", snippet: "Дом с Итальянскими колготками", category: .human),
                MapPoint(lat: 54.31453453751755, long: 48.39399189846714, name: "Ленина 79", snippet: "Магазин Юничел", category: .human),
                MapPoint(lat: 54.31705446310348, long: 48.395396352981145, name: "Обитель ада, билет в один конец", snippet: "Кафе Пещера", category: .ufo),
                MapPoint(lat: 54.316864201016855, long: 48.39530404778977, name: "Опыты над молодыми", snippet: "Студ поликлиника", category: .ufo),
                MapPoint(lat: 54.31700500922419, long: 48.39664543232674, name: "Для несмирившихся со старостью", snippet: "Кафе Кавказкая пленница", category: .human),
                MapPoint(lat: 54.31680161943669, long: 48.39639861757195, name: "Побрякушки для иностранных лохов", snippet: "Магазин Симбирский сувенир", category: .ufo),
                MapPoint(lat: 54.31748836150932, long: 48.397805650418135, name: "Бьюти-курятник", snippet: "Салон красоты Стрела Амура", category: .human),
                MapPoint(lat: 54.31698278796098, long: 48.39869811864162, name: "Увлекательные игрушки", snippet: "Магазин Гармония", category: .human),
                MapPoint(lat: 54.32011344766981, long: 48.395078237353424, name: "Забавные вещички", snippet: "Магазин Забава", category: .ufo),
                MapPoint(lat: 54.31979318138892, long: 48.39654719352636, name: "Дом пристарелых танцоров и пИвцов", snippet: "Шипр", category: .ufo),
                MapPoint(lat: 54.32226112530237, long: 48.396030879905155, name: "Обитель ЗОЖа", snippet: "Клуб БКХ", category: .human),
                MapPoint(lat: 54.32044643444846, long: 48.39911144545132, name: "Отель имени гламурной алкашки", snippet: "Отель Хилтон", category: .ufo),
                MapPoint(lat: 54.32234573363721, long: 48.39969400466119, name: "Колыбель мобильной разработки", snippet: "Контора Лучших Программистов", category: .human)]
    }
}
