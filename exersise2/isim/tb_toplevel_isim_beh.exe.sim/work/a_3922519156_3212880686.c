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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2/Regi.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_3922519156_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;

LAB0:    xsi_set_current_line(28, ng0);
    t1 = (t0 + 1312U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 3680);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(30, ng0);
    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 3776);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t4, 139U);
    xsi_driver_first_trans_fast(t3);
    goto LAB3;

}

static void work_a_3922519156_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;

LAB0:    xsi_set_current_line(35, ng0);

LAB3:    t1 = (t0 + 1832U);
    t2 = *((char **)t1);
    t1 = (t0 + 3840);
    t3 = (t1 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memcpy(t6, t2, 139U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t7 = (t0 + 3696);
    *((int *)t7) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_3922519156_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3922519156_3212880686_p_0,(void *)work_a_3922519156_3212880686_p_1};
	xsi_register_didat("work_a_3922519156_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_3922519156_3212880686.didat");
	xsi_register_executes(pe);
}
