//ST00664 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00030000
//            MSGCLASS=H,                                               00040000
//            NOTIFY=&SYSUID,                                           00050000
//            TIME=2                                                    00060000
//* INLINE PROC BEGIN                                                   00070000
//MYPROC   PROC                                                         00080000
//PSTEP1   EXEC PGM=IEBGENER                                            00090000
//SYSIN    DD *                                                         00100000
    GENERATE  MAXNAME=3,MAXGPS=2                                        00110000
       MEMBER  NAME=MEMBER1                                             00120000
GROUP1 RECORD  IDENT=(6,'013224',1)                                     00130000
       MEMBER  NAME=MEMBER2                                             00140000
GROUP2 RECORD  IDENT=(6,'023218',1)                                     00150000
       MEMBER  NAME=MEMBER3                                             00160000
/*                                                                      00170000
//SYSUT1   DD DSN=ST006.S1951510.TXT,                                   00180001
//            DISP=SHR                                                  00190000
//SYSUT2   DD DSN=&OUTDS,                                               00200000
//            DISP=(NEW,CATLG,DELETE),                                  00210000
//            UNIT=SYSDA,                                               00220000
//            VOL=SER=BYWK00,                                           00230000
//            SPACE=(TRK,(2,1,1)),                                      00240000
//            RECFM=FB,                                                 00250000
//            LRECL=80                                                  00260000
//SYSPRINT DD SYSOUT=*                                                  00270000
//         PEND                                                         00280000
//* INLINE PROC END                                                     00290000
//* SORT THE EXER.TXT                                                   00300000
//STEP1    EXEC PGM=SORT                                                00310000
//SYSIN    DD *                                                         00320000
          SORT FIELDS=(1,6,CH,A)                                        00330000
/*                                                                      00340000
//SYSOUT   DD SYSOUT=*                                                  00350000
//SORTIN   DD DSN=ST006.EXER.TXT,                                       00360000
//            DISP=OLD                                                  00370000
//SORTOUT  DD DSN=ST006.S1951510.TXT,                                   00380002
//            DISP=(NEW,CATLG,DELETE),                                  00390000
//            UNIT=SYSDA,                                               00400000
//            VOL=SER=BYWK00,                                           00410000
//            SPACE=(TRK,(1,1)),                                        00420000
//            RECFM=FB,                                                 00430000
//            LRECL=80                                                  00440000
//* USE IEBGENER TO SPLIT DATASET                                       00450000
//STEP2    EXEC MYPROC,                                                 00460000
//         OUTDS=ST006.S1951510.P02                                     00470003
