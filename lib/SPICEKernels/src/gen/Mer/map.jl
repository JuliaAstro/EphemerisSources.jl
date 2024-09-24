#
# This is an autogenerated file! See gen/make.jl for more information.
#

"""
MER kernels hosted by naif.jpl.nasa.gov as of 2024-09-24. [1]

# Extended Help

## References

[1] https://naif.jpl.nasa.gov/pub/naif/MER/
"""
const MER_KERNELS = Base.ImmutableDict(
    "mer1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1.tf",
    "mer1_tp_tm20b3_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_tp_tm20b3_iau2000_v1.tf",
    "mer1_v01.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v01.tf",
    "mer1_v05.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v05.tf",
    "mer1_v06.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v06.tf",
    "mer1_v07.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v07.tf",
    "mer1_v09.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v09.tf",
    "mer1_v10.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v10.tf",
    "mer1_v11.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer1_v11.tf",
    "mer2.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2.tf",
    "mer2_tp_ep55a3_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_tp_ep55a3_iau2000_v1.tf",
    "mer2_tp_ep78a3p_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_tp_ep78a3p_iau2000_v1.tf",
    "mer2_v01.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v01.tf",
    "mer2_v03.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v03.tf",
    "mer2_v04.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v04.tf",
    "mer2_v05.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v05.tf",
    "mer2_v06.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v06.tf",
    "mer2_v09.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v09.tf",
    "mer2_v10.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/mer2_v10.tf",
    "mer1_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/mer1_v00.tf",
    "mer2_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/mer2_v00.tf",
    "mera_ll_ep55a2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/mera_ll_ep55a2_iau1991_v1.tf",
    "mera_ll_ip84a2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/mera_ll_ip84a2_iau1991_v1.tf",
    "mera_ll_tm10a2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/mera_ll_tm10a2_iau1991_v1.tf",
    "mera_ll_vm41a2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/mera_ll_vm41a2_iau1991_v1.tf",
    "mera_ll_vm53a2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/mera_ll_vm53a2_iau1991_v1.tf",
    "merb_ll_ep49b2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/merb_ll_ep49b2_iau1991_v1.tf",
    "merb_ll_ip96b2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/merb_ll_ip96b2_iau1991_v1.tf",
    "merb_ll_tm20b2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/merb_ll_tm20b2_iau1991_v1.tf",
    "merb_ll_vm53b2_iau1991_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver1/merb_ll_vm53b2_iau1991_v1.tf",
    "mera_tp_ep55a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/mera_tp_ep55a2_iau2000_v1.tf",
    "mera_tp_ip84a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/mera_tp_ip84a2_iau2000_v1.tf",
    "mera_tp_tm10a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/mera_tp_tm10a2_iau2000_v1.tf",
    "mera_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/mera_v00.tf",
    "merb_tp_ep78b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/merb_tp_ep78b2_iau2000_v1.tf",
    "merb_tp_ip96b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/merb_tp_ip96b2_iau2000_v1.tf",
    "merb_tp_tm20b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/merb_tp_tm20b2_iau2000_v1.tf",
    "merb_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver2_bad_id/merb_v00.tf",
    "mer1_tp_ep78b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer1_tp_ep78b2_iau2000_v1.tf",
    "mer1_tp_ip96b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer1_tp_ip96b2_iau2000_v1.tf",
    "mer1_tp_tm20b2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer1_tp_tm20b2_iau2000_v1.tf",
    "mer2_tp_ep55a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer2_tp_ep55a2_iau2000_v1.tf",
    "mer2_tp_ip84a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer2_tp_ip84a2_iau2000_v1.tf",
    "mer2_tp_tm10a2_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/fk/zzarchive/ver3_prelaunch_final/mer2_tp_tm10a2_iau2000_v1.tf",
    "naif0007.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0007.tls",
    "naif0008.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0008.tls",
    "naif0009.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0009.tls",
    "naif0010.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0010.tls",
    "naif0011.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0011.tls",
    "naif0012.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/lsk/naif0012.tls",
    "mars_iau2000_v0.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/pck/mars_iau2000_v0.tpc",
    "mer_mars_iau1991.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/pck/zzarchive/mer_mars_iau1991.tpc",
    "de405s.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/de405s.bsp",
    "de410.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/de410.bsp",
    "de410_de910.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/de410_de910.bsp",
    "mar033.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mar033.bsp",
    "mar033_2000-2025.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mar033_2000-2025.bsp",
    "mer1_cruise.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_cruise.bsp",
    "mer1_edl_rcb_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_edl_rcb_v1.bsp",
    "mer1_ls_040128_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_ls_040128_iau2000_v1.bsp",
    "mer1_still_at_ls_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_still_at_ls_v1.bsp",
    "mer1_struct_ver11.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_struct_ver11.bsp",
    "mer1_surf_iddg.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg.bsp",
    "mer1_surf_iddg_ext10_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext10_v1.bsp",
    "mer1_surf_iddg_ext11_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext11_v1.bsp",
    "mer1_surf_iddg_ext12_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext12_v1.bsp",
    "mer1_surf_iddg_ext13_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext13_v1.bsp",
    "mer1_surf_iddg_ext14_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext14_v1.bsp",
    "mer1_surf_iddg_ext15_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext15_v1.bsp",
    "mer1_surf_iddg_ext16_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext16_v1.bsp",
    "mer1_surf_iddg_ext17_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext17_v1.bsp",
    "mer1_surf_iddg_ext18_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext18_v1.bsp",
    "mer1_surf_iddg_ext19_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext19_v1.bsp",
    "mer1_surf_iddg_ext1_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext1_v1.bsp",
    "mer1_surf_iddg_ext20_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext20_v1.bsp",
    "mer1_surf_iddg_ext21_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext21_v1.bsp",
    "mer1_surf_iddg_ext22_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext22_v1.bsp",
    "mer1_surf_iddg_ext23_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext23_v1.bsp",
    "mer1_surf_iddg_ext24_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext24_v1.bsp",
    "mer1_surf_iddg_ext25_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext25_v1.bsp",
    "mer1_surf_iddg_ext26_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext26_v1.bsp",
    "mer1_surf_iddg_ext27_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext27_v1.bsp",
    "mer1_surf_iddg_ext28_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext28_v1.bsp",
    "mer1_surf_iddg_ext29_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext29_v1.bsp",
    "mer1_surf_iddg_ext2_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext2_v1.bsp",
    "mer1_surf_iddg_ext30_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext30_v1.bsp",
    "mer1_surf_iddg_ext31_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext31_v1.bsp",
    "mer1_surf_iddg_ext32_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext32_v1.bsp",
    "mer1_surf_iddg_ext33_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext33_v1.bsp",
    "mer1_surf_iddg_ext34_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext34_v1.bsp",
    "mer1_surf_iddg_ext35_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext35_v1.bsp",
    "mer1_surf_iddg_ext36_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext36_v1.bsp",
    "mer1_surf_iddg_ext37_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext37_v1.bsp",
    "mer1_surf_iddg_ext38_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext38_v1.bsp",
    "mer1_surf_iddg_ext39_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext39_v1.bsp",
    "mer1_surf_iddg_ext3_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext3_v1.bsp",
    "mer1_surf_iddg_ext40_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext40_v1.bsp",
    "mer1_surf_iddg_ext41_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext41_v1.bsp",
    "mer1_surf_iddg_ext42_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext42_v1.bsp",
    "mer1_surf_iddg_ext43_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext43_v1.bsp",
    "mer1_surf_iddg_ext44_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext44_v1.bsp",
    "mer1_surf_iddg_ext45_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext45_v1.bsp",
    "mer1_surf_iddg_ext46_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext46_v1.bsp",
    "mer1_surf_iddg_ext47_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext47_v1.bsp",
    "mer1_surf_iddg_ext48_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext48_v1.bsp",
    "mer1_surf_iddg_ext49_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext49_v1.bsp",
    "mer1_surf_iddg_ext4_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext4_v1.bsp",
    "mer1_surf_iddg_ext50_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext50_v1.bsp",
    "mer1_surf_iddg_ext51_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext51_v1.bsp",
    "mer1_surf_iddg_ext52_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext52_v1.bsp",
    "mer1_surf_iddg_ext53_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext53_v1.bsp",
    "mer1_surf_iddg_ext54_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext54_v1.bsp",
    "mer1_surf_iddg_ext55_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext55_v1.bsp",
    "mer1_surf_iddg_ext56_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext56_v1.bsp",
    "mer1_surf_iddg_ext5_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext5_v1.bsp",
    "mer1_surf_iddg_ext6_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext6_v1.bsp",
    "mer1_surf_iddg_ext7_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext7_v1.bsp",
    "mer1_surf_iddg_ext8_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext8_v1.bsp",
    "mer1_surf_iddg_ext9_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_ext9_v1.bsp",
    "mer1_surf_iddg_prim_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_iddg_prim_v1.bsp",
    "mer1_surf_rover.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover.bsp",
    "mer1_surf_rover_0001_3240_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_0001_3240_v1.bsp",
    "mer1_surf_rover_cs.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_cs.bsp",
    "mer1_surf_rover_ext10_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext10_v1.bsp",
    "mer1_surf_rover_ext11_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext11_v1.bsp",
    "mer1_surf_rover_ext12_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext12_v1.bsp",
    "mer1_surf_rover_ext13_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext13_v1.bsp",
    "mer1_surf_rover_ext14_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext14_v1.bsp",
    "mer1_surf_rover_ext15_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext15_v1.bsp",
    "mer1_surf_rover_ext16_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext16_v1.bsp",
    "mer1_surf_rover_ext17_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext17_v1.bsp",
    "mer1_surf_rover_ext18_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext18_v1.bsp",
    "mer1_surf_rover_ext19_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext19_v1.bsp",
    "mer1_surf_rover_ext1_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext1_v1.bsp",
    "mer1_surf_rover_ext20_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext20_v1.bsp",
    "mer1_surf_rover_ext21_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext21_v1.bsp",
    "mer1_surf_rover_ext22_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext22_v1.bsp",
    "mer1_surf_rover_ext23_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext23_v1.bsp",
    "mer1_surf_rover_ext24_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext24_v1.bsp",
    "mer1_surf_rover_ext25_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext25_v1.bsp",
    "mer1_surf_rover_ext26_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext26_v1.bsp",
    "mer1_surf_rover_ext27_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext27_v1.bsp",
    "mer1_surf_rover_ext28_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext28_v1.bsp",
    "mer1_surf_rover_ext29_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext29_v1.bsp",
    "mer1_surf_rover_ext2_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext2_v1.bsp",
    "mer1_surf_rover_ext30_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext30_v1.bsp",
    "mer1_surf_rover_ext31_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext31_v1.bsp",
    "mer1_surf_rover_ext32_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext32_v1.bsp",
    "mer1_surf_rover_ext33_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext33_v1.bsp",
    "mer1_surf_rover_ext34_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext34_v1.bsp",
    "mer1_surf_rover_ext36_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext36_v1.bsp",
    "mer1_surf_rover_ext37_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext37_v1.bsp",
    "mer1_surf_rover_ext38_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext38_v1.bsp",
    "mer1_surf_rover_ext39_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext39_v1.bsp",
    "mer1_surf_rover_ext3_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext3_v1.bsp",
    "mer1_surf_rover_ext40_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext40_v1.bsp",
    "mer1_surf_rover_ext41_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext41_v1.bsp",
    "mer1_surf_rover_ext42_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext42_v1.bsp",
    "mer1_surf_rover_ext43_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext43_v1.bsp",
    "mer1_surf_rover_ext44_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext44_v1.bsp",
    "mer1_surf_rover_ext45_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext45_v1.bsp",
    "mer1_surf_rover_ext46_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext46_v1.bsp",
    "mer1_surf_rover_ext47_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext47_v1.bsp",
    "mer1_surf_rover_ext48_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext48_v1.bsp",
    "mer1_surf_rover_ext49_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext49_v1.bsp",
    "mer1_surf_rover_ext4_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext4_v1.bsp",
    "mer1_surf_rover_ext50_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext50_v1.bsp",
    "mer1_surf_rover_ext51_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext51_v1.bsp",
    "mer1_surf_rover_ext52_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext52_v1.bsp",
    "mer1_surf_rover_ext53_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext53_v1.bsp",
    "mer1_surf_rover_ext54_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext54_v1.bsp",
    "mer1_surf_rover_ext55_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext55_v1.bsp",
    "mer1_surf_rover_ext56_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext56_v1.bsp",
    "mer1_surf_rover_ext5_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext5_v1.bsp",
    "mer1_surf_rover_ext6_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext6_v1.bsp",
    "mer1_surf_rover_ext7_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext7_v1.bsp",
    "mer1_surf_rover_ext8_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext8_v1.bsp",
    "mer1_surf_rover_ext9_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ext9_v1.bsp",
    "mer1_surf_rover_prim_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_prim_v1.bsp",
    "mer1_surf_rover_ro.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_rover_ro.bsp",
    "mer1_surf_roverrl.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl.bsp",
    "mer1_surf_roverrl_0001_3240_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_0001_3240_v1.bsp",
    "mer1_surf_roverrl_cs.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_cs.bsp",
    "mer1_surf_roverrl_ext10_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext10_v1.bsp",
    "mer1_surf_roverrl_ext11_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext11_v1.bsp",
    "mer1_surf_roverrl_ext12_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext12_v1.bsp",
    "mer1_surf_roverrl_ext13_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext13_v1.bsp",
    "mer1_surf_roverrl_ext14_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext14_v1.bsp",
    "mer1_surf_roverrl_ext15_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext15_v1.bsp",
    "mer1_surf_roverrl_ext16_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext16_v1.bsp",
    "mer1_surf_roverrl_ext17_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext17_v1.bsp",
    "mer1_surf_roverrl_ext18_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext18_v1.bsp",
    "mer1_surf_roverrl_ext19_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext19_v1.bsp",
    "mer1_surf_roverrl_ext1_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext1_v1.bsp",
    "mer1_surf_roverrl_ext20_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext20_v1.bsp",
    "mer1_surf_roverrl_ext21_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext21_v1.bsp",
    "mer1_surf_roverrl_ext22_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext22_v1.bsp",
    "mer1_surf_roverrl_ext23_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext23_v1.bsp",
    "mer1_surf_roverrl_ext24_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext24_v1.bsp",
    "mer1_surf_roverrl_ext25_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext25_v1.bsp",
    "mer1_surf_roverrl_ext26_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext26_v1.bsp",
    "mer1_surf_roverrl_ext27_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext27_v1.bsp",
    "mer1_surf_roverrl_ext28_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext28_v1.bsp",
    "mer1_surf_roverrl_ext29_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext29_v1.bsp",
    "mer1_surf_roverrl_ext2_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext2_v1.bsp",
    "mer1_surf_roverrl_ext30_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext30_v1.bsp",
    "mer1_surf_roverrl_ext31_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext31_v1.bsp",
    "mer1_surf_roverrl_ext32_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext32_v1.bsp",
    "mer1_surf_roverrl_ext33_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext33_v1.bsp",
    "mer1_surf_roverrl_ext34_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext34_v1.bsp",
    "mer1_surf_roverrl_ext36_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext36_v1.bsp",
    "mer1_surf_roverrl_ext37_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext37_v1.bsp",
    "mer1_surf_roverrl_ext38_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext38_v1.bsp",
    "mer1_surf_roverrl_ext39_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext39_v1.bsp",
    "mer1_surf_roverrl_ext3_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext3_v1.bsp",
    "mer1_surf_roverrl_ext40_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext40_v1.bsp",
    "mer1_surf_roverrl_ext41_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext41_v1.bsp",
    "mer1_surf_roverrl_ext42_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext42_v1.bsp",
    "mer1_surf_roverrl_ext43_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext43_v1.bsp",
    "mer1_surf_roverrl_ext44_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext44_v1.bsp",
    "mer1_surf_roverrl_ext45_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext45_v1.bsp",
    "mer1_surf_roverrl_ext46_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext46_v1.bsp",
    "mer1_surf_roverrl_ext47_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext47_v1.bsp",
    "mer1_surf_roverrl_ext48_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext48_v1.bsp",
    "mer1_surf_roverrl_ext49_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext49_v1.bsp",
    "mer1_surf_roverrl_ext4_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext4_v1.bsp",
    "mer1_surf_roverrl_ext50_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext50_v1.bsp",
    "mer1_surf_roverrl_ext51_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext51_v1.bsp",
    "mer1_surf_roverrl_ext52_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext52_v1.bsp",
    "mer1_surf_roverrl_ext53_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext53_v1.bsp",
    "mer1_surf_roverrl_ext54_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext54_v1.bsp",
    "mer1_surf_roverrl_ext55_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext55_v1.bsp",
    "mer1_surf_roverrl_ext56_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext56_v1.bsp",
    "mer1_surf_roverrl_ext5_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext5_v1.bsp",
    "mer1_surf_roverrl_ext6_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext6_v1.bsp",
    "mer1_surf_roverrl_ext7_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext7_v1.bsp",
    "mer1_surf_roverrl_ext8_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext8_v1.bsp",
    "mer1_surf_roverrl_ext9_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ext9_v1.bsp",
    "mer1_surf_roverrl_prim_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_prim_v1.bsp",
    "mer1_surf_roverrl_ro.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer1_surf_roverrl_ro.bsp",
    "mer2_cruise.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_cruise.bsp",
    "mer2_edl_rcb_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_edl_rcb_v1.bsp",
    "mer2_ls_040108_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_ls_040108_iau2000_v1.bsp",
    "mer2_still_at_ls_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_still_at_ls_v1.bsp",
    "mer2_struct_ver11.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_struct_ver11.bsp",
    "mer2_surf_iddg_all_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_surf_iddg_all_v1.bsp",
    "mer2_surf_rover_all_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_surf_rover_all_v01.bsp",
    "mer2_surf_rover_ro_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_surf_rover_ro_v01.bsp",
    "mer2_surf_roverrl_all_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_surf_roverrl_all_v01.bsp",
    "mer2_surf_roverrl_ro_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/mer2_surf_roverrl_ro_v01.bsp",
    "spk_b_s_071029-160101_110624.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/kernels/spk/spk_b_s_071029-160101_110624.bsp",
    "mer1_v02_draft.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030727/mer1_v02_draft.tf",
    "mer2_v02_draft.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030727/mer2_v02_draft.tf",
    "mer1_v02_draft2.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/fk/mer1_v02_draft2.tf",
    "mer2_v02_draft2.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/fk/mer2_v02_draft2.tf",
    "mer1_still_at_ls_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/spk/mer1_still_at_ls_v1.bsp",
    "mer1_struct_v00_draft1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/spk/mer1_struct_v00_draft1.bsp",
    "mer2_still_at_ls_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/spk/mer2_still_at_ls_v1.bsp",
    "mer2_struct_v00_draft1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20030929/spk/mer2_struct_v00_draft1.bsp",
    "mer1_struct_sstb_ver10.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20031204/mer1_struct_sstb_ver10.bsp",
    "mer1_v03_sstb.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20031204/mer1_v03_sstb.tf",
    "mer1_surfu_rover_0403250102.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20040325/mer1_surfu_rover_0403250102.bsp",
    "mer2_surfu_rover_0403251409.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20040325/mer2_surfu_rover_0403251409.bsp",
    "mer1_surfui_rover_0403301400.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20040330/mer1_surfui_rover_0403301400.bsp",
    "mer2_surfui_rover_0403301400.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/dcook/20040330/mer2_surfui_rover_0403301400.bsp",
    "mer1_ll_ck.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/eferguson/mer1_ll_ck.tf",
    "mer1_ll_dyn.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/eferguson/mer1_ll_dyn.tf",
    "mer1_still_at_ls_long.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/fseelos/mer1_still_at_ls_long.bsp",
    "mer2_still_at_ls_long.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/fseelos/mer2_still_at_ls_long.bsp",
    "mer1_surf_rover_ghfix.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/ghfix/mer1_surf_rover_ghfix.bsp",
    "mer1_surf_roverrl_1202220917.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/jpmuller/mer1_surf_roverrl_1202220917.bsp",
    "mer2_surf_roverrl_1202221014.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/jpmuller/mer2_surf_roverrl_1202221014.bsp",
    "spk_031201-040401_020415.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/mgs_spks/spk_031201-040401_020415.bsp",
    "spk_040401-040801_020416.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/mgs_spks/spk_040401-040801_020416.bsp",
    "spk_040801-050101_020416.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/mgs_spks/spk_040801-050101_020416.bsp",
    "mer1_merb_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/name_map_fks/mer1_merb_v00.tf",
    "mer2_mera_v00.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/name_map_fks/mer2_mera_v00.tf",
    "pck00008.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/pck/pck00008.tpc",
    "de410.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/de410.bsp",
    "mars_iau2000_v0.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/mars_iau2000_v0.tpc",
    "mer2_ls_ep55a3_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/mer2_ls_ep55a3_iau2000_v1.bsp",
    "mer2_port6_rover_20040101.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/mer2_port6_rover_20040101.bsp",
    "mer2_struct_sstb_ver10.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/mer2_struct_sstb_ver10.bsp",
    "mer2_v04_sstb.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/mer2_v04_sstb.tf",
    "naif0007.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6a/naif0007.tls",
    "de410.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/de410.bsp",
    "mars_iau2000_v0.tpc" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/mars_iau2000_v0.tpc",
    "mer1_ls_tm20b3_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/mer1_ls_tm20b3_iau2000_v1.bsp",
    "mer1_port6_rover_20040101.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/mer1_port6_rover_20040101.bsp",
    "mer1_struct_sstb_ver10.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/mer1_struct_sstb_ver10.bsp",
    "mer1_v04_sstb.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/mer1_v04_sstb.tf",
    "naif0007.tls" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/port6b/naif0007.tls",
    "mer2_ls_040105_0500_dte_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040106/mer2_ls_040105_0500_dte_iau2000_v1.bsp",
    "mer2_tp_040105_0500_dte_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040106/mer2_tp_040105_0500_dte_iau2000_v1.tf",
    "mer1_loc_040909_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040909/mer1_loc_040909_iau2000_v1.bsp",
    "mer1_loc_040909_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040909/mer1_loc_040909_iau2000_v1.tf",
    "mer2_loc_040909_iau2000_v1.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040909/mer2_loc_040909_iau2000_v1.bsp",
    "mer2_loc_040909_iau2000_v1.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/scollins/040909/mer2_loc_040909_iau2000_v1.tf",
    "effelsberg_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/skrasner/effelsberg_v01.bsp",
    "effelsberg_v01.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/skrasner/effelsberg_v01.tf",
    "greenbank_v01.bsp" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/skrasner/greenbank_v01.bsp",
    "greenbank_v01.tf" => "https://naif.jpl.nasa.gov/pub/naif/MER/misc/skrasner/greenbank_v01.tf",
)

