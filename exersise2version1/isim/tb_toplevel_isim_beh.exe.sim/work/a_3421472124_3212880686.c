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
static const char *ng0 = "C:/Users/eiriklf/git/dmkonsttdt4255_work/exersise2version1/file/ALUop.vhd";



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

LAB0:    xsi_set_current_line(26, ng0);
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

LAB4:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t2 = *((unsigned char *)t4);
    t5 = (t2 == (unsigned char)3);
    if (t5 == 1)
        goto LAB22;

LAB23:    t1 = (unsigned char)0;

LAB24:    if (t1 != 0)
        goto LAB20;

LAB21:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB30;

LAB31:    t2 = (unsigned char)0;

LAB32:    if (t2 == 1)
        goto LAB27;

LAB28:    t3 = (t0 + 1192U);
    t11 = *((char **)t3);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    if (t13 == 1)
        goto LAB33;

LAB34:    t10 = (unsigned char)0;

LAB35:    t1 = t10;

LAB29:    if (t1 != 0)
        goto LAB25;

LAB26:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB47;

LAB48:    t2 = (unsigned char)0;

LAB49:    if (t2 == 1)
        goto LAB44;

LAB45:    t1 = (unsigned char)0;

LAB46:    if (t1 != 0)
        goto LAB42;

LAB43:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB61;

LAB62:    t2 = (unsigned char)0;

LAB63:    if (t2 == 1)
        goto LAB58;

LAB59:    t1 = (unsigned char)0;

LAB60:    if (t1 != 0)
        goto LAB56;

LAB57:    t3 = (t0 + 1192U);
    t4 = *((char **)t3);
    t5 = *((unsigned char *)t4);
    t6 = (t5 == (unsigned char)3);
    if (t6 == 1)
        goto LAB75;

LAB76:    t2 = (unsigned char)0;

LAB77:    if (t2 == 1)
        goto LAB72;

LAB73:    t1 = (unsigned char)0;

LAB74:    if (t1 != 0)
        goto LAB70;

LAB71:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 5010);
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
LAB2:    xsi_set_current_line(27, ng0);
    t20 = (t0 + 4970);
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
    t3 = (t0 + 4966);
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

LAB20:    xsi_set_current_line(32, ng0);
    t3 = (t0 + 4974);
    t14 = (t0 + 3072);
    t15 = (t14 + 56U);
    t18 = *((char **)t15);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t3, 4U);
    xsi_driver_first_trans_fast_port(t14);
    goto LAB3;

LAB22:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t6 = *((unsigned char *)t7);
    t8 = (t6 == (unsigned char)3);
    t1 = t8;
    goto LAB24;

LAB25:    xsi_set_current_line(37, ng0);
    t20 = (t0 + 4982);
    t22 = (t0 + 3072);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memcpy(t26, t20, 4U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB3;

LAB27:    t1 = (unsigned char)1;
    goto LAB29;

LAB30:    t3 = (t0 + 1192U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB32;

LAB33:    t3 = (t0 + 1352U);
    t14 = *((char **)t3);
    t3 = (t0 + 4978);
    t16 = 1;
    if (4U == 4U)
        goto LAB36;

LAB37:    t16 = 0;

LAB38:    t10 = t16;
    goto LAB35;

LAB36:    t17 = 0;

LAB39:    if (t17 < 4U)
        goto LAB40;
    else
        goto LAB38;

LAB40:    t18 = (t14 + t17);
    t19 = (t3 + t17);
    if (*((unsigned char *)t18) != *((unsigned char *)t19))
        goto LAB37;

LAB41:    t17 = (t17 + 1);
    goto LAB39;

LAB42:    xsi_set_current_line(43, ng0);
    t19 = (t0 + 4990);
    t21 = (t0 + 3072);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 4U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB44:    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 4986);
    t10 = 1;
    if (4U == 4U)
        goto LAB50;

LAB51:    t10 = 0;

LAB52:    t1 = t10;
    goto LAB46;

LAB47:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB49;

LAB50:    t17 = 0;

LAB53:    if (t17 < 4U)
        goto LAB54;
    else
        goto LAB52;

LAB54:    t15 = (t11 + t17);
    t18 = (t3 + t17);
    if (*((unsigned char *)t15) != *((unsigned char *)t18))
        goto LAB51;

LAB55:    t17 = (t17 + 1);
    goto LAB53;

LAB56:    xsi_set_current_line(47, ng0);
    t19 = (t0 + 4998);
    t21 = (t0 + 3072);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 4U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB58:    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 4994);
    t10 = 1;
    if (4U == 4U)
        goto LAB64;

LAB65:    t10 = 0;

LAB66:    t1 = t10;
    goto LAB60;

LAB61:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB63;

LAB64:    t17 = 0;

LAB67:    if (t17 < 4U)
        goto LAB68;
    else
        goto LAB66;

LAB68:    t15 = (t11 + t17);
    t18 = (t3 + t17);
    if (*((unsigned char *)t15) != *((unsigned char *)t18))
        goto LAB65;

LAB69:    t17 = (t17 + 1);
    goto LAB67;

LAB70:    xsi_set_current_line(51, ng0);
    t19 = (t0 + 5006);
    t21 = (t0 + 3072);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    memcpy(t25, t19, 4U);
    xsi_driver_first_trans_fast_port(t21);
    goto LAB3;

LAB72:    t3 = (t0 + 1352U);
    t11 = *((char **)t3);
    t3 = (t0 + 5002);
    t10 = 1;
    if (4U == 4U)
        goto LAB78;

LAB79:    t10 = 0;

LAB80:    t1 = t10;
    goto LAB74;

LAB75:    t3 = (t0 + 1032U);
    t7 = *((char **)t3);
    t8 = *((unsigned char *)t7);
    t9 = (t8 == (unsigned char)2);
    t2 = t9;
    goto LAB77;

LAB78:    t17 = 0;

LAB81:    if (t17 < 4U)
        goto LAB82;
    else
        goto LAB80;

LAB82:    t15 = (t11 + t17);
    t18 = (t3 + t17);
    if (*((unsigned char *)t15) != *((unsigned char *)t18))
        goto LAB79;

LAB83:    t17 = (t17 + 1);
    goto LAB81;

}


extern void work_a_3421472124_3212880686_init()
{
	static char *pe[] = {(void *)work_a_3421472124_3212880686_p_0};
	xsi_register_didat("work_a_3421472124_3212880686", "isim/tb_toplevel_isim_beh.exe.sim/work/a_3421472124_3212880686.didat");
	xsi_register_executes(pe);
}
