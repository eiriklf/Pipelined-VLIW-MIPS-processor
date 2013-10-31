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
char *ieee_p_0774719531_sub_767668596_2162500114(char *, char *, char *, char *, char *, char *);
char *ieee_p_0774719531_sub_767740470_2162500114(char *, char *, char *, char *, char *, char *);


static void work_a_3377914984_3212880686_p_0(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    int t15;
    int t16;
    int t17;
    int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;

LAB0:    xsi_set_current_line(68, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)2);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(74, ng0);
    t15 = (64U - 1);
    t1 = (t0 + 8161);
    *((int *)t1) = 0;
    t2 = (t0 + 8165);
    *((int *)t2) = t15;
    t16 = 0;
    t17 = t15;

LAB5:    if (t16 <= t17)
        goto LAB6;

LAB8:    xsi_set_current_line(86, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t1 = (t0 + 4576);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 64U);
    xsi_driver_first_trans_fast(t1);

LAB3:    t1 = (t0 + 4480);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(69, ng0);
    t1 = (t0 + 1032U);
    t6 = *((char **)t1);
    t1 = (t0 + 7340U);
    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 7356U);
    t9 = ieee_p_0774719531_sub_767632659_2162500114(IEEE_P_0774719531, t5, t6, t1, t8, t7);
    t10 = (t0 + 4576);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t9, 64U);
    xsi_driver_first_trans_fast(t10);
    xsi_set_current_line(70, ng0);
    t1 = (t0 + 8032);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 65U);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 8097);
    t6 = (t0 + 2568U);
    t7 = *((char **)t6);
    t6 = (t7 + 0);
    memcpy(t6, t1, 64U);
    goto LAB3;

LAB6:    xsi_set_current_line(75, ng0);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t18 = (64U - 2);
    t19 = (64 - t18);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t6 = (t7 + t21);
    t8 = xsi_get_transient_memory(63U);
    memcpy(t8, t6, 63U);
    t9 = (t0 + 2808U);
    t10 = *((char **)t9);
    t22 = (64U - 1);
    t23 = (64 - t22);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t9 = (t10 + t25);
    memcpy(t9, t8, 63U);
    xsi_set_current_line(76, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t15 = (64U - 1);
    t18 = (t15 - 63);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = *((unsigned char *)t1);
    t6 = (t0 + 2808U);
    t7 = *((char **)t6);
    t22 = (0 - 64);
    t23 = (t22 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t6 = (t7 + t25);
    *((unsigned char *)t6) = t3;
    xsi_set_current_line(77, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t15 = (64U - 2);
    t19 = (63 - t15);
    t20 = (t19 * 1U);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t6 = xsi_get_transient_memory(63U);
    memcpy(t6, t1, 63U);
    t7 = (t0 + 2568U);
    t8 = *((char **)t7);
    t18 = (64U - 1);
    t23 = (63 - t18);
    t24 = (t23 * 1U);
    t25 = (0 + t24);
    t7 = (t8 + t25);
    memcpy(t7, t6, 63U);
    xsi_set_current_line(78, ng0);
    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    t1 = (t0 + 7484U);
    t6 = (t0 + 2688U);
    t7 = *((char **)t6);
    t6 = (t0 + 7468U);
    t8 = ieee_p_0774719531_sub_767740470_2162500114(IEEE_P_0774719531, t5, t2, t1, t7, t6);
    t9 = (t0 + 2808U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t11 = (t5 + 12U);
    t19 = *((unsigned int *)t11);
    t20 = (1U * t19);
    memcpy(t9, t8, t20);
    xsi_set_current_line(79, ng0);
    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    t15 = (64U - 1);
    t18 = (t15 - 64);
    t19 = (t18 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    t3 = *((unsigned char *)t1);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB9;

LAB11:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2568U);
    t2 = *((char **)t1);
    t15 = (0 - 63);
    t19 = (t15 * -1);
    t20 = (1U * t19);
    t21 = (0 + t20);
    t1 = (t2 + t21);
    *((unsigned char *)t1) = (unsigned char)3;

LAB10:
LAB7:    t1 = (t0 + 8161);
    t16 = *((int *)t1);
    t2 = (t0 + 8165);
    t17 = *((int *)t2);
    if (t16 == t17)
        goto LAB8;

LAB12:    t15 = (t16 + 1);
    t16 = t15;
    t6 = (t0 + 8161);
    *((int *)t6) = t16;
    goto LAB5;

LAB9:    xsi_set_current_line(80, ng0);
    t6 = (t0 + 2568U);
    t7 = *((char **)t6);
    t22 = (0 - 63);
    t23 = (t22 * -1);
    t24 = (1U * t23);
    t25 = (0 + t24);
    t6 = (t7 + t25);
    *((unsigned char *)t6) = (unsigned char)2;
    xsi_set_current_line(81, ng0);
    t1 = (t0 + 2808U);
    t2 = *((char **)t1);
    t1 = (t0 + 7484U);
    t6 = (t0 + 2688U);
    t7 = *((char **)t6);
    t6 = (t0 + 7468U);
    t8 = ieee_p_0774719531_sub_767668596_2162500114(IEEE_P_0774719531, t5, t2, t1, t7, t6);
    t9 = (t0 + 2808U);
    t10 = *((char **)t9);
    t9 = (t10 + 0);
    t11 = (t5 + 12U);
    t19 = *((unsigned int *)t11);
    t20 = (1U * t19);
    memcpy(t9, t8, t20);
    goto LAB10;

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

LAB0:    xsi_set_current_line(108, ng0);

LAB3:    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (63 - 31);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 4640);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 32U);
    xsi_driver_first_trans_fast_port(t6);

LAB2:    t11 = (t0 + 4496);
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
