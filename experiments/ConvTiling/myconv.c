typedef int TYPE;
#define elem_t_max 2147483647
#define elem_t_min -2147483648

//#ifndef BAREMETAL

#define BATCH_SIZE 4
#define IN_DIM 224
#define IN_CHANNELS 3
#define OUT_CHANNELS 32
#define KERNEL_DIM 3
#define PADDING 0
#define STRIDE 1

//#else
//
//#define IN_DIM 17
//#define IN_CHANNELS 18
//#define OUT_CHANNELS 19
//#define BATCH_SIZE 2
//#define KERNEL_DIM 3
//#define PADDING 1
//#define STRIDE 2
//
//#endif

#define NO_BIAS 0

#define OUT_DIM ((IN_DIM + 2*PADDING - KERNEL_DIM) / STRIDE + 1)
#define PATCH_SIZE (KERNEL_DIM * KERNEL_DIM * IN_CHANNELS)
#define N_PATCHES (BATCH_SIZE * OUT_DIM * OUT_DIM)

TYPE input[BATCH_SIZE][IN_DIM][IN_DIM][IN_CHANNELS];
TYPE weights[OUT_CHANNELS][KERNEL_DIM][KERNEL_DIM][IN_CHANNELS];
TYPE bias[OUT_CHANNELS];
TYPE output[BATCH_SIZE][OUT_DIM][OUT_DIM][OUT_CHANNELS];
        
void conv() {
  // loop_begin();
  for (int b = 0; b < BATCH_SIZE; b++) {
    for (int och = 0; och < OUT_CHANNELS; och++) {
      // loop_begin();
      for (int orow = 0; orow < OUT_DIM; orow++) { 
        
        for (int ocol = 0; ocol < OUT_DIM; ocol++) {
          TYPE result = 0;
          // #pragma unroll
          for (int krow = 0; krow < KERNEL_DIM; krow++) {
            // #pragma unroll
            for (int kcol = 0; kcol < KERNEL_DIM; kcol++) {
              // #pragma unroll
              for (int kch = 0; kch < IN_CHANNELS; kch++) {
                int irow = orow * STRIDE + krow - PADDING;
                int icol = ocol * STRIDE + kcol - PADDING;

                TYPE pixel = irow < 0 || irow >= IN_DIM ||
                        icol < 0 || icol >= IN_DIM ?
                        0 : input[b][irow][icol][kch];

                result += weights[och][krow][kcol][kch] *pixel;
              }
            }
          }
          result += bias[och];
          // Clip result
          result = result > elem_t_max ? elem_t_max : (result < elem_t_min ? elem_t_min : result);
          output[b][orow][ocol][och] = result;
        }
        
      }
      //loop_end();
    }
  }
  // loop_end();
}
