//ST00672 JOB 1951510,JIANGWENYUAN,                                     00010000
//            CLASS=A,                                                  00020000
//            MSGLEVEL=(1,1),                                           00021000
//            MSGCLASS=H,                                               00022000
//            NOTIFY=&SYSUID,                                           00023000
//            TIME=1                                                    00024000
//* CALL IEBGENER TO COPY THE PDB MENBER.                               00025000
//STEP1    EXEC PGM=IEBGENER                                            00025102
//SYSIN    DD DUMMY                                                     00025202
//SYSPRINT DD SYSOUT=*                                                  00025302
//SYSUT1   DD DSN=ST065.DATA(GRADEMIX),                                 00025402
//            DISP=SHR                                                  00025515
//SYSUT2   DD DSN=ST006.DATA(GRADEMIX),                                 00025602
//            DISP=(NEW,CATLG,DELETE),                                  00025715
//            UNIT=SYSDA,                                               00025815
//            VOL=SER=BYWK00,                                           00025915
//            SPACE=(TRK,(2,1,1)),                                      00026015
//            RECFM=FB,                                                 00026115
//            LRECL=80                                                  00026215
//* USE SORT TO GET THE GRADE 11 STUDENTS                               00026338
//STEP2    EXEC PGM=SORT                                                00026402
//SYSIN    DD *                                                         00027040
          INCLUDE COND=(1,2,CH,EQ,C'11',OR,1,6,CH,EQ,C'NUMBER')         00027337
          SORT FIELDS=(1,6,FS,A)                                        00027441
/*                                                                      00027502
//SYSOUT   DD SYSOUT=*                                                  00028008
//SORTIN   DD DSN=ST006.DATA(GRADEMIX),                                 00029041
//            DISP=OLD                                                  00030009
//SORTOUT  DD DSN=ST006.DATA(GRADE11),                                  00040032
//            DISP=SHR                                                  00050009
//* USE SORT TO GET THE GRADE 12 STUDENTS                               00060038
//STEP3    EXEC PGM=SORT                                                00070038
//SYSIN    DD *                                                         00080038
          INCLUDE COND=(1,2,CH,EQ,C'12',OR,1,6,CH,EQ,C'NUMBER')         00090038
          SORT FIELDS=(1,6,FS,A)                                        00100041
/*                                                                      00110038
//SYSOUT   DD SYSOUT=*                                                  00120038
//SORTIN   DD DSN=ST006.DATA(GRADEMIX),                                 00130041
//            DISP=OLD                                                  00140038
//SORTOUT  DD DSN=ST006.DATA(GRADE12),                                  00150038
//            DISP=SHR                                                  00160038
