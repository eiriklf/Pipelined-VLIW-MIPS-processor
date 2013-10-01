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
static const char *ng0 = "C:/Users/eiriklf/exersise1/ALUop.vhd";



static void work_a_3421472124_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    unsigned char t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t14;
    char *t15;
    unsigned char t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(44, ng0);
    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)2);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t3 = (t0 + 1032U);
    t11 = *((char **)t3);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)2);
    if (t13 == 1)
        goto LAB11;

LAB12:    t10 = (unsigned char)0;

LAB13:    t1 = t10;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB25;

LAB26:    t2 = (unsigned char)0;

LAB27:    if (t2 == 1)
        goto LAB22;

LAB23:    t3 = (t0 + 1192U);
    t11 = *((char **)t3);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 == 1)
        goto LAB28;

LAB29:    t10 = (unsigned char)0;

LAB30:    t1 = t10;

LAB24:    if (t1 != 0)
        goto LAB20;

LAB21:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB42;

LAB43:    t2 = (unsigned char)0;

LAB44:    if (t2 == 1)
        goto LAB39;

LAB40:    t1 = (unsigned char)0;

LAB41:    if (t1 != 0)
        goto LAB37;

LAB38:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB56;

LAB57:    t2 = (unsigned char)0;

LAB58:    if (t2 == 1)
        goto LAB53;

LAB54:    t1 = (unsigned char)0;

LAB55:    if (t1 != 0)
        goto LAB51;

LAB52:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t2 = *((unsigned char *)t4);
    t5 = (t2 == (unsigned char)2);
    if (t5 == 1)
        goto LAB67;

LAB68:    t1 = (unsigned char)0;

LAB69:    if (t1 != 0)
        goto LAB65;

LAB66:    xsi_set_current_line(60, ng0);
    t3 = (t0 + 4742);
    t7 = (t0 + 3072);
    t11 = (t7 + 56U);
    t14 = *((char **)t11);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    memcpy(t18, t3, 4U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 2992);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(46, ng0);
    t20 = (t0 + 4706);
    t22 = (t0 + 3072);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 4U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB10;

LAB11:    t3 = (t0 + 1352U);
    t14 = *((char **)t3);
    t3 = (t0 + 4702);
    t16 = 1;
    if (4U == 4U)
        goto LAB14;

LAB15:    t16 = 0;

LAB16:    t10 = t16;
    goto LAB13;

LAB14:    t17 = 0;

LAB17:    if (t17 < 4U)
        goto LAB18;
    else
        goto LAB16;

LAB18:    t18 = (t14 + t17);
    t19 = (t3 + t17);
    if (*((unsigned char *)t18) != *((unsigned char *)t19))
        goto LAB15;

LAB19:    t17 = (t17 + 1);
    goto LAB17;

LAB20:    xsi_set_current_line(49, ng0);
    t20 = (t0 + 4714);
    t22 = (t0 + 3072);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 4U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB22:    t1 = (unsigned char)1;
    goto LAB24;

LAB25:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB27;

LAB28:    t3 = (t0 + 1352U);
    t14 = *((char **)t3);
    t3 = (t0 + 4710);
    t16 = 1;
    if (4U == 4U)
        goto LAB31;

LAB32:    t16 = 0;

LAB33:    t10 = t16;
    goto LAB30;

LAB31:    t17 = 0;

LAB34:    if (t17 < 4U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t18 = (t14 + t17);
    t19 = (t3 + t17);
    if (*((unsigned char *)t18) != *((unsigned char *)t19))
        goto LAB32;

LAB36:    t17 = (t17 + 1);
    goto LAB34;

LAB37:    xsi_set_current_line(52, ng0);
    t19 = (t0 + 4722);
    t21 = (t0 + 3072);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 4U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB39:    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 4718);
    t10 = 1;
    if (4U == 4U)
        goto LAB45;

LAB46:    t10 = 0;

LAB47:    t1 = t10;
    goto LAB41;

LAB42:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB44;

LAB45:    t17 = 0;

LAB48:    if (t17 < 4U)
        goto LAB49;
    else
        goto LAB47;

LAB49:    t15 = (t11 + t17);
    t18 = (t3 + t17);
    if (*((unsigned char *)t15) != *((unsigned char *)t18))
        goto LAB46;

LAB50:    t17 = (t17 + 1);
    goto LAB48;

LAB51:    xsi_set_current_line(55, ng0);
    t19 = (t0 + 4730);
    t21 = (t0 + 3072);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 4U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB53:    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 4726);
    t10 = 1;
    if (4U == 4U)
        goto LAB59;

LAB60:    t10 = 0;

LAB61:    t1 = t10;
    goto LAB55;

LAB56:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB58;

LAB59:    t17 = 0;

LAB62:    if (t17 < 4U)
        goto LAB63;
    else
        goto LAB61;

LAB63:    t15 = (t11 + t17);
    t18 = (t3 + t17);
    if (*((unsigned char *)t15) != *((unsigned char *)t18))
        goto LAB60;

LAB64:    t17 = (t17 + 1);
    goto LAB62;

LAB65:    xsi_set_current_line(58, ng0);
    t18 = (t0 + 4738);
    t20 = (t0 + 3072);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 4U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB3;

LAB67:    t3 = (t0 + 1352U);
    t7 = *((char **)t3);
    t3 = (t0 + 4734);
    t6 = 1;
    if (4U == 4U)
        goto LAB70;

LAB71:    t6 = 0;

LAB72:    t1 = t6;
    goto LAB69;

LAB70:    t17 = 0;

LAB73:    if (t17 < 4U)
        goto LAB74;
    else
        goto LAB72;

LAB74:    t14 = (t7 + t17);
    t15 = (t3 + t17);
    if (*((unsigned char *)t14) != *((unsigned char *)t15))
        goto LAB71;

LAB75:    t17 = (t17 + 1);
    goto LAB73;

}


extern void work_a_3421472124_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3421472124_3212880686_p_0};
	xsi_register_didat("work_a_3421472124_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_3421472124_3212880686.didat");
	xsi_register_executes(pe);
}
