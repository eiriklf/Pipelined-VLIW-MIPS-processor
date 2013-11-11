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
static const char *ng0 = "C:/Users/torbjlan/dmkonsttdt4255_work/exersise2experiment3/Forward.vhd";



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
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(53, ng0);
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
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = (unsigned char)0;

LAB30:    if (t2 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB48;

LAB49:    t2 = (unsigned char)0;

LAB50:    if (t2 == 1)
        goto LAB45;

LAB46:    t1 = (unsigned char)0;

LAB47:    if (t1 != 0)
        goto LAB43;

LAB44:    xsi_set_current_line(63, ng0);
    t3 = (t0 + 6953);
    t7 = (t0 + 4296);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 4200);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(54, ng0);
    t20 = (t0 + 6937);
    t22 = (t0 + 4296);
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
    t3 = (t0 + 6932);
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

LAB23:    xsi_set_current_line(57, ng0);
    t20 = (t0 + 6944);
    t22 = (t0 + 4296);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB25:    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 1832U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB37;

LAB38:    t17 = 0;

LAB39:    t1 = t17;
    goto LAB27;

LAB28:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6939);
    t9 = 1;
    if (5U == 5U)
        goto LAB31;

LAB32:    t9 = 0;

LAB33:    t13 = (!(t9));
    t2 = t13;
    goto LAB30;

LAB31:    t10 = 0;

LAB34:    if (t10 < 5U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB32;

LAB36:    t10 = (t10 + 1);
    goto LAB34;

LAB37:    t18 = 0;

LAB40:    if (t18 < 5U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB38;

LAB42:    t18 = (t18 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(60, ng0);
    t20 = (t0 + 6951);
    t22 = (t0 + 4296);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB45:    t14 = (t0 + 2472U);
    t15 = *((char **)t14);
    t14 = (t0 + 1832U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB57;

LAB58:    t17 = 0;

LAB59:    t1 = t17;
    goto LAB47;

LAB48:    t3 = (t0 + 2472U);
    t7 = *((char **)t3);
    t3 = (t0 + 6946);
    t9 = 1;
    if (5U == 5U)
        goto LAB51;

LAB52:    t9 = 0;

LAB53:    t13 = (!(t9));
    t2 = t13;
    goto LAB50;

LAB51:    t10 = 0;

LAB54:    if (t10 < 5U)
        goto LAB55;
    else
        goto LAB53;

LAB55:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB52;

LAB56:    t10 = (t10 + 1);
    goto LAB54;

LAB57:    t18 = 0;

LAB60:    if (t18 < 5U)
        goto LAB61;
    else
        goto LAB59;

LAB61:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB58;

LAB62:    t18 = (t18 + 1);
    goto LAB60;

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
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    xsi_set_current_line(73, ng0);
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
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB28;

LAB29:    t2 = (unsigned char)0;

LAB30:    if (t2 == 1)
        goto LAB25;

LAB26:    t1 = (unsigned char)0;

LAB27:    if (t1 != 0)
        goto LAB23;

LAB24:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB48;

LAB49:    t2 = (unsigned char)0;

LAB50:    if (t2 == 1)
        goto LAB45;

LAB46:    t1 = (unsigned char)0;

LAB47:    if (t1 != 0)
        goto LAB43;

LAB44:    xsi_set_current_line(83, ng0);
    t3 = (t0 + 6976);
    t7 = (t0 + 4360);
    t8 = (t7 + 56U);
    t11 = *((char **)t8);
    t12 = (t11 + 56U);
    t14 = *((char **)t12);
    memcpy(t14, t3, 2U);
    xsi_driver_first_trans_fast_port(t7);

LAB3:    t3 = (t0 + 4216);
    *((int *)t3) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(74, ng0);
    t20 = (t0 + 6960);
    t22 = (t0 + 4360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB5:    t14 = (t0 + 1032U);
    t15 = *((char **)t14);
    t14 = (t0 + 1992U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB17;

LAB18:    t17 = 0;

LAB19:    t1 = t17;
    goto LAB7;

LAB8:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t3 = (t0 + 6955);
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

LAB23:    xsi_set_current_line(77, ng0);
    t20 = (t0 + 6967);
    t22 = (t0 + 4360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB25:    t14 = (t0 + 1192U);
    t15 = *((char **)t14);
    t14 = (t0 + 1992U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB37;

LAB38:    t17 = 0;

LAB39:    t1 = t17;
    goto LAB27;

LAB28:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6962);
    t9 = 1;
    if (5U == 5U)
        goto LAB31;

LAB32:    t9 = 0;

LAB33:    t13 = (!(t9));
    t2 = t13;
    goto LAB30;

LAB31:    t10 = 0;

LAB34:    if (t10 < 5U)
        goto LAB35;
    else
        goto LAB33;

LAB35:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB32;

LAB36:    t10 = (t10 + 1);
    goto LAB34;

LAB37:    t18 = 0;

LAB40:    if (t18 < 5U)
        goto LAB41;
    else
        goto LAB39;

LAB41:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB38;

LAB42:    t18 = (t18 + 1);
    goto LAB40;

LAB43:    xsi_set_current_line(80, ng0);
    t20 = (t0 + 6974);
    t22 = (t0 + 4360);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 2U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB45:    t14 = (t0 + 2472U);
    t15 = *((char **)t14);
    t14 = (t0 + 1992U);
    t16 = *((char **)t14);
    t17 = 1;
    if (5U == 5U)
        goto LAB57;

LAB58:    t17 = 0;

LAB59:    t1 = t17;
    goto LAB47;

LAB48:    t3 = (t0 + 2472U);
    t7 = *((char **)t3);
    t3 = (t0 + 6969);
    t9 = 1;
    if (5U == 5U)
        goto LAB51;

LAB52:    t9 = 0;

LAB53:    t13 = (!(t9));
    t2 = t13;
    goto LAB50;

LAB51:    t10 = 0;

LAB54:    if (t10 < 5U)
        goto LAB55;
    else
        goto LAB53;

LAB55:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB52;

LAB56:    t10 = (t10 + 1);
    goto LAB54;

LAB57:    t18 = 0;

LAB60:    if (t18 < 5U)
        goto LAB61;
    else
        goto LAB59;

LAB61:    t14 = (t15 + t18);
    t19 = (t16 + t18);
    if (*((unsigned char *)t14) != *((unsigned char *)t19))
        goto LAB58;

LAB62:    t18 = (t18 + 1);
    goto LAB60;

}


extern void work_a_2090064486_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2090064486_3212880686_p_0,(void *)work_a_2090064486_3212880686_p_1};
	xsi_register_didat("work_a_2090064486_3212880686", "isim/tb_FPGA_isim_beh.exe.sim/work/a_2090064486_3212880686.didat");
	xsi_register_executes(pe);
}
