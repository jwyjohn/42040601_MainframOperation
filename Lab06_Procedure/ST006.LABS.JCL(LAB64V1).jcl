//ST00664 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00030000
//            MSGCLASS=H,                                               00040000
//            NOTIFY=&SYSUID,                                           00050000
//            TIME=2                                                    00060000
//* USE SORT TO SORT THE EXER.TXT                                       00070000
//STEP1    EXEC PGM=SORT                                                00080000
//SYSIN    DD *                                                         00090000
          SORT FIELDS=(1,6,CH,A)                                        00100000
/*                                                                      00110000
//SYSOUT   DD SYSOUT=*                                                  00120000
//SORTIN   DD DSN=ST006.EXER.TXT,                                       00130000
//            DISP=OLD                                                  00140000
//SORTOUT  DD DSN=ST006.S1951510.TXT,                                   00150001
//            DISP=(NEW,CATLG,DELETE),                                  00160000
//            UNIT=SYSDA,                                               00170000
//            VOL=SER=BYWK00,                                           00180000
//            SPACE=(TRK,(1,1)),                                        00190000
//            RECFM=FB,                                                 00200000
//            LRECL=80                                                  00210000
//* USE IEBGENER TO SPLIT DATASET                                       00220000
//STEP2    EXEC PGM=IEBGENER                                            00230000
//SYSIN    DD *                                                         00240000
    GENERATE  MAXNAME=3,MAXGPS=2                                        00250000
       MEMBER  NAME=MEMBER1                                             00260000
GROUP1 RECORD  IDENT=(6,'013224',1)                                     00270000
       MEMBER  NAME=MEMBER2                                             00280000
GROUP2 RECORD  IDENT=(6,'023218',1)                                     00290000
       MEMBER  NAME=MEMBER3                                             00300000
/*                                                                      00310000
//SYSUT1   DD DSN=ST006.S1951510.TXT,                                   00320002
//            DISP=SHR                                                  00330000
//SYSUT2   DD DSN=ST006.S1951510.P01,                                   00340003
//            DISP=(NEW,CATLG,DELETE),                                  00350000
//            UNIT=SYSDA,                                               00360000
//            VOL=SER=BYWK00,                                           00370000
//            SPACE=(TRK,(2,1,1)),                                      00380000
//            RECFM=FB,                                                 00390000
//            LRECL=80                                                  00400000
//SYSPRINT DD SYSOUT=*                                                  00410000
