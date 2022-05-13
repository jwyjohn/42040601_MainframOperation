       IDENTIFICATION DIVISION.                                                 
       PROGRAM-ID.    STRLAB.                                                   
       AUTHOR.        JWY.                                                      
      *                                                                         
       ENVIRONMENT DIVISION.                                                    
      *                                                                         
       INPUT-OUTPUT SECTION.                                                    
       FILE-CONTROL.                                                            
           SELECT GET-LINE ASSIGN TO GETLINE.                                   
           SELECT PRT-DONE ASSIGN TO PRTDONE.                                   
                                                                                
       DATA DIVISION.                                                           
       FILE SECTION.                                                            
       FD  GET-LINE RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.             
       01 GET-REC           PIC X(80) VALUE SPACES.                             
                                                                                
       FD  PRT-DONE RECORD CONTAINS 80 CHARACTERS RECORDING MODE F.             
       01 PRT-REC-DONE.                                                         
          05 PRT-DATE       PIC X(8)  VALUE SPACES.                             
          05 FILLER         PIC X(1)  VALUE SPACES.                             
          05 PRT-TIME       PIC X(4)  VALUE SPACES.                             
          05 FILLER         PIC X(2)  VALUE SPACES.                             
          05 PRT-COMMENT    PIC X(20) VALUE SPACES.                             
          05 FILLER         PIC X(2)  VALUE SPACES.                             
          05 PRT-VAL        PIC Z(6)  VALUE ZEROS.                              
          05 FILLER         PIC X(37) VALUE SPACES.                             
                                                                                
       WORKING-STORAGE SECTION.                                                 
                                                                                
       01 PUNC              PIC X(7)  VALUE ',.()!"'.                           
                                                                                
       01 THE-WORD          PIC X(80) VALUE 'THE'.                              
                                                                                
       01 PGM-VARIABLES.                                                        
          05 WORD-COUNT     PIC 9(6)  VALUE ZEROS.                              
                         
                                                                                
       01 TEMP-VARIABLES.                                                       
          05 WORD-BUF       PIC X(80).                                          
          05 LS-COUNTER     PIC 99    VALUE ZEROS.                              
          05 TEMPWORD       PIC X(80).                                          
          05 PRT-WORD       PIC X(80).                                          
          05 UNSTRPTR       PIC 99    VALUE 1.                                  
             88 USTRDONE              VALUE 81.                                 
                                                                                
       01 YYYYMMDD          PIC 9(8).                                           
                                                                                
       01 INTEGER-FORM      PIC S9(9).                                          
                                                                                
       01 REFMOD-TIME-ITEM  PIC X(8).                                           
                                                                                
      ****************************************************************          
      *                  PROCEDURE DIVISION                          *          
      ****************************************************************          
       PROCEDURE DIVISION.                                                      
      *                                                                         
       A000-START.                                                              
           PERFORM A000-PROCL.                                                  
           PERFORM A000-DONE.                                                   
           STOP RUN.                                                            
      *                                                                         
       A000-PROCL.                                                              
           OPEN INPUT GET-LINE.                                                 
           READ GET-LINE                                                        
           AT END                                                               
              MOVE HIGH-VALUES TO GET-REC                                       
           END-READ.                                                            
           PERFORM UNTIL GET-REC = HIGH-VALUES                                  
                   PERFORM A000-COUNTWD                                         
                   READ GET-LINE                                                
                   AT END                                                       
                      MOVE HIGH-VALUES TO GET-REC                               
                   END-READ                                                     
           END-PERFORM.                                                         
           CLOSE GET-LINE.                                                      
                                                                                
      *                                                                         
       A000-COUNTWD.                                                            
           MOVE GET-REC(1:72) TO WORD-BUF.                                      
           MOVE 1 TO UNSTRPTR.                                                  
           PERFORM UNTIL USTRDONE                                               
                   MOVE SPACES TO TEMPWORD                                      
                   MOVE ZEROS TO LS-COUNTER                                     
                   UNSTRING WORD-BUF DELIMITED BY ALL SPACES                    
                      INTO TEMPWORD WITH POINTER UNSTRPTR                       
                   END-UNSTRING                                                 
                   INSPECT TEMPWORD CONVERTING PUNC TO SPACES                   
                   INSPECT TEMPWORD TALLYING LS-COUNTER FOR LEADING             
                      SPACES                                                    
                   ADD 1 TO LS-COUNTER                                          
                   MOVE TEMPWORD(LS-COUNTER:) TO PRT-WORD                       
                   ADD 1 TO WORD-COUNT                                          
           END-PERFORM.                                                         
                                                                                
      *                                                                         
       A000-DONE.                                                               
           OPEN OUTPUT PRT-DONE.                                                
           MOVE SPACES TO PRT-REC-DONE.                                         
           ACCEPT REFMOD-TIME-ITEM FROM TIME.                                   
           MOVE FUNCTION CURRENT-DATE(1:8) TO YYYYMMDD.                         
           MOVE YYYYMMDD TO PRT-DATE.                                           
           MOVE REFMOD-TIME-ITEM(1:4) TO PRT-TIME.                              
           MOVE "TOTAL words " TO PRT-COMMENT.                                  
           MOVE WORD-COUNT TO PRT-VAL.                                          
           WRITE PRT-REC-DONE.                                                  
      *                                                                         
           CLOSE PRT-DONE.                                                      
