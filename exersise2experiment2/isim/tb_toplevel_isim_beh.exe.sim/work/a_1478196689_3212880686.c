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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2experiment2/Hazarddetection.vhd";



static void work_a_1478196689_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned char t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned char t10;
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

LAB0:    xsi_set_current_line(66, ng0);
    t1 = (t0 + 3752U);
    t2 = *((char **)t1);
    t1 = (t0 + 11653);
    t4 = 1;
    if (32U == 32U)
        goto LAB5;

LAB6:    t4 = 0;

LAB7:    if (t4 != 0)
        goto LAB3;

LAB4:
LAB11:    t15 = (t0 + 6600);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast(t15);

LAB2:    t20 = (t0 + 6488);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t8 = (t0 + 2952U);
    t9 = *((char **)t8);
    t10 = *((unsigned char *)t9);
    t8 = (t0 + 6600);
    t11 = (t8 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = t10;
    xsi_driver_first_trans_fast(t8);
    goto LAB2;

LAB5:    t5 = 0;

LAB8:    if (t5 < 32U)
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

static void work_a_1478196689_3212880686_p_1(char *t0)
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
    char *t10;
    unsigned char t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    unsigned char t19;
    unsigned char t20;
    unsigned char t21;
    unsigned char t22;

LAB0:    xsi_set_current_line(71, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = *((unsigned char *)t2);
    t4 = (t3 == (unsigned char)3);
    if (t4 != 0)
        goto LAB2;

LAB4:    xsi_set_current_line(126, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(127, ng0);
    t1 = (t0 + 6728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(128, ng0);
    t1 = (t0 + 6856);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(130, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(131, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(132, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(133, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(134, ng0);
    t1 = (t0 + 6664);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(135, ng0);
    t1 = (t0 + 6792);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(136, ng0);
    t1 = (t0 + 6728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB3:    t1 = (t0 + 6504);
    *((int *)t1) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(72, ng0);
    t1 = (t0 + 6664);
    t5 = (t1 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    *((unsigned char *)t8) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(73, ng0);
    t1 = (t0 + 6728);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(74, ng0);
    t1 = (t0 + 2472U);
    t2 = *((char **)t1);
    t1 = (t0 + 4328U);
    t5 = *((char **)t1);
    t4 = 1;
    if (2U == 2U)
        goto LAB11;

LAB12:    t4 = 0;

LAB13:    if (t4 == 1)
        goto LAB8;

LAB9:    t7 = (t0 + 2472U);
    t8 = *((char **)t7);
    t7 = (t0 + 4448U);
    t10 = *((char **)t7);
    t11 = 1;
    if (2U == 2U)
        goto LAB17;

LAB18:    t11 = 0;

LAB19:    t3 = t11;

LAB10:    if (t3 != 0)
        goto LAB5;

LAB7:    xsi_set_current_line(79, ng0);
    t1 = (t0 + 6792);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB6:    xsi_set_current_line(81, ng0);
    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t19 = (t11 == (unsigned char)2);
    if (t19 == 1)
        goto LAB29;

LAB30:    t4 = (unsigned char)0;

LAB31:    if (t4 == 1)
        goto LAB26;

LAB27:    t3 = (unsigned char)0;

LAB28:    if (t3 != 0)
        goto LAB23;

LAB25:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t19 = (t11 == (unsigned char)3);
    if (t19 == 1)
        goto LAB43;

LAB44:    t4 = (unsigned char)0;

LAB45:    if (t4 == 1)
        goto LAB40;

LAB41:    t3 = (unsigned char)0;

LAB42:    if (t3 != 0)
        goto LAB38;

LAB39:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t4 = *((unsigned char *)t2);
    t11 = (t4 == (unsigned char)3);
    if (t11 == 1)
        goto LAB54;

LAB55:    t3 = (unsigned char)0;

LAB56:    if (t3 != 0)
        goto LAB52;

LAB53:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t19 = (t11 == (unsigned char)3);
    if (t19 == 1)
        goto LAB68;

LAB69:    t4 = (unsigned char)0;

LAB70:    if (t4 == 1)
        goto LAB65;

LAB66:    t3 = (unsigned char)0;

LAB67:    if (t3 != 0)
        goto LAB63;

LAB64:    t1 = (t0 + 3432U);
    t2 = *((char **)t1);
    t11 = *((unsigned char *)t2);
    t19 = (t11 == (unsigned char)2);
    if (t19 == 1)
        goto LAB82;

LAB83:    t4 = (unsigned char)0;

LAB84:    if (t4 == 1)
        goto LAB79;

LAB80:    t3 = (unsigned char)0;

LAB81:    if (t3 != 0)
        goto LAB77;

LAB78:    xsi_set_current_line(114, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(115, ng0);
    t1 = (t0 + 6856);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(117, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(118, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(119, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);

LAB24:    goto LAB3;

LAB5:    xsi_set_current_line(76, ng0);
    t14 = (t0 + 6792);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    *((unsigned char *)t18) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t14);
    goto LAB6;

LAB8:    t3 = (unsigned char)1;
    goto LAB10;

LAB11:    t9 = 0;

LAB14:    if (t9 < 2U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t1 = (t2 + t9);
    t6 = (t5 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t6))
        goto LAB12;

LAB16:    t9 = (t9 + 1);
    goto LAB14;

LAB17:    t12 = 0;

LAB20:    if (t12 < 2U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t7 = (t8 + t12);
    t13 = (t10 + t12);
    if (*((unsigned char *)t7) != *((unsigned char *)t13))
        goto LAB18;

LAB22:    t12 = (t12 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(82, ng0);
    t8 = (t0 + 6856);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(84, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(85, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(86, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(87, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

LAB26:    t8 = (t0 + 3912U);
    t10 = *((char **)t8);
    t21 = *((unsigned char *)t10);
    t22 = (t21 == (unsigned char)3);
    t3 = t22;
    goto LAB28;

LAB29:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 4208U);
    t6 = *((char **)t1);
    t20 = 1;
    if (6U == 6U)
        goto LAB32;

LAB33:    t20 = 0;

LAB34:    t4 = t20;
    goto LAB31;

LAB32:    t9 = 0;

LAB35:    if (t9 < 6U)
        goto LAB36;
    else
        goto LAB34;

LAB36:    t1 = (t5 + t9);
    t7 = (t6 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t7))
        goto LAB33;

LAB37:    t9 = (t9 + 1);
    goto LAB35;

LAB38:    xsi_set_current_line(90, ng0);
    t8 = (t0 + 6856);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(91, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(92, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(93, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(94, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

LAB40:    t8 = (t0 + 3912U);
    t10 = *((char **)t8);
    t21 = *((unsigned char *)t10);
    t22 = (t21 == (unsigned char)3);
    t3 = t22;
    goto LAB42;

LAB43:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 4208U);
    t6 = *((char **)t1);
    t20 = 1;
    if (6U == 6U)
        goto LAB46;

LAB47:    t20 = 0;

LAB48:    t4 = t20;
    goto LAB45;

LAB46:    t9 = 0;

LAB49:    if (t9 < 6U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t1 = (t5 + t9);
    t7 = (t6 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t7))
        goto LAB47;

LAB51:    t9 = (t9 + 1);
    goto LAB49;

LAB52:    xsi_set_current_line(96, ng0);
    t8 = (t0 + 6856);
    t10 = (t8 + 56U);
    t13 = *((char **)t10);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    *((unsigned char *)t15) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(97, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(98, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(99, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(100, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

LAB54:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 4208U);
    t6 = *((char **)t1);
    t19 = 1;
    if (6U == 6U)
        goto LAB57;

LAB58:    t19 = 0;

LAB59:    t20 = (!(t19));
    t3 = t20;
    goto LAB56;

LAB57:    t9 = 0;

LAB60:    if (t9 < 6U)
        goto LAB61;
    else
        goto LAB59;

LAB61:    t1 = (t5 + t9);
    t7 = (t6 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t7))
        goto LAB58;

LAB62:    t9 = (t9 + 1);
    goto LAB60;

LAB63:    xsi_set_current_line(102, ng0);
    t8 = (t0 + 6856);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(103, ng0);
    t1 = (t0 + 6920);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)8;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(104, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(105, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(106, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

LAB65:    t8 = (t0 + 3912U);
    t10 = *((char **)t8);
    t21 = *((unsigned char *)t10);
    t22 = (t21 == (unsigned char)2);
    t3 = t22;
    goto LAB67;

LAB68:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 4208U);
    t6 = *((char **)t1);
    t20 = 1;
    if (6U == 6U)
        goto LAB71;

LAB72:    t20 = 0;

LAB73:    t4 = t20;
    goto LAB70;

LAB71:    t9 = 0;

LAB74:    if (t9 < 6U)
        goto LAB75;
    else
        goto LAB73;

LAB75:    t1 = (t5 + t9);
    t7 = (t6 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t7))
        goto LAB72;

LAB76:    t9 = (t9 + 1);
    goto LAB74;

LAB77:    xsi_set_current_line(108, ng0);
    t8 = (t0 + 6920);
    t13 = (t8 + 56U);
    t14 = *((char **)t13);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    *((unsigned char *)t16) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t8);
    xsi_set_current_line(109, ng0);
    t1 = (t0 + 6984);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(110, ng0);
    t1 = (t0 + 7048);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(111, ng0);
    t1 = (t0 + 6856);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    xsi_set_current_line(112, ng0);
    t1 = (t0 + 7112);
    t2 = (t1 + 56U);
    t5 = *((char **)t2);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    *((unsigned char *)t7) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t1);
    goto LAB24;

LAB79:    t8 = (t0 + 3912U);
    t10 = *((char **)t8);
    t21 = *((unsigned char *)t10);
    t22 = (t21 == (unsigned char)2);
    t3 = t22;
    goto LAB81;

LAB82:    t1 = (t0 + 1352U);
    t5 = *((char **)t1);
    t1 = (t0 + 4208U);
    t6 = *((char **)t1);
    t20 = 1;
    if (6U == 6U)
        goto LAB85;

LAB86:    t20 = 0;

LAB87:    t4 = t20;
    goto LAB84;

LAB85:    t9 = 0;

LAB88:    if (t9 < 6U)
        goto LAB89;
    else
        goto LAB87;

LAB89:    t1 = (t5 + t9);
    t7 = (t6 + t9);
    if (*((unsigned char *)t1) != *((unsigned char *)t7))
        goto LAB86;

LAB90:    t9 = (t9 + 1);
    goto LAB88;

}

static void work_a_1478196689_3212880686_p_2(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    int t6;
    char *t7;
    int t8;
    char *t9;
    int t10;
    unsigned char t11;
    char *t12;
    char *t13;
    unsigned char t14;
    unsigned int t15;
    char *t16;
    unsigned char t17;
    unsigned char t18;
    char *t19;
    char *t20;
    unsigned char t21;
    unsigned char t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    unsigned char t26;
    char *t27;
    unsigned char t28;
    unsigned char t29;
    char *t30;
    unsigned char t31;
    unsigned char t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;
    char *t37;

LAB0:    xsi_set_current_line(142, ng0);
    t1 = (t0 + 2632U);
    t2 = *((char **)t1);
    t1 = (t0 + 4328U);
    t3 = *((char **)t1);
    t4 = xsi_mem_cmp(t3, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB8:    t1 = (t0 + 4448U);
    t5 = *((char **)t1);
    t6 = xsi_mem_cmp(t5, t2, 2U);
    if (t6 == 1)
        goto LAB4;

LAB9:    t1 = (t0 + 4688U);
    t7 = *((char **)t1);
    t8 = xsi_mem_cmp(t7, t2, 2U);
    if (t8 == 1)
        goto LAB5;

LAB10:    t1 = (t0 + 4568U);
    t9 = *((char **)t1);
    t10 = xsi_mem_cmp(t9, t2, 2U);
    if (t10 == 1)
        goto LAB6;

LAB11:
LAB7:    xsi_set_current_line(179, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t1 = (t0 + 7176);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB2:    t1 = (t0 + 6520);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(144, ng0);
    t1 = (t0 + 1352U);
    t12 = *((char **)t1);
    t1 = (t0 + 4208U);
    t13 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB19;

LAB20:    t14 = 0;

LAB21:    if (t14 == 1)
        goto LAB16;

LAB17:    t11 = (unsigned char)0;

LAB18:    if (t11 != 0)
        goto LAB13;

LAB15:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB39;

LAB40:    t14 = 0;

LAB41:    if (t14 == 1)
        goto LAB36;

LAB37:    t11 = (unsigned char)0;

LAB38:    if (t11 != 0)
        goto LAB34;

LAB35:    xsi_set_current_line(149, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t1 = (t0 + 7176);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB14:    goto LAB2;

LAB4:    xsi_set_current_line(153, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB60;

LAB61:    t14 = 0;

LAB62:    if (t14 == 1)
        goto LAB57;

LAB58:    t11 = (unsigned char)0;

LAB59:    if (t11 != 0)
        goto LAB54;

LAB56:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB80;

LAB81:    t14 = 0;

LAB82:    if (t14 == 1)
        goto LAB77;

LAB78:    t11 = (unsigned char)0;

LAB79:    if (t11 != 0)
        goto LAB75;

LAB76:    xsi_set_current_line(158, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t1 = (t0 + 7176);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB55:    goto LAB2;

LAB5:    xsi_set_current_line(162, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB101;

LAB102:    t14 = 0;

LAB103:    if (t14 == 1)
        goto LAB98;

LAB99:    t11 = (unsigned char)0;

LAB100:    if (t11 != 0)
        goto LAB95;

LAB97:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB121;

LAB122:    t14 = 0;

LAB123:    if (t14 == 1)
        goto LAB118;

LAB119:    t11 = (unsigned char)0;

LAB120:    if (t11 != 0)
        goto LAB116;

LAB117:    xsi_set_current_line(167, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t1 = (t0 + 7176);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB96:    goto LAB2;

LAB6:    xsi_set_current_line(171, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB142;

LAB143:    t14 = 0;

LAB144:    if (t14 == 1)
        goto LAB139;

LAB140:    t11 = (unsigned char)0;

LAB141:    if (t11 != 0)
        goto LAB136;

LAB138:    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t1 = (t0 + 4208U);
    t3 = *((char **)t1);
    t14 = 1;
    if (6U == 6U)
        goto LAB162;

LAB163:    t14 = 0;

LAB164:    if (t14 == 1)
        goto LAB159;

LAB160:    t11 = (unsigned char)0;

LAB161:    if (t11 != 0)
        goto LAB157;

LAB158:    xsi_set_current_line(176, ng0);
    t1 = (t0 + 4568U);
    t2 = *((char **)t1);
    t1 = (t0 + 7176);
    t3 = (t1 + 56U);
    t5 = *((char **)t3);
    t7 = (t5 + 56U);
    t9 = *((char **)t7);
    memcpy(t9, t2, 2U);
    xsi_driver_first_trans_fast_port(t1);

LAB137:    goto LAB2;

LAB12:;
LAB13:    xsi_set_current_line(145, ng0);
    t19 = (t0 + 4328U);
    t33 = *((char **)t19);
    t19 = (t0 + 7176);
    t34 = (t19 + 56U);
    t35 = *((char **)t34);
    t36 = (t35 + 56U);
    t37 = *((char **)t36);
    memcpy(t37, t33, 2U);
    xsi_driver_first_trans_fast_port(t19);
    goto LAB14;

LAB16:    t19 = (t0 + 3432U);
    t20 = *((char **)t19);
    t21 = *((unsigned char *)t20);
    t22 = (t21 == (unsigned char)3);
    if (t22 == 1)
        goto LAB28;

LAB29:    t18 = (unsigned char)0;

LAB30:    if (t18 == 1)
        goto LAB25;

LAB26:    t19 = (t0 + 3432U);
    t27 = *((char **)t19);
    t28 = *((unsigned char *)t27);
    t29 = (t28 == (unsigned char)2);
    if (t29 == 1)
        goto LAB31;

LAB32:    t26 = (unsigned char)0;

LAB33:    t17 = t26;

LAB27:    t11 = t17;
    goto LAB18;

LAB19:    t15 = 0;

LAB22:    if (t15 < 6U)
        goto LAB23;
    else
        goto LAB21;

LAB23:    t1 = (t12 + t15);
    t16 = (t13 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t16))
        goto LAB20;

LAB24:    t15 = (t15 + 1);
    goto LAB22;

LAB25:    t17 = (unsigned char)1;
    goto LAB27;

LAB28:    t19 = (t0 + 3912U);
    t23 = *((char **)t19);
    t24 = *((unsigned char *)t23);
    t25 = (t24 == (unsigned char)3);
    t18 = t25;
    goto LAB30;

LAB31:    t19 = (t0 + 3912U);
    t30 = *((char **)t19);
    t31 = *((unsigned char *)t30);
    t32 = (t31 == (unsigned char)3);
    t26 = t32;
    goto LAB33;

LAB34:    xsi_set_current_line(147, ng0);
    t7 = (t0 + 4448U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB14;

LAB36:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)2);
    if (t22 == 1)
        goto LAB48;

LAB49:    t18 = (unsigned char)0;

LAB50:    if (t18 == 1)
        goto LAB45;

LAB46:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB51;

LAB52:    t26 = (unsigned char)0;

LAB53:    t17 = t26;

LAB47:    t11 = t17;
    goto LAB38;

LAB39:    t15 = 0;

LAB42:    if (t15 < 6U)
        goto LAB43;
    else
        goto LAB41;

LAB43:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB40;

LAB44:    t15 = (t15 + 1);
    goto LAB42;

LAB45:    t17 = (unsigned char)1;
    goto LAB47;

LAB48:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)2);
    t18 = t25;
    goto LAB50;

LAB51:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)2);
    t26 = t32;
    goto LAB53;

LAB54:    xsi_set_current_line(154, ng0);
    t7 = (t0 + 4328U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB55;

LAB57:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)3);
    if (t22 == 1)
        goto LAB69;

LAB70:    t18 = (unsigned char)0;

LAB71:    if (t18 == 1)
        goto LAB66;

LAB67:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)2);
    if (t29 == 1)
        goto LAB72;

LAB73:    t26 = (unsigned char)0;

LAB74:    t17 = t26;

LAB68:    t11 = t17;
    goto LAB59;

LAB60:    t15 = 0;

LAB63:    if (t15 < 6U)
        goto LAB64;
    else
        goto LAB62;

LAB64:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB61;

LAB65:    t15 = (t15 + 1);
    goto LAB63;

LAB66:    t17 = (unsigned char)1;
    goto LAB68;

LAB69:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)3);
    t18 = t25;
    goto LAB71;

LAB72:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)3);
    t26 = t32;
    goto LAB74;

LAB75:    xsi_set_current_line(156, ng0);
    t7 = (t0 + 4568U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB55;

LAB77:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)2);
    if (t22 == 1)
        goto LAB89;

LAB90:    t18 = (unsigned char)0;

LAB91:    if (t18 == 1)
        goto LAB86;

LAB87:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB92;

LAB93:    t26 = (unsigned char)0;

LAB94:    t17 = t26;

LAB88:    t11 = t17;
    goto LAB79;

LAB80:    t15 = 0;

LAB83:    if (t15 < 6U)
        goto LAB84;
    else
        goto LAB82;

LAB84:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB81;

LAB85:    t15 = (t15 + 1);
    goto LAB83;

LAB86:    t17 = (unsigned char)1;
    goto LAB88;

LAB89:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)2);
    t18 = t25;
    goto LAB91;

LAB92:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)2);
    t26 = t32;
    goto LAB94;

LAB95:    xsi_set_current_line(163, ng0);
    t7 = (t0 + 4568U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB96;

LAB98:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)3);
    if (t22 == 1)
        goto LAB110;

LAB111:    t18 = (unsigned char)0;

LAB112:    if (t18 == 1)
        goto LAB107;

LAB108:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)2);
    if (t29 == 1)
        goto LAB113;

LAB114:    t26 = (unsigned char)0;

LAB115:    t17 = t26;

LAB109:    t11 = t17;
    goto LAB100;

LAB101:    t15 = 0;

LAB104:    if (t15 < 6U)
        goto LAB105;
    else
        goto LAB103;

LAB105:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB102;

LAB106:    t15 = (t15 + 1);
    goto LAB104;

LAB107:    t17 = (unsigned char)1;
    goto LAB109;

LAB110:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)3);
    t18 = t25;
    goto LAB112;

LAB113:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)3);
    t26 = t32;
    goto LAB115;

LAB116:    xsi_set_current_line(165, ng0);
    t7 = (t0 + 4688U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB96;

LAB118:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)2);
    if (t22 == 1)
        goto LAB130;

LAB131:    t18 = (unsigned char)0;

LAB132:    if (t18 == 1)
        goto LAB127;

LAB128:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB133;

LAB134:    t26 = (unsigned char)0;

LAB135:    t17 = t26;

LAB129:    t11 = t17;
    goto LAB120;

LAB121:    t15 = 0;

LAB124:    if (t15 < 6U)
        goto LAB125;
    else
        goto LAB123;

LAB125:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB122;

LAB126:    t15 = (t15 + 1);
    goto LAB124;

LAB127:    t17 = (unsigned char)1;
    goto LAB129;

LAB130:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)2);
    t18 = t25;
    goto LAB132;

