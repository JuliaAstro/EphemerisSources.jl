#
# This is an autogenerated file! See gen/make.jl for more information.
#

"""
DEEPIMPACT kernels hosted by naif.jpl.nasa.gov as of 2024-09-24. [1]

# Extended Help

## References

[1] https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/
"""
const DEEPIMPACT_KERNELS = Base.ImmutableDict(
    "di_v17.tf" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/fk/di_v17.tf",
    "di_v18.tf" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/fk/di_v18.tf",
    "naif0008.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/lsk/naif0008.tls",
    "naif0009.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/lsk/naif0009.tls",
    "naif0010.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/lsk/naif0010.tls",
    "naif0011.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/lsk/naif0011.tls",
    "naif0012.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/lsk/naif0012.tls",
    "di_hartley_2_iau2015_v01.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_hartley_2_iau2015_v01.tpc",
    "di_hartley_2_shapeset_v02.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_hartley_2_shapeset_v02.tpc",
    "di_hartley_2_v01.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_hartley_2_v01.tpc",
    "di_hartley_2_v02.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_hartley_2_v02.tpc",
    "di_tempel1_iau2015_v01.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_tempel1_iau2015_v01.tpc",
    "di_tempel1_v01.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_tempel1_v01.tpc",
    "di_tempel1_v02.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/di_tempel1_v02.tpc",
    "pck00008.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/pck/pck00008.tpc",
    "di_finalenc_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/di_finalenc_nav_v1.bsp",
    "di_finalenc_nav_v3.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/di_finalenc_nav_v3.bsp",
    "di_finalenc_nav_v3_to06048.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/di_finalenc_nav_v3_to06048.bsp",
    "di_tempel1_ssd_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/di_tempel1_ssd_v1.bsp",
    "dif_dixi_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/dif_dixi_nav_v1.bsp",
    "dif_epoch_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/dif_epoch_nav_v1.bsp",
    "dif_preenc174_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/dif_preenc174_nav_v1.bsp",
    "dii_preenc174_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/dii_preenc174_nav_v1.bsp",
    "spk_drm238_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/spk_drm238_WithBurn-full.bsp",
    "spk_drm239_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/spk_drm239_WithBurn-full.bsp",
    "140_od226_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/140_od226_NoBurn-full.bsp",
    "spk_drm223_with_tcms-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm223_with_tcms-full.bsp",
    "spk_drm224_Burn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm224_Burn-full.bsp",
    "spk_drm225-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm225-full.bsp",
    "spk_drm226_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm226_WithBurn-full.bsp",
    "spk_drm228_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm228_WithBurn-full.bsp",
    "spk_drm230_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm230_WithBurn-full.bsp",
    "spk_drm231_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm231_WithBurn-full.bsp",
    "spk_drm232_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm232_WithBurn-full.bsp",
    "spk_drm233_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm233_WithBurn-full.bsp",
    "spk_drm236_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm236_WithBurn-full.bsp",
    "spk_drm237_WithBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_drm237_WithBurn-full.bsp",
    "spk_od223_without_tcms-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od223_without_tcms-full.bsp",
    "spk_od224_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od224_NoBurn-full.bsp",
    "spk_od226_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od226_NoBurn-full.bsp",
    "spk_od228_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od228_NoBurn-full.bsp",
    "spk_od229-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od229-full.bsp",
    "spk_od230_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od230_NoBurn-full.bsp",
    "spk_od231_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od231_NoBurn-full.bsp",
    "spk_od232_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od232_NoBurn-full.bsp",
    "spk_od233_NoBurn-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_od233_NoBurn-full.bsp",
    "spk_torres_drm226-full.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/kernels/spk/zzarchive/spk_torres_drm226-full.bsp",
    "140_drm240_Long.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/eom/140_drm240_Long.bsp",
    "di_hartley_2_v01.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/h2_pck/di_hartley_2_v01.tpc",
    "di_v17.tf" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/pds/dif-c_e_x-spice-6-v1.0_old/epxsp_1000/data/fk/di_v17.tf",
    "naif0009.tls" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/pds/dif-c_e_x-spice-6-v1.0_old/epxsp_1000/data/lsk/naif0009.tls",
    "pck00008.tpc" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/pds/dif-c_e_x-spice-6-v1.0_old/epxsp_1000/data/pck/pck00008.tpc",
    "dif_epoch_nav_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/DEEPIMPACT/misc/pds/dif-c_e_x-spice-6-v1.0_old/epxsp_1000/data/spk/dif_epoch_nav_v1.bsp",
)

