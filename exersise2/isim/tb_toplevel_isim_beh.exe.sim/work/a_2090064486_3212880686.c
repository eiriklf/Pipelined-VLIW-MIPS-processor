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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2/Forward.vhd";



static void work_a_2090064486_3212880686_p_0(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    unsigned char t30;
    unsigned char t31;
    unsigned char t32;
    unsigned char t33;
    unsigned char t34;
    unsigned int t35;
    unsigned char t36;
    char *t37;
    char *t38;
    unsigned char t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(50, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t13 = (t9 == (unsigned char)3);
    if (t13 == 1)
        goto LAB34;

LAB35:    t6 = (unsigned char)0;

LAB36:    if (t6 == 1)
        goto LAB31;

LAB32:    t5 = (unsigned char)0;

LAB33:    if (t5 == 1)
        goto LAB28;

LAB29:    t2 = (unsigned char)0;

LAB30:    if (t2 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 6329);
    t7 = (t0 + 3976);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 3880);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(51, ng0);
    t20 = (t0 + 6315);
    t22 = (t0 + 3976);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB5:    t14 = (t0 + 1032U);
    t15 = *((char **)t14);
    t14 = (t0 + 1672U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB17;

LAB18:    t17 = 0;

LAB19:    t1 = t17;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t3 = (t0 + 6310);
    t9 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t9 = 0;

LAB13:    t13 = (!(t9));
    t2 = t13;
    goto LAB10;

LAB11:    t10 = 0;

LAB14:    if (t10 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB12;

LAB16:    t10 = (t10 + 1);
    goto LAB14;

LAB17:    t18 = 0;

LAB20:    if (t18 < 5U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB18;

LAB22:    t18 = (t18 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(54, ng0);
    t42 = (t0 + 6327);
    t44 = (t0 + 3976);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memcpy(t48, t42, 2U);
    xsi_driver_first_trans_fast_port(t44);
    goto LAB3;

LAB25:    t26 = (t0 + 1192U);
    t37 = *((char **)t26);
    t26 = (t0 + 1672U);
    t38 = *((char **)t26);
    t39 = 1;
    if (5U == 5U)
        goto LAB58;

LAB59:    t39 = 0;

LAB60:    t1 = t39;
    goto LAB27;

LAB28:    t22 = (t0 + 1032U);
    t23 = *((char **)t22);
    t22 = (t0 + 1672U);
    t24 = *((char **)t22);
    t34 = 1;
    if (5U == 5U)
        goto LAB52;

LAB53:    t34 = 0;

LAB54:    t36 = (!(t34));
    t2 = t36;
    goto LAB30;

LAB31:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t29 = *((unsigned char *)t15);
    t30 = (t29 == (unsigned char)3);
    if (t30 == 1)
        goto LAB43;

LAB44:    t28 = (unsigned char)0;

LAB45:    t33 = (!(t28));
    t5 = t33;
    goto LAB33;

LAB34:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6317);
    t17 = 1;
    if (5U == 5U)
        goto LAB37;

LAB38:    t17 = 0;

LAB39:    t27 = (!(t17));
    t6 = t27;
    goto LAB36;

LAB37:    t10 = 0;

LAB40:    if (t10 < 5U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB38;

LAB42:    t10 = (t10 + 1);
    goto LAB40;

LAB43:    t14 = (t0 + 1032U);
    t16 = *((char **)t14);
    t14 = (t0 + 6322);
    t31 = 1;
    if (5U == 5U)
        goto LAB46;

LAB47:    t31 = 0;

LAB48:    t32 = (!(t31));
    t28 = t32;
    goto LAB45;

LAB46:    t18 = 0;

LAB49:    if (t18 < 5U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB47;

LAB51:    t18 = (t18 + 1);
    goto LAB49;

LAB52:    t35 = 0;

LAB55:    if (t35 < 5U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t22 = (t23 + t35);
    t25 = (t24 + t35);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB53;

LAB57:    t35 = (t35 + 1);
    goto LAB55;

LAB58:    t40 = 0;

LAB61:    if (t40 < 5U)
        goto LAB62;
    else
        goto LAB60;

LAB62:    t26 = (t37 + t40);
    t41 = (t38 + t40);
    if (*((unsigned char *)t26) != *((unsigned char *)t41))
        goto LAB59;

LAB63:    t40 = (t40 + 1);
    goto LAB61;

}

static void work_a_2090064486_3212880686_p_1(char *t0)
{
    unsigned char t1;
    unsigned char t2;
    char *t3;
    char *t4;
    unsigned char t5;
    unsigned char t6;
    char *t7;
    char *t8;
    unsigned char t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned char t13;
    char *t14;
    char *t15;
    char *t16;
    unsigned char t17;
    unsigned int t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    unsigned char t30;
    unsigned char t31;
    unsigned char t32;
    unsigned char t33;
    unsigned char t34;
    unsigned int t35;
    unsigned char t36;
    char *t37;
    char *t38;
    unsigned char t39;
    unsigned int t40;
    char *t41;
    char *t42;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t48;

LAB0:    xsi_set_current_line(66, ng0);
    t3 = (t0 + 1512U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB8;

LAB9:    t2 = (unsigned char)0;

LAB10:    if (t2 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:    t3 = (t0 + 1352U);
    t4 = *((char **)t3);
    t9 = *((unsigned char *)t4);
    t13 = (t9 == (unsigned char)3);
    if (t13 == 1)
        goto LAB34;

LAB35:    t6 = (unsigned char)0;

LAB36:    if (t6 == 1)
        goto LAB31;

LAB32:    t5 = (unsigned char)0;

LAB33:    if (t5 == 1)
        goto LAB28;

LAB29:    t2 = (unsigned char)0;

LAB30:    if (t2 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    xsi_set_current_line(71, ng0);
    t3 = (t0 + 6350);
    t7 = (t0 + 4040);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 3896);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(67, ng0);
    t20 = (t0 + 6336);
    t22 = (t0 + 4040);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB5:    t14 = (t0 + 1032U);
    t15 = *((char **)t14);
    t14 = (t0 + 1832U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB17;

LAB18:    t17 = 0;

LAB19:    t1 = t17;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t3 = (t0 + 6331);
    t9 = 1;
    if (5U == 5U)
        goto LAB11;

LAB12:    t9 = 0;

LAB13:    t13 = (!(t9));
    t2 = t13;
    goto LAB10;

LAB11:    t10 = 0;

LAB14:    if (t10 < 5U)
        goto LAB15;
    else
        goto LAB13;

LAB15:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB12;

LAB16:    t10 = (t10 + 1);
    goto LAB14;

LAB17:    t18 = 0;

LAB20:    if (t18 < 5U)
        goto LAB21;
    else
        goto LAB19;

LAB21:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB18;

LAB22:    t18 = (t18 + 1);
    goto LAB20;

LAB23:    xsi_set_current_line(69, ng0);
    t42 = (t0 + 6348);
    t44 = (t0 + 4040);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    t47 = (t46 + 56U);
    t48 = *((char **)t47);
    memcpy(t48, t42, 2U);
    xsi_driver_first_trans_fast_port(t44);
    goto LAB3;

LAB25:    t26 = (t0 + 1192U);
    t37 = *((char **)t26);
    t26 = (t0 + 1832U);
    t38 = *((char **)t26);
    t39 = 1;
    if (5U == 5U)
        goto LAB58;

LAB59:    t39 = 0;

LAB60:    t1 = t39;
    goto LAB27;

LAB28:    t22 = (t0 + 1032U);
    t23 = *((char **)t22);
    t22 = (t0 + 1832U);
    t24 = *((char **)t22);
    t34 = 1;
    if (5U == 5U)
        goto LAB52;

LAB53:    t34 = 0;

LAB54:    t36 = (!(t34));
    t2 = t36;
    goto LAB30;

LAB31:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t29 = *((unsigned char *)t15);
    t30 = (t29 == (unsigned char)3);
    if (t30 == 1)
        goto LAB43;

LAB44:    t28 = (unsigned char)0;

LAB45:    t33 = (!(t28));
    t5 = t33;
    goto LAB33;

LAB34:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6338);
    t17 = 1;
    if (5U == 5U)
        goto LAB37;

LAB38:    t17 = 0;

LAB39:    t27 = (!(t17));
    t6 = t27;
    goto LAB36;

LAB37:    t10 = 0;

LAB40:    if (t10 < 5U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB38;

LAB42:    t10 = (t10 + 1);
    goto LAB40;

LAB43:    t14 = (t0 + 1032U);
    t16 = *((char **)t14);
    t14 = (t0 + 6343);
    t31 = 1;
    if (5U == 5U)
        goto LAB46;

LAB47:    t31 = 0;

LAB48:    t32 = (!(t31));
    t28 = t32;
    goto LAB45;

LAB46:    t18 = 0;

LAB49:    if (t18 < 5U)
        goto LAB50;
    else
        goto LAB48;

LAB50:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB47;

LAB51:    t18 = (t18 + 1);
    goto LAB49;

LAB52:    t35 = 0;

LAB55:    if (t35 < 5U)
        goto LAB56;
    else
        goto LAB54;

LAB56:    t22 = (t23 + t35);
    t25 = (t24 + t35);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB53;

LAB57:    t35 = (t35 + 1);
    goto LAB55;

LAB58:    t40 = 0;

LAB61:    if (t40 < 5U)
        goto LAB62;
    else
        goto LAB60;

LAB62:    t26 = (t37 + t40);
    t41 = (t38 + t40);
    if (*((unsigned char *)t26) != *((unsigned char *)t41))
        goto LAB59;

LAB63:    t40 = (t40 + 1);
    goto LAB61;

}


extern void work_a_2090064486_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2090064486_3212880686_p_0,(void *)work_a_2090064486_3212880686_p_1};
	xsi_register_didat("work_a_2090064486_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_2090064486_3212880686.didat");
	xsi_register_executes(pe);
}
