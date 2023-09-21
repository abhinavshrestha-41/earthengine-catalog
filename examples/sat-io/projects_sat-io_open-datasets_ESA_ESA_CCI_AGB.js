var agb = ee.ImageCollection("projects/sat-io/open-datasets/ESA/ESA_CCI_AGB");

var palette = [
  "#C6ECAE",
  "#A1D490",
  "#7CB970",
  "#57A751",
  "#348E32",
  "#267A29",
  "#176520",
  "#0C4E15",
  "#07320D",
  "#031807",
];

var snazzy = require("users/aazuspan/snazzy:styles");
snazzy.addStyle(
  "https://snazzymaps.com/style/15/subtle-grayscale",
  "Greyscale"
);

Map.addLayer(
  agb.filterDate("2009-01-01", "2011-01-01").first().select(["AGB"]),
  { min: 1, max: 450, palette: palette },
  "Above Ground Biomass 2010"
);
Map.addLayer(
  agb.filterDate("2019-01-01", "2021-01-01").first().select(["AGB"]),
  { min: 1, max: 450, palette: palette },
  "Above Ground Biomass 2020"
);
