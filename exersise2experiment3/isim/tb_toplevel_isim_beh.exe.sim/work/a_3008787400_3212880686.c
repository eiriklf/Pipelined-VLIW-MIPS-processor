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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment3/TriputMux.vhd";



static void work_a_3008787400_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned char t18;
    unsigned int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    unsigned char t25;
    unsigned int t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;

LAB0:    xsi_set_current_line(37, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 5298);
    t4 = 1;
    if (2U == 2U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:    t15 = (t0 + 1672U);
    t16 = *((char **)t15);
    t15 = (t0 + 5300);
    t18 = 1;
    if (2U == 2U)
        goto LAB16;

LAB17:    t18 = 0;

LAB18:    if (t18 == 1)
        goto LAB13;

LAB14:    t22 = (t0 + 1672U);
    t23 = *((char **)t22);
    t22 = (t0 + 5302);
    t25 = 1;
    if (2U == 2U)
        goto LAB22;

LAB23:    t25 = 0;

LAB24:    t14 = t25;

LAB15:    if (t14 != 0)
        goto LAB11;

LAB12:
LAB28:    t35 = (t0 + 1032U);
    t36 = *((char **)t35);
    t35 = (t0 + 3232);
    t37 = (t35 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t36, 32U);
    xsi_driver_first_trans_fast_port(t35);

LAB2:    t41 = (t0 + 3152);
    *((int *)t41) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 1192U);
    t9 = *((char **)t8);
    t8 = (t0 + 3232);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    memcpy(t13, t9, 32U);
    xsi_driver_first_trans_fast_port(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 2U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB11:    t29 = (t0 + 1352U);
    t30 = *((char **)t29);
    t29 = (t0 + 3232);
    t31 = (t29 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memcpy(t34, t30, 32U);
    xsi_driver_first_trans_fast_port(t29);
    goto LAB2;

LAB13:    t14 = (unsigned char)1;
    goto LAB15;

LAB16:    t19 = 0;

LAB19:    if (t19 < 2U)
        goto LAB20;
    else
        goto LAB18;

LAB20:    t20 = (t16 + t19);
    t21 = (t15 + t19);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB17;

LAB21:    t19 = (t19 + 1);
    goto LAB19;

LAB22:    t26 = 0;

LAB25:    if (t26 < 2U)
        goto LAB26;
    else
        goto LAB24;

LAB26:    t27 = (t23 + t26);
    t28 = (t22 + t26);
    if (*((unsigned char *)t27) != *((unsigned char *)t28))
        goto LAB23;

LAB27:    t26 = (t26 + 1);
    goto LAB25;

LAB29:    goto LAB2;

}


extern void work_a_3008787400_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3008787400_3212880686_p_0};
	xsi_register_didat("work_a_3008787400_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_3008787400_3212880686.didat");
	xsi_register_executes(pe);
}
