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
static const char *ng0 = "C:/Users/torbjlan/dmkonsttdt4255_work/exersise2experiment3/file/register_file.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
unsigned char ieee_p_2592010699_sub_1744673427_503743352(char *, char *, unsigned int , unsigned int );


static void work_a_2615964831_3212880686_p_0(char *t0)
{
    char *t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    int t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;

LAB0:    xsi_set_current_line(67, ng0);
    t1 = (t0 + 992U);
    t2 = ieee_p_2592010699_sub_1744673427_503743352(IEEE_P_2592010699, t1, 0U, 0U);
    if (t2 != 0)
        goto LAB2;

LAB4:
LAB3:    t1 = (t0 + 5704);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(68, ng0);
    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 != 0)
        goto LAB5;

LAB7:
LAB6:    goto LAB3;

LAB5:    xsi_set_current_line(69, ng0);
    t3 = (t0 + 1992U);
    t7 = *((char **)t3);
    t3 = (t0 + 1832U);
    t8 = *((char **)t3);
    t3 = (t0 + 9740U);
    t9 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t8, t3);
    t10 = (t9 - 31);
    t11 = (t10 * -1);
    t12 = (32U * t11);
    t13 = (0U + t12);
    t14 = (t0 + 5848);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memcpy(t18, t7, 32U);
    xsi_driver_first_trans_delta(t14, t13, 32U, 0LL);
    goto LAB6;

}

static void work_a_2615964831_3212880686_p_1(char *t0)
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(74, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 10996);
    t4 = 1;
    if (5U == 5U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t15 = (t0 + 3112U);
    t16 = *((char **)t15);
    t15 = (t0 + 1512U);
    t17 = *((char **)t15);
    t15 = (t0 + 9708U);
    t18 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t17, t15);
    t19 = (t18 - 31);
    t20 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t18);
    t21 = (32U * t20);
    t22 = (0 + t21);
    t23 = (t16 + t22);
    t24 = (t0 + 5912);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t23, 32U);
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 5720);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t8 = xsi_get_transient_memory(32U);
    memset(t8, 0, 32U);
    t9 = t8;
    memset(t9, (unsigned char)2, 32U);
    t10 = (t0 + 5912);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 5U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_2615964831_3212880686_p_2(char *t0)
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(77, ng0);
    t1 = (t0 + 1672U);
    t2 = *((char **)t1);
    t1 = (t0 + 11001);
    t4 = 1;
    if (5U == 5U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t15 = (t0 + 3112U);
    t16 = *((char **)t15);
    t15 = (t0 + 1672U);
    t17 = *((char **)t15);
    t15 = (t0 + 9724U);
    t18 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t17, t15);
    t19 = (t18 - 31);
    t20 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t18);
    t21 = (32U * t20);
    t22 = (0 + t21);
    t23 = (t16 + t22);
    t24 = (t0 + 5976);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t23, 32U);
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 5736);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t8 = xsi_get_transient_memory(32U);
    memset(t8, 0, 32U);
    t9 = t8;
    memset(t9, (unsigned char)2, 32U);
    t10 = (t0 + 5976);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 5U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_2615964831_3212880686_p_3(char *t0)
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(80, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 11006);
    t4 = 1;
    if (5U == 5U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t15 = (t0 + 3112U);
    t16 = *((char **)t15);
    t15 = (t0 + 2472U);
    t17 = *((char **)t15);
    t15 = (t0 + 9804U);
    t18 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t17, t15);
    t19 = (t18 - 31);
    t20 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t18);
    t21 = (32U * t20);
    t22 = (0 + t21);
    t23 = (t16 + t22);
    t24 = (t0 + 6040);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t23, 32U);
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 5752);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t8 = xsi_get_transient_memory(32U);
    memset(t8, 0, 32U);
    t9 = t8;
    memset(t9, (unsigned char)2, 32U);
    t10 = (t0 + 6040);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 5U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}

static void work_a_2615964831_3212880686_p_4(char *t0)
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
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    xsi_set_current_line(83, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 11011);
    t4 = 1;
    if (5U == 5U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t15 = (t0 + 3112U);
    t16 = *((char **)t15);
    t15 = (t0 + 2632U);
    t17 = *((char **)t15);
    t15 = (t0 + 9820U);
    t18 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t17, t15);
    t19 = (t18 - 31);
    t20 = (t19 * -1);
    xsi_vhdl_check_range_of_index(31, 0, -1, t18);
    t21 = (32U * t20);
    t22 = (0 + t21);
    t23 = (t16 + t22);
    t24 = (t0 + 6104);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memcpy(t28, t23, 32U);
    xsi_driver_first_trans_fast_port(t24);

LAB2:    t29 = (t0 + 5768);
    *((int *)t29) = 1;

LAB1:    return;
LAB3:    t8 = xsi_get_transient_memory(32U);
    memset(t8, 0, 32U);
    t9 = t8;
    memset(t9, (unsigned char)2, 32U);
    t10 = (t0 + 6104);
    t11 = (t10 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    memcpy(t14, t8, 32U);
    xsi_driver_first_trans_fast_port(t10);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 5U)
        goto LAB9;
    else
        goto LAB7;

LAB9:    t6 = (t2 + t5);
    t7 = (t1 + t5);
    if (*((unsigned char *)t6) != *((unsigned char *)t7))
        goto LAB6;

LAB10:    t5 = (t5 + 1);
    goto LAB8;

LAB12:    goto LAB2;

}


extern void work_a_2615964831_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2615964831_3212880686_p_0,(void *)work_a_2615964831_3212880686_p_1,(void *)work_a_2615964831_3212880686_p_2,(void *)work_a_2615964831_3212880686_p_3,(void *)work_a_2615964831_3212880686_p_4};
	xsi_register_didat("work_a_2615964831_3212880686", "isim/tb_branchpredictor_isim_beh.exe.sim/work/a_2615964831_3212880686.didat");
	xsi_register_executes(pe);
}
