//ST00673 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00030000
//            MSGCLASS=H,                                               00040000
//            NOTIFY=&SYSUID,                                           00050000
//            TIME=1                                                    00060000
//* USE IEFLIST TO INSPECT VTOC                                         00070000
//STEP1    EXEC PGM=IEHLIST                                             00080000
//SYSPRINT DD  SYSOUT=A                                                 00090000
//DD2      DD  UNIT=SYSDA,                                              00100000
//             VOLUME=SER=BYWK00,                                       00110000
//             DISP=OLD                                                 00120000
//SYSIN    DD  *                                                        00130000
     LISTVTOC   FORMAT,VOL=SYSDA=BYWK00                                 00140000
     LISTPDS    FORMAT,DSNAME=(ST006.DATA),VOL=SYSDA=BYWK00             00150000
/*                                                                      00160000
