      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Transacition as "transacition" 
                
                 inherits from base.

       object section.
       class-control.
           transacition is class "transacition".

       working-storage section.

       object.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT transacition ASSIGN TO "transacition.dat"
           organization is indexed
           access is dynamic
           record key is IDT.

       DATA DIVISION.
       FILE SECTION.
       FD transacition.
       01 transacition-file.
           05  IDT           PIC 9.
           05  fecha         PIC X(9).
           05  tipo          PIC X(15).
           05  Numaccounts   PIC X(9).
           05  ValorTransac  PIC 9(10).


       Method-ID. CrearTransancion.
      *>----------------------------------------------
       Data Division.
        Linkage Section.
           77  IDT           PIC 9.
           77  LSDate        PIC X(8).
           77  LStime        PIC X(4).
           77  LSType        PIC X(15).
           77  LSAccounts    PIC X(9).
           77  LSvalorRetiro PIC 9(10).


       Procedure Division using  LSDate  LSType LStime  LSAccounts
                                 LSvalorRetiro.


             OPEN I-O Transacition
               MOVE LSDate        TO  fecha
               MOVE LSType        TO  tipo
               MOVE LSAccounts    TO  Numaccounts
               MOVE LSvalorRetiro TO  LSvalorRetiro
             WRITE   transacition-file
             END-WRITE.
           CLOSE Transacition.




       End Method CrearTransancion.
      *>----------------------------------------------

       end object.
       end class Transacition.
       
