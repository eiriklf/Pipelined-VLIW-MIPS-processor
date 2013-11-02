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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment/Hazarddetection.vhd";



static void work_a_1775219763_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t3;
    unsigned char t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(60, ng0);
    t1 = (t0 + 2312U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(70, ng0);
    t1 = (t0 + 4216);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(71, ng0);
    t1 = (t0 + 4152);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(72, ng0);
    t1 = (t0 + 4280);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 4072);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(61, ng0);
    t1 = (t0 + 4152);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(62, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 2768U);
    t5 = *((char **)t1);
    t4 = 1;
    if (9U == 9U)
        goto LAB11;

LAB12:    t4 = 0;

LAB13:    if (t4 == 1)
        goto LAB8;

LAB9:    t3 = (unsigned char)0;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 4216);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(67, ng0);
    t1 = (t0 + 4280);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(63, ng0);
    t21 = (t0 + 4216);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    *((unsigned char *)t25) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t21);
    xsi_set_current_line(64, ng0);
    t1 = (t0 + 4280);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB6;

LAB8:    t7 = (t0 + 1192U);
    t8 = *((char **)t7);
    t7 = (t0 + 1352U);
    t11 = *((char **)t7);
    t12 = 1;
    if (5U == 5U)
        goto LAB20;

LAB21:    t12 = 0;

LAB22:    if (t12 == 1)
        goto LAB17;

LAB18:    t15 = (t0 + 1192U);
    t16 = *((char **)t15);
    t15 = (t0 + 1512U);
    t17 = *((char **)t15);
    t18 = 1;
    if (5U == 5U)
        goto LAB26;

LAB27:    t18 = 0;

LAB28:    t10 = t18;

LAB19:    t3 = t10;
    goto LAB10;

LAB11:    t9 = 0;

LAB14:    if (t9 < 9U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t1 = (t2 + t9);
    t6 = (t5 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB12;

LAB16:    t9 = (t9 + 1);
    goto LAB14;

LAB17:    t10 = (unsigned char)1;
    goto LAB19;

LAB20:    t13 = 0;

LAB23:    if (t13 < 5U)
        goto LAB24;
    else
        goto LAB22;

LAB24:    t7 = (t8 + t13);
    t14 = (t11 + t13);
    if (*((unsigned char *)t7) != *((unsigned char *)t14))
        goto LAB21;

LAB25:    t13 = (t13 + 1);
    goto LAB23;

LAB26:    t19 = 0;

LAB29:    if (t19 < 5U)
        goto LAB30;
    else
        goto LAB28;

LAB30:    t15 = (t16 + t19);
    t20 = (t17 + t19);
    if (*((unsigned char *)t15) != *((unsigned char *)t20))
        goto LAB27;

LAB31:    t19 = (t19 + 1);
    goto LAB29;

}


extern void work_a_1775219763_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1775219763_3212880686_p_0};
	xsi_register_didat("work_a_1775219763_3212880686", "isim/Hazarddetection_isim_beh.exe.sim/work/a_1775219763_3212880686.didat");
	xsi_register_executes(pe);
}
