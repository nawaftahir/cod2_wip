/* Actual codec caller groups; bounded code-generation context, not historic TU layout. */
#include "jmemmgr.c"
#include "jcomapi.c"
#include "jerror.c"
#include "jcapimin.c"
#include "jdinput.c"
#include "jdmarker.c"
#include "jdmainct.c"
#include "jdcoefct.c"
/* Separate original-module locals need distinct names in this context probe. */
#define savable_state sequential_huff_state
#define process_restart sequential_huff_restart
#include "jdhuff.c"
#undef process_restart
#undef savable_state
#define extend_test progressive_extend_test
#define extend_offset progressive_extend_offset
#include "jdphuff.c"
#undef extend_offset
#undef extend_test
#define my_cquantizer one_pass_cquantizer
#define my_cquantize_ptr one_pass_cquantize_ptr
#include "jquant1.c"
#undef my_cquantize_ptr
#undef my_cquantizer
#include "jquant2.c"
#define my_upsampler merged_upsampler
#define my_upsample_ptr merged_upsample_ptr
#define build_ycc_rgb_table merged_build_ycc_rgb_table
#include "jdmerge.c"
#undef build_ycc_rgb_table
#undef my_upsample_ptr
#undef my_upsampler
#include "jdpostct.c"
#include "jddctmgr.c"
#include "jdcolor.c"
#include "jdsample.c"
#include "jdmaster.c"
#include "jdapimin.c"
#include "jdapistd.c"
#include "r_jpeg_load.c"
#include "j_image_texture.c"
#include "r_image_load_raw.c"
