/* CoD2 memory source; callbacks pinned at 1004a950/1004a960/1004a980. */
#include "jinclude.h"
#include "jpeglib.h"

typedef struct {
  struct jpeg_source_mgr pub;
  boolean start_of_file;
} memory_source_mgr;

METHODDEF(void)
init_source (j_decompress_ptr cinfo)
{
  ((memory_source_mgr *) cinfo->src)->start_of_file = TRUE;
}

METHODDEF(void)
skip_input_data (j_decompress_ptr cinfo, long num_bytes)
{
  struct jpeg_source_mgr *src = cinfo->src;
  if (num_bytes > 0) {
    src->next_input_byte += num_bytes;
    src->bytes_in_buffer -= num_bytes;
  }
}

METHODDEF(void)
term_source (j_decompress_ptr cinfo)
{
}

/* Retail expands this setup into the image loader. */
#ifdef _MSC_VER
__forceinline
#endif
GLOBAL(void)
jpeg_memory_src (j_decompress_ptr cinfo, const JOCTET *data, size_t size)
{
  struct jpeg_source_mgr *src;
  if (cinfo->src == NULL)
    cinfo->src = (struct jpeg_source_mgr *)
      (*cinfo->mem->alloc_small) ((j_common_ptr)cinfo, JPOOL_PERMANENT,
                                SIZEOF(memory_source_mgr));
  src = cinfo->src;
  src->bytes_in_buffer = size;
  src->init_source = init_source;
  src->fill_input_buffer = NULL;
  src->skip_input_data = skip_input_data;
  src->resync_to_restart = jpeg_resync_to_restart;
  src->term_source = term_source;
  src->next_input_byte = data;
}
