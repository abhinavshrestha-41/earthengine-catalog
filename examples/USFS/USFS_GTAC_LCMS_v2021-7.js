var dataset = ee.ImageCollection('USFS/GTAC/LCMS/v2021-7');

// range: [1985, 2021]
var lcms = dataset.filterDate('2020-06-01')
    .filter('study_area == "CONUS"') // or 'SEAK'
    .first();

Map.addLayer(lcms.select('Land_Cover'), {}, 'Land Cover');
Map.addLayer(lcms.select('Land_Use'), {}, 'Land Use');
Map.addLayer(lcms.select('Change'), {}, 'Vegetation Change');

Map.setCenter(-98.58, 38.14, 4);
