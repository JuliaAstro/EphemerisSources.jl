#
# This is an autogenerated file! See gen/make.jl for more information.
#

"""
MEX kernels hosted by naif.jpl.nasa.gov as of 2024-09-24. [1]

# Extended Help

## References

[1] https://naif.jpl.nasa.gov/pub/naif/MEX/
"""
const MEX_KERNELS = Base.ImmutableDict(
    "mex_map_sample_v1.bc.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/ck/former_versions/mex_map_sample_v1.bc.pc",
    "mex_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/fk/former_versions/mex_v00.tf",
    "mex_v01.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/fk/former_versions/mex_v01.tf",
    "mex_v02.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/fk/former_versions/mex_v02.tf",
    "mex_v03.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/fk/former_versions/mex_v03.tf",
    "mex_v04.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/fk/former_versions/mex_v04.tf",
    "EarthHighPrecision_2003Jun10.bpc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/pck/former_versions/EarthHighPrecision_2003Jun10.bpc",
    "EarthHighPrecision_2003Jun29.bpc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/pck/former_versions/EarthHighPrecision_2003Jun29.bpc",
    "pck00007.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/pck/former_versions/pck00007.tpc",
    "ORHM_PSTPIX_DB______________00017.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORHM_PSTPIX_DB______________00017.bsp",
    "ORHM_PSTPIX_DB______________00021.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORHM_PSTPIX_DB______________00021.bsp",
    "ORHM_PSTPIX_DB______________00027.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORHM_PSTPIX_DB______________00027.bsp",
    "ORMF_PSTPIX_DB______________00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMF_PSTPIX_DB______________00000.bsp",
    "ORMF_PSTPIX_DB______________00001.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMF_PSTPIX_DB______________00001.bsp",
    "ORMM_PSTPIX_DB_031222180906_00037.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00037.bsp",
    "ORMM_PSTPIX_DB_031222180906_00038.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00038.bsp",
    "ORMM_PSTPIX_DB_031222180906_00039.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00039.bsp",
    "ORMM_PSTPIX_DB_031222180906_00041.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00041.bsp",
    "ORMM_PSTPIX_DB_031222180906_00042.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00042.bsp",
    "ORMM_PSTPIX_DB_031222180906_00044.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00044.bsp",
    "ORMM_PSTPIX_DB_031222180906_00047.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00047.bsp",
    "ORMM_PSTPIX_DB_031222180906_00049.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00049.bsp",
    "ORMM_PSTPIX_DB_031222180906_00051.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031222180906_00051.bsp",
    "ORMM_PSTPIX_DB_031223062213_00030.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031223062213_00030.bsp",
    "ORMM_PSTPIX_DB_031230000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_031230000000_00000.bsp",
    "ORMM_PSTPIX_DB_040201000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00000.bsp",
    "ORMM_PSTPIX_DB_040201000000_00044.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00044.bsp",
    "ORMM_PSTPIX_DB_040201000000_00047.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00047.bsp",
    "ORMM_PSTPIX_DB_040201000000_00049.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00049.bsp",
    "ORMM_PSTPIX_DB_040201000000_00051.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00051.bsp",
    "ORMM_PSTPIX_DB_040201000000_00052.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00052.bsp",
    "ORMM_PSTPIX_DB_040201000000_00055.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00055.bsp",
    "ORMM_PSTPIX_DB_040201000000_00056.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00056.bsp",
    "ORMM_PSTPIX_DB_040201000000_00057.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040201000000_00057.bsp",
    "ORMM_PSTPIX_DB_040301000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040301000000_00000.bsp",
    "ORMM_PSTPIX_DB_040301000000_00055.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040301000000_00055.bsp",
    "ORMM_PSTPIX_DB_040301000000_00056.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040301000000_00056.bsp",
    "ORMM_PSTPIX_DB_040301000000_00057.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040301000000_00057.bsp",
    "ORMM_PSTPIX_DB_040301000000_00060.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040301000000_00060.bsp",
    "ORMM_PSTPIX_DB_040401000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040401000000_00000.bsp",
    "ORMM_PSTPIX_DB_040501000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040501000000_00000.bsp",
    "ORMM_PSTPIX_DB_040601000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040601000000_00000.bsp",
    "ORMM_PSTPIX_DB_040701000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040701000000_00000.bsp",
    "ORMM_PSTPIX_DB_040801000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040801000000_00000.bsp",
    "ORMM_PSTPIX_DB_040901000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_040901000000_00000.bsp",
    "ORMM_PSTPIX_DB_041001000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_041001000000_00000.bsp",
    "ORMM_PSTPIX_DB_041101000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_041101000000_00000.bsp",
    "ORMM_PSTPIX_DB_041201000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_041201000000_00000.bsp",
    "ORMM_PSTPIX_DB_050101000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_050101000000_00000.bsp",
    "ORMM_PSTPIX_DB_050201000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_050201000000_00000.bsp",
    "ORMM_PSTPIX_DB_050301000000_00000.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/ORMM_PSTPIX_DB_050301000000_00000.bsp",
    "beagle2_sample.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/beagle2_sample.bsp.pc",
    "beagle2_sample_v2.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/beagle2_sample_v2.bsp",
    "beagle2_sample_v2.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/beagle2_sample_v2.bsp.pc",
    "de405s.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/de405s.bsp.pc",
    "mar033_2000-2025.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mar033_2000-2025.bsp.pc",
    "mex_cruise.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_cruise.bsp.pc",
    "mex_cruise_sample_v1.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_cruise_sample_v1.bsp.pc",
    "mex_frozen_track_021122_utc.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_frozen_track_021122_utc.bsp.pc",
    "mex_map_sample_v1.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_map_sample_v1.bsp.pc",
    "mex_map_sample_v2.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_map_sample_v2.bsp.pc",
    "mex_map_sample_v3.bsp.pc" => "https://naif.jpl.nasa.gov/pub/naif/MEX/kernels/spk/former_versions/mex_map_sample_v3.bsp.pc",
    "mex_aspera_struct_v10.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20030910/mex_aspera_struct_v10.bsp",
    "mex_v04.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20030910/mex_v04.tf",
    "mex_v04_draft_rev2.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20030910/mex_v04_draft_rev2.tf",
    "mex_aspera_struct_v11.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20031123/mex_aspera_struct_v11.bsp",
    "mex_v05.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20031123/mex_v05.tf",
    "mex_v05.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20031123/scanner_ck_example/mex_v05.tf",
    "naif0007.tls" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20031123/scanner_ck_example/naif0007.tls",
    "mex_v08.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/aspera/20040916/mex_v08.tf",
    "mex_stat_001110.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/jguinn/spk001110/mex_stat_001110.bsp",
    "mars_orbits_jselle021025.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/jselle/mars_orbits_jselle021025.bsp",
    "mex_map_sample_v4.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/jzender/spk020916/mex_map_sample_v4.bsp",
    "lainey_pho_dei.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/lainey/lainey_pho_dei.bsp",
    "mex_nadir_v2.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/nadirfk/mex_nadir_v2.tf",
    "mex_v06.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/nmanaud/mex_v06.tf",
    "mex_frozen_track_021122_utc.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/pmartin/mex_frozen_track_021122_utc.bsp",
    "marxxx_01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rpischel/marxxx_01.bsp",
    "marxxx_01.sun.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rpischel/marxxx_01.sun.bsp",
    "ORMM__060401000000_00232.60sec.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rpischel/resample/ORMM__060401000000_00232.60sec.bsp",
    "mex_hga_struct_v10_dish.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rsimpson/mex_hga_struct_v10_dish.bsp",
    "mex_hga_struct_v10_edge.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rsimpson/mex_hga_struct_v10_edge.bsp",
    "mex_hga_struct_v10_rim.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rsimpson/mex_hga_struct_v10_rim.bsp",
    "mex_hga_struct_v10_rim2.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/rsimpson/mex_hga_struct_v10_rim2.bsp",
    "naif0007.tls" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/svt_sclk/20030219/naif0007.tls",
    "mex_stat_001105.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/tduxbury/spk001105/mex_stat_001105.bsp",
    "mex_stat_001110.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/tduxbury/spk001110/mex_stat_001110.bsp",
    "mex_map_sample_v4.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/tduxbury/spk020916/mex_map_sample_v4.bsp",
    "MEPM_030613OAS_PREDICT__0001.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/tduxbury/spk030703/MEPM_030613OAS_PREDICT__0001.bsp",
    "mex_v04.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/troatsch/20030907/mex_v04.tf",
    "mex_v05.tf" => "https://naif.jpl.nasa.gov/pub/naif/MEX/misc/troatsch/20031216/mex_v05.tf",
)