LAB133:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)2);
    t26 = t32;
    goto LAB135;

LAB136:    xsi_set_current_line(172, ng0);
    t7 = (t0 + 4448U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB137;

LAB139:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)3);
    if (t22 == 1)
        goto LAB151;

LAB152:    t18 = (unsigned char)0;

LAB153:    if (t18 == 1)
        goto LAB148;

LAB149:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)2);
    if (t29 == 1)
        goto LAB154;

LAB155:    t26 = (unsigned char)0;

LAB156:    t17 = t26;

LAB150:    t11 = t17;
    goto LAB141;

LAB142:    t15 = 0;

LAB145:    if (t15 < 6U)
        goto LAB146;
    else
        goto LAB144;

LAB146:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB143;

LAB147:    t15 = (t15 + 1);
    goto LAB145;

LAB148:    t17 = (unsigned char)1;
    goto LAB150;

LAB151:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)3);
    t18 = t25;
    goto LAB153;

LAB154:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)3);
    t26 = t32;
    goto LAB156;

LAB157:    xsi_set_current_line(174, ng0);
    t7 = (t0 + 4688U);
    t19 = *((char **)t7);
    t7 = (t0 + 7176);
    t20 = (t7 + 56U);
    t23 = *((char **)t20);
    t27 = (t23 + 56U);
    t30 = *((char **)t27);
    memcpy(t30, t19, 2U);
    xsi_driver_first_trans_fast_port(t7);
    goto LAB137;

