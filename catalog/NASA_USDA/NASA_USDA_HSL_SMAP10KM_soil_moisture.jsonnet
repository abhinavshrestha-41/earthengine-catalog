local id = 'NASA_USDA/HSL/SMAP10KM_soil_moisture';
local subdir = 'NASA_USDA';

local ee_const = import 'earthengine_const.libsonnet';
local ee = import 'earthengine.libsonnet';
local spdx = import 'spdx.libsonnet';

local license = spdx.proprietary;

local basename = std.strReplace(id, '/', '_');
local base_filename = basename + '.json';
local self_ee_catalog_url = ee_const.ee_catalog_url + basename;

{
  stac_version: ee_const.stac_version,
  type: ee_const.stac_type.collection,
  stac_extensions: [
    ee_const.ext_eo,
    ee_const.ext_sci,
  ],
  id: id,
  title: 'NASA-USDA Enhanced SMAP Global Soil Moisture Data',
  'gee:type': ee_const.gee_type.image_collection,
  description: |||
    The NASA-USDA Enhanced SMAP Global soil moisture data provides soil moisture information across
    the globe at 10-km spatial resolution. This dataset includes:
    [surface](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/Surface_Soil_Moisture_SMAP.pdf)
    and [subsurface](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/Sub_SurfaceSoil_Moisture_SMAP.pdf)
    soil moisture (mm),
    [soil moisture profile](ftp://gimms.gsfc.nasa.gov/SMOS/SMAP/SoilMoisture_Profile_SMAP.pdf) (%),
    surface and subsurface soil moisture anomalies (-).

    The dataset is generated by integrating satellite-derived Soil Moisture Active Passive (SMAP)
    Level 3 soil moisture observations into the modified two-layer Palmer model using a 1-D
    Ensemble Kalman Filter (EnKF) data assimilation approach.
    Soil moisture anomalies were computed from the climatology of the day of interest.
    The climatology was estimated based on the full data record of the SMAP satellite observation
    and the 31-day-centered moving-window approach. The assimilation of the SMAP soil moisture
    observations help improve the model-based soil moisture predictions particularly over poorly
    instrumented areas of the world that lack good quality precipitation data.

    This dataset was developed by the Hydrological Science Laboratory at NASA's Goddard Space
    Flight Center in cooperation with USDA Foreign Agricultural Services and USDA Hydrology
    and Remote Sensing Lab.
  |||,
  license: license.id,
  links: ee.standardLinks(subdir, id),
  keywords: [
    'geophysical',
    'hsl',
    'moisture',
    'nasa',
    'smap',
    'soil',
    'usda',
  ],
  providers: [
    ee.producer_provider('NASA GSFC', 'https://gimms.gsfc.nasa.gov/SMOS/SMAP/'),
    ee.host_provider(self_ee_catalog_url),
  ],
  extent: ee.extent(-180.0, -60.0, 180.0, 90.0, '2015-04-02T12:00:00Z', null),
  summaries: {
    gsd: [
      10000.0,
    ],
    'eo:bands': [
      {
        name: 'ssm',
        description: 'Surface soil moisture',
        'gee:units': 'mm',
      },
      {
        name: 'susm',
        description: 'Subsurface soil moisture',
        'gee:units': 'mm',
      },
      {
        name: 'smp',
        description: 'Soil moisture profile',
        'gee:units': 'fraction',
      },
      {
        name: 'ssma',
        description: 'Surface soil moisture anomaly',
        'gee:units': '-',
      },
      {
        name: 'susma',
        description: 'Subsurface soil moisture anomaly',
        'gee:units': '-',
      },
    ],
    'gee:visualizations': [
      {
        display_name: 'Soil Moisture',
        lookat: {
          lat: -6.746,
          lon: 46.529,
          zoom: 2,
        },
        image_visualization: {
          band_vis: {
            min: [
              0.0,
            ],
            max: [
              28.0,
            ],
            palette: [
              '0300ff',
              '418504',
              'efff07',
              'efff07',
              'ff0303',
            ],
            bands: [
              'ssm',
            ],
          },
        },
      },
    ],
    ssm: {
      minimum: 0.0,
      maximum: 25.39,
      'gee:estimated_range': true,
    },
    susm: {
      minimum: 0.0,
      maximum: 274.6,
      'gee:estimated_range': true,
    },
    smp: {
      minimum: 0.0,
      maximum: 1.0,
      'gee:estimated_range': true,
    },
    ssma: {
      minimum: -4.0,
      maximum: 4.0,
      'gee:estimated_range': true,
    },
    susma: {
      minimum: -4.0,
      maximum: 4.0,
      'gee:estimated_range': true,
    },
  },
  'sci:citation': |||

    **Sazib, N., J. D. Bolten, and I. E. Mladenova. 2021.**
    Leveraging NASA Soil Moisture Active Passive for Assessing Fire
    Susceptibility and Potential Impacts Over Australia and California.
    *IEEE Journal of Selected Topics in Applied Earth Observations and
    Remote Sensing*, 15: 779-787.
    [doi:10.1109/jstars.2021.3136756](https://doi.org/10.1109/jstars.2021.3136756)

    **Mladenova, I.E., Bolten, J.D., Crow, W., Sazib, N. and Reynolds, C., 2020.**
    Agricultural drought monitoring via the assimilation of SMAP soil moisture retrievals into a
    global soil water balance model. *Front. Big Data*,
    3(10).
    [doi:10.3389/fdata.2020.00010](https://doi.org/10.3389/fdata.2020.00010)
  |||,
  'sci:publications': [
    {
      citation: |||
        **Sazib, N., J. D. Bolten, and I. E. Mladenova. 2021.**
        Leveraging NASA Soil Moisture Active Passive for Assessing Fire
        Susceptibility and Potential Impacts Over Australia and California.
        *IEEE Journal of Selected Topics in Applied Earth Observations and
        Remote Sensing*, 15: 779-787.
        [doi:10.1109/jstars.2021.3136756](https://doi.org/10.1109/jstars.2021.3136756)
      |||,
      doi: '10.1109/jstars.2021.3136756'
    },
    {
      citation: |||
        **Mladenova, I.E., Bolten, J.D., Crow, W.T., Sazib, N., Cosh, M.H., Tucker, C.J. and Reynolds,
        C., 2019.**
        Evaluating the operational application of SMAP for global agricultural drought monitoring.
        *IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing*,
        12(9): 3387-3397.
        [doi:10.1109/JSTARS.2019.2923555](https://doi.org/10.1109/JSTARS.2019.2923555)
      |||,
      doi: '10.1109/JSTARS.2019.2923555',
    },
    {
      citation: |||
        **Sazib, N., Mladenova, I., & Bolten, J. (2020).**
        Assessing the Impact of ENSO on Agriculture over Africa using Earth Observation Data.
        *Frontiers in Sustainable Food Systems*, 4, 188.
        [doi:10.3389/fsufs.2020.509914](https://doi.org/10.3389/fsufs.2020.509914)
        [Google Scholar](https://scholar.google.com/scholar?cluster=10102210156681705582&oi=scholarr)
      |||,
      doi: '10.3389/fsufs.2020.509914',
    },
    {
      citation: |||
        **Sazib, N., Mladenova, I. and Bolten, J., 2018.**
        Leveraging the google earth engine for drought assessment using global soil moisture data.
        *Remote sensing*,
        10(8): 1265.
        [doi:10.3390/rs10081265](https://doi.org/10.3390/rs10081265)
      |||,
      doi: '10.3390/rs10081265',
    },
    {
      citation: |||
        **Bolten, J., W.T. Crow, X. Zhan, T.J. Jackson, and C.A. Reynolds (2010).**
        Evaluating the Utility of Remotely Sensed Soil Moisture Retrievals for Operational Agricultural
        Drought Monitoring, *IEEE Transactions on Geoscience and Remote Sensing*,
        3(1): 57-66.
        [doi:10.1109/JSTARS.2009.2037163](https://doi.org/10.1109/JSTARS.2009.2037163)
        [Google Scholar](https://scholar.google.com/scholar?as_sdt=0%2C21&q=Improved+prediction+of+quasi-global+vegetation+conditions+using+remotely-sensed+surface+soil+moisture%2C+&btnG=)
      |||,
      doi: '10.1109/JSTARS.2009.2037163',
    },
    {
      citation: |||
        **Bolten, J., and W. T. Crow (2012).**
        Improved prediction of quasi-global vegetation conditions using remotely sensed surface soil
        moisture, *Geophysical Research Letters*,
        39: (L19406).
        [doi:10.1029/2012GL053470][https://doi.org/10.1029/2012GL053470]
        [Google Scholar](https://scholar.google.com/scholar?as_sdt=0%2C21&q=Improved+prediction+of+quasi-global+vegetation+conditions+using+remotely-sensed+surface+soil+moisture%2C+&btnG=)
      |||,
      doi: '10.1029/2012GL053470',
    },
    {
      citation: |||
        **Entekhabi, D, Njoku, EG, O'Neill, PE, Kellogg, KH, Crow, WT, Edelstein,
        WN, Entin, JK, Goodman, SD, Jackson, TJ, Johnson, J, Kimball, J, Piepmeier,
        JR, Koster, RD, Martin, N, McDonald, KC, Moghaddam, M, Moran, S, Reichle,
        R, Shi, JC, Spencer, MW, Thurman, SW, Tsang, L & Van Zyl, J (2010).**
        The soil moisture active passive (SMAP) mission, *Proceedings of the IEEE*,
        98(5): 704-716.
        [doi:10.1109/JPROC.2010.2043918](https://doi.org/10.1109/JPROC.2010.2043918)
      |||,
      doi: '10.1109/JPROC.2010.2043918',
    },
    {
      citation: |||
        **I. E. Mladenova, J.D. Bolten, W.T. Crow, M.C. Anderson, C.R. Hain, D.M. Johnson, R. Mueller
        (2017).** Intercomparison of Soil Moisture, Evaporative Stress, and Vegetation Indices for
        Estimating Corn and Soybean Yields Over the U.S.,
        *IEEE Journal of Selected Topics in Applied Earth Observations and Remote Sensing*,
        10(4): 1328-1343.
        [doi:10.1109/JSTARS.2016.2639338](https://doi.org/10.1109/JSTARS.2016.2639338)
      |||,
      doi: '10.1109/JSTARS.2016.2639338',
    },
    {
      citation: |||
        **O'Neill, P. E., S. Chan, E. G. Njoku, T. Jackson, and R. Bindlish
        (2016).**
         SMAP L3 Radiometer Global Daily 36 km EASE-Grid Soil Moisture, Version 4.
         Boulder, Colorado USA. NASA National Snow and Ice Data Center Distributed
         Active Archive Center.
         [doi:10.5067/ZX7YX2Y2LHEB](https://doi.org/10.5067/ZX7YX2Y2LHEB)
      |||,
      doi: '10.5067/ZX7YX2Y2LHEB',
    },
  ],
  'gee:interval': {
    type: 'cadence',
    unit: 'day',
    interval: 3,
  },
  'gee:terms_of_use': |||
    This dataset is in the public domain and is available
    without restriction on use and distribution. See [NASA's
    Earth Science Data & Information Policy](https://science.nasa.gov/earth-science/earth-science-data/data-information-policy)
    for additional information.
  |||,
  'gee:user_uploaded': true,
}
