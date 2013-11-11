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
    unsigned int t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

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
    t6 = *((unsigned char *)t4);
    t9 = (t6 == (unsigned char)3);
    if (t9 == 1)
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

LAB24:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t6 = *((unsigned char *)t4);
    t9 = (t6 == (unsigned char)3);
    if (t9 == 1)
        goto LAB63;

LAB64:    t5 = (unsigned char)0;

LAB65:    if (t5 == 1)
        goto LAB60;

LAB61:    t2 = (unsigned char)0;

LAB62:    if (t2 == 1)
        goto LAB57;

LAB58:    t1 = (unsigned char)0;

LAB59:    if (t1 != 0)
        goto LAB55;

LAB56:    xsi_set_current_line(65, ng0);
    t3 = (t0 + 6963);
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

LAB23:    xsi_set_current_line(58, ng0);
    t26 = (t0 + 6949);
    t36 = (t0 + 4296);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t26, 2U);
    xsi_driver_first_trans_fast_port(t36);
    goto LAB3;

LAB25:    t22 = (t0 + 1192U);
    t23 = *((char **)t22);
    t22 = (t0 + 1832U);
    t24 = *((char **)t22);
    t33 = 1;
    if (5U == 5U)
        goto LAB49;

LAB50:    t33 = 0;

LAB51:    t1 = t33;
    goto LAB27;

LAB28:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t28 = *((unsigned char *)t15);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB40;

LAB41:    t27 = (unsigned char)0;

LAB42:    t32 = (!(t27));
    t2 = t32;
    goto LAB30;

LAB31:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6939);
    t13 = 1;
    if (5U == 5U)
        goto LAB34;

LAB35:    t13 = 0;

LAB36:    t17 = (!(t13));
    t5 = t17;
    goto LAB33;

LAB34:    t10 = 0;

LAB37:    if (t10 < 5U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB35;

LAB39:    t10 = (t10 + 1);
    goto LAB37;

LAB40:    t14 = (t0 + 1032U);
    t16 = *((char **)t14);
    t14 = (t0 + 6944);
    t30 = 1;
    if (5U == 5U)
        goto LAB43;

LAB44:    t30 = 0;

LAB45:    t31 = (!(t30));
    t27 = t31;
    goto LAB42;

LAB43:    t18 = 0;

LAB46:    if (t18 < 5U)
        goto LAB47;
    else
        goto LAB45;

LAB47:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB44;

LAB48:    t18 = (t18 + 1);
    goto LAB46;

LAB49:    t34 = 0;

LAB52:    if (t34 < 5U)
        goto LAB53;
    else
        goto LAB51;

LAB53:    t22 = (t23 + t34);
    t25 = (t24 + t34);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB50;

LAB54:    t34 = (t34 + 1);
    goto LAB52;

LAB55:    xsi_set_current_line(62, ng0);
    t26 = (t0 + 6961);
    t36 = (t0 + 4296);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t26, 2U);
    xsi_driver_first_trans_fast_port(t36);
    goto LAB3;

LAB57:    t22 = (t0 + 2472U);
    t23 = *((char **)t22);
    t22 = (t0 + 1832U);
    t24 = *((char **)t22);
    t33 = 1;
    if (5U == 5U)
        goto LAB81;

LAB82:    t33 = 0;

LAB83:    t1 = t33;
    goto LAB59;

LAB60:    t14 = (t0 + 1352U);
    t15 = *((char **)t14);
    t28 = *((unsigned char *)t15);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB72;

LAB73:    t27 = (unsigned char)0;

LAB74:    t32 = (!(t27));
    t2 = t32;
    goto LAB62;

LAB63:    t3 = (t0 + 2472U);
    t7 = *((char **)t3);
    t3 = (t0 + 6951);
    t13 = 1;
    if (5U == 5U)
        goto LAB66;

LAB67:    t13 = 0;

LAB68:    t17 = (!(t13));
    t5 = t17;
    goto LAB65;

LAB66:    t10 = 0;

LAB69:    if (t10 < 5U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB67;

LAB71:    t10 = (t10 + 1);
    goto LAB69;

LAB72:    t14 = (t0 + 1192U);
    t16 = *((char **)t14);
    t14 = (t0 + 6956);
    t30 = 1;
    if (5U == 5U)
        goto LAB75;

LAB76:    t30 = 0;

LAB77:    t31 = (!(t30));
    t27 = t31;
    goto LAB74;

LAB75:    t18 = 0;

LAB78:    if (t18 < 5U)
        goto LAB79;
    else
        goto LAB77;

LAB79:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB76;

LAB80:    t18 = (t18 + 1);
    goto LAB78;

LAB81:    t34 = 0;

LAB84:    if (t34 < 5U)
        goto LAB85;
    else
        goto LAB83;

LAB85:    t22 = (t23 + t34);
    t25 = (t24 + t34);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB82;

LAB86:    t34 = (t34 + 1);
    goto LAB84;

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
    unsigned int t34;
    char *t36;
    char *t37;
    char *t38;
    char *t39;
    char *t40;

LAB0:    xsi_set_current_line(75, ng0);
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
    t6 = *((unsigned char *)t4);
    t9 = (t6 == (unsigned char)3);
    if (t9 == 1)
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

LAB24:    t3 = (t0 + 1672U);
    t4 = *((char **)t3);
    t6 = *((unsigned char *)t4);
    t9 = (t6 == (unsigned char)3);
    if (t9 == 1)
        goto LAB63;

LAB64:    t5 = (unsigned char)0;

LAB65:    if (t5 == 1)
        goto LAB60;

LAB61:    t2 = (unsigned char)0;

LAB62:    if (t2 == 1)
        goto LAB57;

LAB58:    t1 = (unsigned char)0;

LAB59:    if (t1 != 0)
        goto LAB55;

LAB56:    xsi_set_current_line(87, ng0);
    t3 = (t0 + 6996);
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
LAB2:    xsi_set_current_line(76, ng0);
    t20 = (t0 + 6970);
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
    t3 = (t0 + 6965);
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

LAB23:    xsi_set_current_line(80, ng0);
    t26 = (t0 + 6982);
    t36 = (t0 + 4360);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t26, 2U);
    xsi_driver_first_trans_fast_port(t36);
    goto LAB3;

