      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. DebitCard as "debitcard"
                  inherits from Base.

       object section.
       class-control.
           debitcard is class "debitcard".

       working-storage section.

       object.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT debitcard ASSIGN TO "debitcard.dat"
           organization is indexed
           access is dynamic
           record key is IDC.

       DATA DIVISION.
       FILE SECTION.
       FD debitcard.
       01 debitcard-file.
           05  IDC        PIC 9.
           05  Numero     PIC X(10).
           05  IDbank     PIC 9.
           05  PIN        PIC 9(4).



       Method-ID. GetPIN.
      *>----------------------------------------------
       End Method GetPIN.
      *>----------------------------------------------

       Method-ID. SetPIN.
      *>----------------------------------------------
       End Method SetPIN.
      *>----------------------------------------------

       Method-ID. GetNumero.
      *>----------------------------------------------
       End Method GetNumero.
      *>----------------------------------------------

       Method-ID. SetNumero.
      *>----------------------------------------------
       End Method SetNumero.
      *>----------------------------------------------

       Method-ID. BuscarTarjeta.
      *>----------------------------------------------
       End Method BuscarTarjeta.
      *>----------------------------------------------

       Method-ID. GuardarTarjeta.
      *>----------------------------------------------
       Data Division.
        Linkage Section.
           77  LSIDC       PIC 9.
           77  LSNumero    PIC X(15).
           77  LSPin       PIC 9(4).
           77  LSIDbank    PIC 9.

       Procedure Division using  LSNumero  LSPin  LSIDbank
                                 returning LSIDC.

             Open I-O debitcard
             MOVE 1           TO LSIDC
             MOVE LSIDC       TO IDC
             MOVE LSNumero    TO Numero
             MOVE LSPin       TO PIN
             MOVE LSIDbank    TO IDbank
             WRITE   debitcard-file
             END-WRITE .
             CLOSE debitcard.


       End Method GuardarTarjeta.
      *>----------------------------------------------



       end object.

       end class DebitCard.
