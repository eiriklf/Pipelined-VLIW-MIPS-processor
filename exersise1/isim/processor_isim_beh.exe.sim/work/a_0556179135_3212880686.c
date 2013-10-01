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
static const char *ng0 = "C:/Users/eiriklf/Documents/supportFiles_13/hardware/alu.vhd";
extern char *IEEE_P_2592010699;
extern char *WORK_P_2565430773;

unsigned char ieee_p_2592010699_sub_2507238156_503743352(char *, unsigned char , unsigned char );


static void work_a_0556179135_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;

LAB0:    xsi_set_current_line(113, ng0);

LAB3:    t1 = (t0 + 9912U);
    t2 = *((char **)t1);
    t3 = (32 - 1);
    t4 = (t3 - 31);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t0 + 21368);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    *((unsigned char *)t13) = t8;
    xsi_driver_first_trans_delta(t9, 0U, 1, 0LL);

LAB2:    t14 = (t0 + 21224);
    *((int *)t14) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0556179135_3212880686_p_1(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    char *t9;
    char *t10;
    int t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(114, ng0);

LAB3:    t1 = (t0 + 9912U);
    t2 = *((char **)t1);
    t3 = (32 - 1);
    t4 = (t3 - 31);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t0 + 9912U);
    t10 = *((char **)t9);
    t11 = (32 - 2);
    t12 = (t11 - 31);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t9 = (t10 + t15);
    t16 = *((unsigned char *)t9);
    t17 = ieee_p_2592010699_sub_2507238156_503743352(IEEE_P_2592010699, t8, t16);
    t18 = (t0 + 21432);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    *((unsigned char *)t22) = t17;
    xsi_driver_first_trans_delta(t18, 1U, 1, 0LL);

LAB2:    t23 = (t0 + 21240);
    *((int *)t23) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0556179135_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(115, ng0);
    t1 = (t0 + 10072U);
    t2 = *((char **)t1);
    t3 = (32 - 1);
    t4 = (t3 - 31);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t1 = (t2 + t7);
    t8 = *((unsigned char *)t1);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 21496);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_delta(t15, 3U, 1, 0LL);

LAB2:    t20 = (t0 + 21256);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 21496);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_delta(t10, 3U, 1, 0LL);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0556179135_3212880686_p_3(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;

LAB0:    xsi_set_current_line(116, ng0);
    t1 = (t0 + 10072U);
    t2 = *((char **)t1);
    t1 = ((WORK_P_2565430773) + 2008U);
    t3 = *((char **)t1);
    t4 = 1;
    if (32U == 32U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t12 = (t0 + 21560);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_delta(t12, 2U, 1, 0LL);

LAB2:    t17 = (t0 + 21272);
    *((int *)t17) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 21560);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    *((unsigned char *)t11) = (unsigned char)3;
    xsi_driver_first_trans_delta(t7, 2U, 1, 0LL);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 32U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t1 = (t2 + t5);
    t6 = (t3 + t5);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_0556179135_3212880686_p_4(char *t0)
{
    char t15[16];
    char t17[16];
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned char t4;
    unsigned char t5;
    char *t6;
    char *t7;
    int t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(121, ng0);
    t1 = (t0 + 9272U);
    t2 = *((char **)t1);
    t3 = (0 + 3U);
    t1 = (t2 + t3);
    t4 = *((unsigned char *)t1);
    t5 = (t4 == (unsigned char)3);
    if (t5 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(124, ng0);
    t1 = (t0 + 10072U);
    t2 = *((char **)t1);
    t1 = (t0 + 21624);
    t6 = (t1 + 56U);
    t7 = *((char **)t6);
    t13 = (t7 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t2, 32U);
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 21288);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(122, ng0);
    t6 = (t0 + 9112U);
    t7 = *((char **)t6);
    t8 = (32 / 2);
    t9 = (t8 - 1);
    t10 = (31 - t9);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t6 = (t7 + t12);
    t13 = ((WORK_P_2565430773) + 2128U);
    t14 = *((char **)t13);
    t16 = ((IEEE_P_2592010699) + 4024);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 15;
    t19 = (t18 + 4U);
    *((int *)t19) = 0;
    t19 = (t18 + 8U);
    *((int *)t19) = -1;
    t20 = (0 - 15);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t19 = ((WORK_P_2565430773) + 6584U);
    t13 = xsi_base_array_concat(t13, t15, t16, (char)97, t6, t17, (char)97, t14, t19, (char)101);
    t22 = (t0 + 21624);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t13, 32U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

}


extern void work_a_0556179135_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0556179135_3212880686_p_0,(void *)work_a_0556179135_3212880686_p_1,(void *)work_a_0556179135_3212880686_p_2,(void *)work_a_0556179135_3212880686_p_3,(void *)work_a_0556179135_3212880686_p_4};
	xsi_register_didat("work_a_0556179135_3212880686", "isim/processor_isim_beh.exe.sim/work/a_0556179135_3212880686.didat");
	xsi_register_executes(pe);
}