LAB25:    t22 = (t0 + 1192U);
    t23 = *((char **)t22);
    t22 = (t0 + 1992U);
    t24 = *((char **)t22);
    t33 = 1;
    if (5U == 5U)
        goto LAB49;

LAB50:    t33 = 0;

LAB51:    t1 = t33;
    goto LAB27;

LAB28:    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t28 = *((unsigned char *)t15);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB40;

LAB41:    t27 = (unsigned char)0;

LAB42:    t32 = (!(t27));
    t2 = t32;
    goto LAB30;

LAB31:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t3 = (t0 + 6972);
    t13 = 1;
    if (5U == 5U)
        goto LAB34;

LAB35:    t13 = 0;

LAB36:    t17 = (!(t13));
    t5 = t17;
    goto LAB33;

LAB34:    t10 = 0;

LAB37:    if (t10 < 5U)
        goto LAB38;
    else
        goto LAB36;

LAB38:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB35;

LAB39:    t10 = (t10 + 1);
    goto LAB37;

LAB40:    t14 = (t0 + 1032U);
    t16 = *((char **)t14);
    t14 = (t0 + 6977);
    t30 = 1;
    if (5U == 5U)
        goto LAB43;

LAB44:    t30 = 0;

LAB45:    t31 = (!(t30));
    t27 = t31;
    goto LAB42;

LAB43:    t18 = 0;

LAB46:    if (t18 < 5U)
        goto LAB47;
    else
        goto LAB45;

LAB47:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB44;

LAB48:    t18 = (t18 + 1);
    goto LAB46;

LAB49:    t34 = 0;

LAB52:    if (t34 < 5U)
        goto LAB53;
    else
        goto LAB51;

LAB53:    t22 = (t23 + t34);
    t25 = (t24 + t34);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB50;

LAB54:    t34 = (t34 + 1);
    goto LAB52;

LAB55:    xsi_set_current_line(84, ng0);
    t26 = (t0 + 6994);
    t36 = (t0 + 4360);
    t37 = (t36 + 56U);
    t38 = *((char **)t37);
    t39 = (t38 + 56U);
    t40 = *((char **)t39);
    memcpy(t40, t26, 2U);
    xsi_driver_first_trans_fast_port(t36);
    goto LAB3;

LAB57:    t22 = (t0 + 2472U);
    t23 = *((char **)t22);
    t22 = (t0 + 1992U);
    t24 = *((char **)t22);
    t33 = 1;
    if (5U == 5U)
        goto LAB81;

LAB82:    t33 = 0;

LAB83:    t1 = t33;
    goto LAB59;

LAB60:    t14 = (t0 + 1352U);
    t15 = *((char **)t14);
    t28 = *((unsigned char *)t15);
    t29 = (t28 == (unsigned char)3);
    if (t29 == 1)
        goto LAB72;

LAB73:    t27 = (unsigned char)0;

LAB74:    t32 = (!(t27));
    t2 = t32;
    goto LAB62;

LAB63:    t3 = (t0 + 2472U);
    t7 = *((char **)t3);
    t3 = (t0 + 6984);
    t13 = 1;
    if (5U == 5U)
        goto LAB66;

LAB67:    t13 = 0;

LAB68:    t17 = (!(t13));
    t5 = t17;
    goto LAB65;

LAB66:    t10 = 0;

LAB69:    if (t10 < 5U)
        goto LAB70;
    else
        goto LAB68;

LAB70:    t11 = (t7 + t10);
    t12 = (t3 + t10);
    if (*((unsigned char *)t11) != *((unsigned char *)t12))
        goto LAB67;

LAB71:    t10 = (t10 + 1);
    goto LAB69;

LAB72:    t14 = (t0 + 1192U);
    t16 = *((char **)t14);
    t14 = (t0 + 6989);
    t30 = 1;
    if (5U == 5U)
        goto LAB75;

LAB76:    t30 = 0;

LAB77:    t31 = (!(t30));
    t27 = t31;
    goto LAB74;

LAB75:    t18 = 0;

LAB78:    if (t18 < 5U)
        goto LAB79;
    else
        goto LAB77;

LAB79:    t20 = (t16 + t18);
    t21 = (t14 + t18);
    if (*((unsigned char *)t20) != *((unsigned char *)t21))
        goto LAB76;

LAB80:    t18 = (t18 + 1);
    goto LAB78;

LAB81:    t34 = 0;

LAB84:    if (t34 < 5U)
        goto LAB85;
    else
        goto LAB83;

LAB85:    t22 = (t23 + t34);
    t25 = (t24 + t34);
    if (*((unsigned char *)t22) != *((unsigned char *)t25))
        goto LAB82;

LAB86:    t34 = (t34 + 1);
    goto LAB84;

}


extern void work_a_2090064486_3212880686_init()
{
	static char *pe[] = {(void *)work_a_2090064486_3212880686_p_0,(void *)work_a_2090064486_3212880686_p_1};
	xsi_register_didat("work_a_2090064486_3212880686", "isim/tb_Multiplytoplevel_isim_beh.exe.sim/work/a_2090064486_3212880686.didat");
	xsi_register_executes(pe);
}
