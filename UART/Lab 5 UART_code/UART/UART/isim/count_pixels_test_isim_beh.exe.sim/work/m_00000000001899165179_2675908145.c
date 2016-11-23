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
static const char *ng0 = "//ad/eng/users/p/k/pkmurphy/Desktop/UART/Lab 5 UART_code/UART/UART/count_pixels.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {1U, 0U};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {203U, 0U};
static unsigned int ng5[] = {9797U, 0U};



static void Always_27_0(char *t0)
{
    char t13[8];
    char t30[8];
    char t35[8];
    char t39[8];
    char t42[8];
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
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t36;
    char *t37;
    char *t38;
    char *t40;
    char *t41;
    char *t43;
    char *t44;
    char *t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    int t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    unsigned int t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    char *t77;

LAB0:    t1 = (t0 + 2848U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 3168);
    *((int *)t2) = 1;
    t3 = (t0 + 2880);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(27, ng0);

LAB5:    xsi_set_current_line(28, ng0);
    t4 = (t0 + 1368U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(32, ng0);

LAB10:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t13, 0, 8);
    t4 = (t3 + 4);
    t5 = (t2 + 4);
    t6 = *((unsigned int *)t3);
    t7 = *((unsigned int *)t2);
    t8 = (t6 ^ t7);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t5);
    t14 = (t9 ^ t10);
    t15 = (t8 | t14);
    t16 = *((unsigned int *)t4);
    t17 = *((unsigned int *)t5);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB14;

LAB11:    if (t18 != 0)
        goto LAB13;

LAB12:    *((unsigned int *)t13) = 1;

LAB14:    t12 = (t13 + 4);
    t21 = *((unsigned int *)t12);
    t22 = (~(t21));
    t23 = *((unsigned int *)t13);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 14, 0LL);

LAB17:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    t11 = (t4 + 4);
    if (*((unsigned int *)t11) != 0)
        goto LAB19;

LAB18:    t12 = (t5 + 4);
    if (*((unsigned int *)t12) != 0)
        goto LAB19;

LAB22:    if (*((unsigned int *)t4) < *((unsigned int *)t5))
        goto LAB21;

LAB20:    *((unsigned int *)t13) = 1;

LAB21:    memset(t30, 0, 8);
    t27 = (t13 + 4);
    t6 = *((unsigned int *)t27);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 & 1U);
    if (t10 != 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t27) != 0)
        goto LAB25;

LAB26:    t29 = (t30 + 4);
    t14 = *((unsigned int *)t30);
    t15 = *((unsigned int *)t29);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB27;

LAB28:    memcpy(t42, t30, 8);

LAB29:    t70 = (t42 + 4);
    t71 = *((unsigned int *)t70);
    t72 = (~(t71));
    t73 = *((unsigned int *)t42);
    t74 = (t73 & t72);
    t75 = (t74 != 0);
    if (t75 > 0)
        goto LAB42;

LAB43:    xsi_set_current_line(40, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);

LAB44:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(28, ng0);

LAB9:    xsi_set_current_line(29, ng0);
    t11 = ((char*)((ng1)));
    t12 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 14, 0LL);
    xsi_set_current_line(30, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 1, 0LL);
    goto LAB8;

LAB13:    t11 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t11) = 1;
    goto LAB14;

LAB15:    xsi_set_current_line(34, ng0);
    t26 = (t0 + 1928);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    t29 = ((char*)((ng3)));
    memset(t30, 0, 8);
    xsi_vlog_unsigned_add(t30, 32, t28, 14, t29, 32);
    t31 = (t0 + 1928);
    xsi_vlogvar_wait_assign_value(t31, t30, 0, 0, 14, 0LL);
    goto LAB17;

LAB19:    t26 = (t13 + 4);
    *((unsigned int *)t13) = 1;
    *((unsigned int *)t26) = 1;
    goto LAB21;

LAB23:    *((unsigned int *)t30) = 1;
    goto LAB26;

LAB25:    t28 = (t30 + 4);
    *((unsigned int *)t30) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB26;

LAB27:    t31 = (t0 + 1928);
    t32 = (t31 + 56U);
    t33 = *((char **)t32);
    t34 = ((char*)((ng5)));
    memset(t35, 0, 8);
    t36 = (t33 + 4);
    if (*((unsigned int *)t36) != 0)
        goto LAB31;

LAB30:    t37 = (t34 + 4);
    if (*((unsigned int *)t37) != 0)
        goto LAB31;

LAB34:    if (*((unsigned int *)t33) > *((unsigned int *)t34))
        goto LAB33;

LAB32:    *((unsigned int *)t35) = 1;

LAB33:    memset(t39, 0, 8);
    t40 = (t35 + 4);
    t17 = *((unsigned int *)t40);
    t18 = (~(t17));
    t19 = *((unsigned int *)t35);
    t20 = (t19 & t18);
    t21 = (t20 & 1U);
    if (t21 != 0)
        goto LAB35;

LAB36:    if (*((unsigned int *)t40) != 0)
        goto LAB37;

LAB38:    t22 = *((unsigned int *)t30);
    t23 = *((unsigned int *)t39);
    t24 = (t22 & t23);
    *((unsigned int *)t42) = t24;
    t43 = (t30 + 4);
    t44 = (t39 + 4);
    t45 = (t42 + 4);
    t25 = *((unsigned int *)t43);
    t46 = *((unsigned int *)t44);
    t47 = (t25 | t46);
    *((unsigned int *)t45) = t47;
    t48 = *((unsigned int *)t45);
    t49 = (t48 != 0);
    if (t49 == 1)
        goto LAB39;

LAB40:
LAB41:    goto LAB29;

LAB31:    t38 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t38) = 1;
    goto LAB33;

LAB35:    *((unsigned int *)t39) = 1;
    goto LAB38;

LAB37:    t41 = (t39 + 4);
    *((unsigned int *)t39) = 1;
    *((unsigned int *)t41) = 1;
    goto LAB38;

LAB39:    t50 = *((unsigned int *)t42);
    t51 = *((unsigned int *)t45);
    *((unsigned int *)t42) = (t50 | t51);
    t52 = (t30 + 4);
    t53 = (t39 + 4);
    t54 = *((unsigned int *)t30);
    t55 = (~(t54));
    t56 = *((unsigned int *)t52);
    t57 = (~(t56));
    t58 = *((unsigned int *)t39);
    t59 = (~(t58));
    t60 = *((unsigned int *)t53);
    t61 = (~(t60));
    t62 = (t55 & t57);
    t63 = (t59 & t61);
    t64 = (~(t62));
    t65 = (~(t63));
    t66 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t66 & t64);
    t67 = *((unsigned int *)t45);
    *((unsigned int *)t45) = (t67 & t65);
    t68 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t68 & t64);
    t69 = *((unsigned int *)t42);
    *((unsigned int *)t42) = (t69 & t65);
    goto LAB41;

LAB42:    xsi_set_current_line(38, ng0);
    t76 = ((char*)((ng2)));
    t77 = (t0 + 1768);
    xsi_vlogvar_wait_assign_value(t77, t76, 0, 0, 1, 0LL);
    goto LAB44;

}


extern void work_m_00000000001899165179_2675908145_init()
{
	static char *pe[] = {(void *)Always_27_0};
	xsi_register_didat("work_m_00000000001899165179_2675908145", "isim/count_pixels_test_isim_beh.exe.sim/work/m_00000000001899165179_2675908145.didat");
	xsi_register_executes(pe);
}
