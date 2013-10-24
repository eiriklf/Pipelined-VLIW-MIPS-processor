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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *IEEE_P_1242562249;
char *WORK_P_2565430773;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_p_2565430773_init();
    work_a_3594629433_3212880686_init();
    work_a_2868348070_3212880686_init();
    work_a_3421472124_3212880686_init();
    work_a_2974374553_3212880686_init();
    work_a_3276679129_3212880686_init();
    work_a_0556179135_3212880686_init();
    work_a_2615964831_3212880686_init();
    work_a_1991350011_3212880686_init();
    work_a_0595933768_3212880686_init();
    work_a_2998309818_3212880686_init();
    work_a_0907407398_3212880686_init();
    work_a_3922519156_3212880686_init();
    work_a_0213988916_3212880686_init();
    work_a_2090064486_3212880686_init();
    work_a_3222946569_3212880686_init();
    work_a_1478196689_3212880686_init();
    work_a_3112044328_3212880686_init();
    work_a_3081869000_3212880686_init();
    work_a_3008787400_3212880686_init();
    work_a_1526494936_3212880686_init();
    work_a_1858743928_3212880686_init();
    work_a_1407619004_3212880686_init();
    work_a_0563772187_3212880686_init();
    work_a_0447813568_3212880686_init();
    work_a_0388852086_2372691052_init();


    xsi_register_tops("work_a_0388852086_2372691052");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    WORK_P_2565430773 = xsi_get_engine_memory("work_p_2565430773");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");

    return xsi_run_simulation(argc, argv);

}
