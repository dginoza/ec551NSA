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

/* This file is designed for use with ISim build 0xa0883be4 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "//ad/eng/users/p/k/pkmurphy/Desktop/convolutionVerilog/sys_array.v";
static int ng1[] = {0, 0};
static int ng2[] = {1, 0};
static int ng3[] = {2, 0};
static int ng4[] = {3, 0};
static int ng5[] = {4, 0};
static int ng6[] = {5, 0};
static int ng7[] = {6, 0};
static int ng8[] = {7, 0};
static int ng9[] = {8, 0};
static unsigned int ng10[] = {0U, 0U};
static int ng11[] = {255, 0};



static void Always_62_0(char *t0)
{
    char t13[8];
    char t14[8];
    char t15[8];
    char t27[8];
    char t30[8];
    char t36[8];
    char t42[8];
    char t46[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    int t20;
    char *t21;
    int t22;
    int t23;
    int t24;
    int t25;
    char *t26;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t37;
    char *t38;
    char *t39;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    char *t45;
    char *t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;

LAB0:    t1 = (t0 + 5408U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(62, ng0);
    t2 = (t0 + 5728);
    *((int *)t2) = 1;
    t3 = (t0 + 5440);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(62, ng0);

LAB5:    xsi_set_current_line(64, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(93, ng0);

LAB28:    xsi_set_current_line(106, ng0);
    t2 = (t0 + 1528U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB29;

LAB30:
LAB31:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(64, ng0);

LAB9:    xsi_set_current_line(65, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 17, 0LL);
    xsi_set_current_line(66, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(67, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(68, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(69, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 17, 0LL);
    xsi_set_current_line(83, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng1)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB10;

LAB11:    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng2)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB12;

LAB13:    xsi_set_current_line(85, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng3)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB14;

LAB15:    xsi_set_current_line(86, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng4)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB16;

LAB17:    xsi_set_current_line(87, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng5)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB18;

LAB19:    xsi_set_current_line(88, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng6)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB20;

LAB21:    xsi_set_current_line(89, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng7)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB22;

LAB23:    xsi_set_current_line(90, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng8)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(91, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2888);
    t4 = (t0 + 2888);
    t5 = (t4 + 72U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 64U);
    t17 = *((char **)t16);
    t18 = ((char*)((ng9)));
    xsi_vlog_generic_convert_array_indices(t14, t15, t11, t17, 2, 1, t18, 32, 1);
    t19 = (t14 + 4);
    t6 = *((unsigned int *)t19);
    t20 = (!(t6));
    t21 = (t15 + 4);
    t7 = *((unsigned int *)t21);
    t22 = (!(t7));
    t23 = (t20 && t22);
    if (t23 == 1)
        goto LAB26;

LAB27:    goto LAB8;

LAB10:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB11;

LAB12:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB13;

LAB14:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB15;

LAB16:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB17;

LAB18:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB19;

LAB20:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB21;

LAB22:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB23;

LAB24:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB25;

LAB26:    t8 = *((unsigned int *)t14);
    t9 = *((unsigned int *)t15);
    t24 = (t8 - t9);
    t25 = (t24 + 1);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, *((unsigned int *)t15), t25, 0LL);
    goto LAB27;

LAB29:    xsi_set_current_line(106, ng0);

LAB32:    xsi_set_current_line(107, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    t12 = (t0 + 2888);
    t16 = (t12 + 72U);
    t17 = *((char **)t16);
    t18 = (t0 + 2888);
    t19 = (t18 + 64U);
    t21 = *((char **)t19);
    t26 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t11, t17, t21, 2, 1, t26, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t28 = (t0 + 1368U);
    t29 = *((char **)t28);
    t28 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t28, 1, t29, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t30, 0, 8);
    xsi_vlog_signed_multiply(t30, 17, t13, 17, t15, 17);
    t31 = (t0 + 3208);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 17, 0LL);
    xsi_set_current_line(108, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng2)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng1)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 3368);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(109, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng3)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng2)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 3528);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(110, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 2008U);
    t26 = *((char **)t21);
    t21 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t21, 1, t26, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t30, 0, 8);
    xsi_vlog_signed_multiply(t30, 17, t13, 17, t15, 17);
    t28 = (t0 + 3688);
    xsi_vlogvar_wait_assign_value(t28, t30, 0, 0, 17, 0LL);
    xsi_set_current_line(111, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng5)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng4)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 3848);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(112, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng6)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng5)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 4008);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(113, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng7)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 2168U);
    t26 = *((char **)t21);
    t21 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t21, 1, t26, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t30, 0, 8);
    xsi_vlog_signed_multiply(t30, 17, t13, 17, t15, 17);
    t28 = (t0 + 4168);
    xsi_vlogvar_wait_assign_value(t28, t30, 0, 0, 17, 0LL);
    xsi_set_current_line(114, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng8)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng7)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 4328);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(115, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2888);
    t11 = (t5 + 72U);
    t12 = *((char **)t11);
    t16 = (t0 + 2888);
    t17 = (t16 + 64U);
    t18 = *((char **)t17);
    t19 = ((char*)((ng9)));
    xsi_vlog_generic_get_array_select_value(t14, 5, t4, t12, t18, 2, 1, t19, 32, 1);
    xsi_vlogtype_sign_extend(t13, 17, t14, 5);
    t21 = (t0 + 1848U);
    t26 = *((char **)t21);
    t21 = (t0 + 1808U);
    t28 = (t21 + 72U);
    t29 = *((char **)t28);
    t31 = (t0 + 1808U);
    t32 = (t31 + 48U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng8)));
    xsi_vlog_generic_get_array_select_value(t30, 8, t26, t29, t33, 2, 1, t34, 32, 1);
    t35 = ((char*)((ng10)));
    xsi_vlogtype_concat(t27, 9, 9, 2U, t35, 1, t30, 8);
    xsi_vlogtype_sign_extend(t15, 17, t27, 9);
    memset(t36, 0, 8);
    xsi_vlog_signed_multiply(t36, 17, t13, 17, t15, 17);
    t37 = (t0 + 4488);
    xsi_vlogvar_wait_assign_value(t37, t36, 0, 0, 17, 0LL);
    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3368);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    memset(t13, 0, 8);
    xsi_vlog_unsigned_add(t13, 17, t4, 17, t12, 17);
    t16 = (t0 + 3528);
    t17 = (t16 + 56U);
    t18 = *((char **)t17);
    memset(t14, 0, 8);
    xsi_vlog_unsigned_add(t14, 17, t13, 17, t18, 17);
    t19 = (t0 + 3688);
    t21 = (t19 + 56U);
    t26 = *((char **)t21);
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 17, t14, 17, t26, 17);
    t28 = (t0 + 3848);
    t29 = (t28 + 56U);
    t31 = *((char **)t29);
    memset(t27, 0, 8);
    xsi_vlog_unsigned_add(t27, 17, t15, 17, t31, 17);
    t32 = (t0 + 4008);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 17, t27, 17, t34, 17);
    t35 = (t0 + 4168);
    t37 = (t35 + 56U);
    t38 = *((char **)t37);
    memset(t36, 0, 8);
    xsi_vlog_unsigned_add(t36, 17, t30, 17, t38, 17);
    t39 = (t0 + 4328);
    t40 = (t39 + 56U);
    t41 = *((char **)t40);
    memset(t42, 0, 8);
    xsi_vlog_unsigned_add(t42, 17, t36, 17, t41, 17);
    t43 = (t0 + 4488);
    t44 = (t43 + 56U);
    t45 = *((char **)t44);
    memset(t46, 0, 8);
    xsi_vlog_unsigned_add(t46, 17, t42, 17, t45, 17);
    t47 = (t0 + 3048);
    xsi_vlogvar_wait_assign_value(t47, t46, 0, 0, 17, 0LL);
    xsi_set_current_line(117, ng0);
    t2 = (t0 + 1688U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB33;

LAB34:    xsi_set_current_line(126, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 8, 0LL);

LAB35:    goto LAB31;

LAB33:    xsi_set_current_line(117, ng0);

LAB36:    xsi_set_current_line(118, ng0);
    t4 = (t0 + 3048);
    t5 = (t4 + 56U);
    t11 = *((char **)t5);
    xsi_vlogtype_sign_extend(t13, 32, t11, 17);
    t12 = ((char*)((ng1)));
    memset(t14, 0, 8);
    xsi_vlog_signed_less(t14, 32, t13, 32, t12, 32);
    t16 = (t14 + 4);
    t48 = *((unsigned int *)t16);
    t49 = (~(t48));
    t50 = *((unsigned int *)t14);
    t51 = (t50 & t49);
    t52 = (t51 != 0);
    if (t52 > 0)
        goto LAB37;

LAB38:    xsi_set_current_line(120, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    xsi_vlogtype_sign_extend(t13, 32, t4, 17);
    t5 = ((char*)((ng11)));
    memset(t14, 0, 8);
    xsi_vlog_signed_greater(t14, 32, t13, 32, t5, 32);
    t11 = (t14 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t14);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB40;

LAB41:    xsi_set_current_line(123, ng0);
    t2 = (t0 + 3048);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 8, 0LL);

LAB42:
LAB39:    goto LAB35;

LAB37:    xsi_set_current_line(119, ng0);
    t17 = ((char*)((ng1)));
    t18 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t18, t17, 0, 0, 8, 0LL);
    goto LAB39;

LAB40:    xsi_set_current_line(121, ng0);
    t12 = ((char*)((ng11)));
    t16 = (t0 + 2728);
    xsi_vlogvar_wait_assign_value(t16, t12, 0, 0, 8, 0LL);
    goto LAB42;

}


extern void work_m_00000000003233511511_2447682254_init()
{
	static char *pe[] = {(void *)Always_62_0};
	xsi_register_didat("work_m_00000000003233511511_2447682254", "isim/tb_sys_array_isim_beh.exe.sim/work/m_00000000003233511511_2447682254.didat");
	xsi_register_executes(pe);
}
