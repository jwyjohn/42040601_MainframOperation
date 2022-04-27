//ST00671 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00021000
//            MSGCLASS=H,                                               00022000
//            NOTIFY=&SYSUID,                                           00023000
//            TIME=1                                                    00024000
//* CALL IEBGENER TO COPY THE PDB MENBER.                               00025000
//STEP1 EXEC PGM=IEBGENER                                               00026000
//SYSIN DD DUMMY                                                        00027000
//SYSPRINT DD SYSOUT=*                                                  00028000
//SYSUT1 DD DSN=ST065.DATA(EMPLOYEE),                                   00029000
//          DISP=SHR                                                    00030000
//SYSUT2 DD DSN=ST006.DATA(EMPLOYEE),                                   00040000
//          DISP=(NEW,CATLG,DELETE),                                    00041000
//          UNIT=SYSDA,                                                 00042000
//          VOL=SER=BYWK00,                                             00043000
//          SPACE=(TRK,(2,1,1)),                                        00043100
//          RECFM=FB,                                                   00043200
//          LRECL=80                                                    00043300
/* CALL IEBGENER TO PRINT FORMAT                                        00043400
//STEP2 EXEC PGM=IEBGENER                                               00043500
//SYSIN DD *                                                            00043600
         GENERATE MAXFLDS=3                                             00043700
         RECORD FIELD=(10,9,,1),FIELD=(4,27,,11),FIELD=(7,20,,17)       00043800
/*                                                                      00043900
//SYSPRINT DD SYSOUT=*                                                  00044000
//SYSUT1 DD DSN=ST006.DATA(EMPLOYEE),                                   00045000
//          DISP=SHR                                                    00046000
//SYSUT2 DD DSN=ST006.DATA(EMPLOYE1),                                   00047000
//          DISP=SHR                                                    00048000
