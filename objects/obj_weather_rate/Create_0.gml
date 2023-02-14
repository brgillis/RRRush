/// @description Define constants describing appearance and init position

#macro O_WR_BAR_C_MIN #0000FF
#macro O_WR_BAR_C_MAX_POS #00FF00
#macro O_WR_BAR_C_MAX_NEG #FF0000

#macro O_WR_BAR_X_HSIZE 98

#macro O_WR_BAR_Y_MIN 15
#macro O_WR_BAR_Y_MAX 57
#macro O_WR_BAR_Y_MID ((O_WR_BAR_Y_MIN + O_WR_BAR_Y_MAX)/2)

#macro O_WR_BAR_OSC_FX_MAG 0.01
#macro O_WR_BAR_OSC_FX_PER 48
#macro O_WR_BAR_OSC_FX_OFF 0.75

#macro O_WR_BAR_OSC_Y_MAG 1
#macro O_WR_BAR_OSC_Y_PER 288
#macro O_WR_BAR_OSC_Y_OFF 0.5

#macro O_WR_CLINE_C c_black
#macro O_WR_CLINE_ALPHA 1.0
#macro O_WR_CLINE_WIDTH 4
#macro O_WR_OLINE_WIDTH 2

#macro O_WR_DIAM_HEIGHT 20
#macro O_WR_DIAM_HHEIGHT (O_WR_DIAM_HEIGHT/2)
#macro O_WR_DIAM_WIDTH O_WR_DIAM_HEIGHT
#macro O_WR_DIAM_HWIDTH (O_WR_DIAM_WIDTH/2)
#macro O_WR_DIAM_ALPHA 1.0

cur_position = 0;
target_position = 0;