LAB159:    t7 = (t0 + 3432U);
    t9 = *((char **)t7);
    t21 = *((unsigned char *)t9);
    t22 = (t21 == (unsigned char)2);
    if (t22 == 1)
        goto LAB171;

LAB172:    t18 = (unsigned char)0;

LAB173:    if (t18 == 1)
        goto LAB168;

LAB169:    t7 = (t0 + 3432U);
    t13 = *((char **)t7);
    t28 = *((unsigned char *)t13);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB174;

LAB175:    t26 = (unsigned char)0;

LAB176:    t17 = t26;

LAB170:    t11 = t17;
    goto LAB161;

LAB162:    t15 = 0;

LAB165:    if (t15 < 6U)
        goto LAB166;
    else
        goto LAB164;

LAB166:    t1 = (t2 + t15);
    t5 = (t3 + t15);
    if (*((unsigned char *)t1) != *((unsigned char *)t5))
        goto LAB163;

LAB167:    t15 = (t15 + 1);
    goto LAB165;

LAB168:    t17 = (unsigned char)1;
    goto LAB170;

LAB171:    t7 = (t0 + 3912U);
    t12 = *((char **)t7);
    t24 = *((unsigned char *)t12);
    t25 = (t24 == (unsigned char)2);
    t18 = t25;
    goto LAB173;

LAB174:    t7 = (t0 + 3912U);
    t16 = *((char **)t7);
    t31 = *((unsigned char *)t16);
    t32 = (t31 == (unsigned char)2);
    t26 = t32;
    goto LAB176;

}


extern void work_a_1478196689_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1478196689_3212880686_p_0,(void *)work_a_1478196689_3212880686_p_1,(void *)work_a_1478196689_3212880686_p_2};
	xsi_register_didat("work_a_1478196689_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_1478196689_3212880686.didat");
	xsi_register_executes(pe);
}
