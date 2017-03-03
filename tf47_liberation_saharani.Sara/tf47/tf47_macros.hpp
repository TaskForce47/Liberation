#define strace_1(arg) systemchat format ["%1",arg];
#define strace_2(arg_1,arg_2) systemchat format ["%1 %2",arg_1,arg_2];
#define DTRACE_1(arg) diag_log format ["%1",arg];
#define DTRACE_2(arg_1,arg_2) diag_log format ["%1 %2",arg_1,arg_2];
#define DTRACE_3(arg_1,arg_2,arg_3) diag_log format ["%1 %2 %3",arg_1,arg_2,arg_3];
#define DTRACE_4(arg_1,arg_2,arg_3,arg_4) diag_log format ["%1 %2 %3 %4",arg_1,arg_2,arg_3,arg_4];
