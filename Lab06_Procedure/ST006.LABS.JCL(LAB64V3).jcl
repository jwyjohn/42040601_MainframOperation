//ST00664 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00030000
//            MSGCLASS=H,                                               00040000
//            NOTIFY=&SYSUID,                                           00050000
//            TIME=2                                                    00060000
//* SORT THE EXER.TXT                                                   00070000
//MYLIB    JCLLIB ORDER=ST006.PROC.LIB                                  00080000
//STEP1    EXEC PGM=SORT                                                00090000
//SYSIN    DD *                                                         00100000
          SORT FIELDS=(1,6,CH,A)                                        00110000
/*                                                                      00120000
//SYSOUT   DD SYSOUT=*                                                  00130000
//SORTIN   DD DSN=ST006.EXER.TXT,                                       00140000
//            DISP=OLD                                                  00150000
//SORTOUT  DD DSN=ST006.S1951510.TXT,                                   00160001
//            DISP=(NEW,CATLG,DELETE),                                  00170000
//            UNIT=SYSDA,                                               00180000
//            VOL=SER=BYWK00,                                           00190000
//            SPACE=(TRK,(1,1)),                                        00200000
//            RECFM=FB,                                                 00210000
//            LRECL=80                                                  00220000
//* USE IEBGENER TO SPLIT DATASET                                       00230000
//STEP2    EXEC MYPROC,                                                 00240000
//         OUTDS=ST006.S1951510.P03                                     00250002
