/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x12940baa */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment/Vliw_alu.vhd";
extern char *IEEE_P_0774719531;

char *ieee_p_0774719531_sub_767632659_2162500114(char *, char *, char *, char *, char *, char *);


static void work_a_3377914984_3212880686_p_0(char *t0)
{
    char t1[16];
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;

LAB0:    xsi_set_current_line(52, ng0);

LAB3:    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 5540U);
    t4 = (t0 + 1192U);
    t5 = *((char **)t4);
    t4 = (t0 + 5556U);
    t6 = ieee_p_0774719531_sub_767632659_2162500114(IEEE_P_0774719531, t1, t3, t2, t5, t4);
    t7 = (t0 + 3456);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t6, 64U);
    xsi_driver_first_trans_fast(t7);

LAB2:    t12 = (t0 + 3360);
    *((int *)t12) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_3377914984_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(53, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (63 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3520);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 3376);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3377914984_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3377914984_3212880686_p_0,(void *)work_a_3377914984_3212880686_p_1};
	xsi_register_didat("work_a_3377914984_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_3377914984_3212880686.didat");
	xsi_register_executes(pe);
}
