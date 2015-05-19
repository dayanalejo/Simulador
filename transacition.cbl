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
           05  IDT        PIC 9.
           05  fecha       PIC X(9).
           05  tipo    PIC X(15).


       Method-ID. CrearTransancion.
      *>----------------------------------------------
       Data Division.
        Linkage Section.
           77  IDT       PIC 9.
           77  LSDate    PIC X(9).
           77  LSType    PIC X(15).


       Procedure Division using  LSDate  LSType
                                 returning IDT.

             OPEN I-O Transacition
             MOVE 1             TO IDT.
             MOVE LSDate        TO fecha
             MOVE LSType        TO tipo
             WRITE   transacition-file
             END-WRITE .
           CLOSE Transacition.




       End Method CrearTransancion.
      *>----------------------------------------------

       end object.
       end class Transacition.
       
