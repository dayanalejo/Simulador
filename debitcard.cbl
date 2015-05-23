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
           record key is NumeroTarjeta.

       DATA DIVISION.
       FILE SECTION.
       FD debitcard.
       01 debitcard-file.
           05  NumeroTarjeta    PIC X(15).
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
           77  LSNumeroTarj    PIC X(15).
           77  LSPin       PIC 9(4).
           77  LSIDbank    PIC 9.
           77  IsOk        PIC X(15).

       Procedure Division using  LSNumeroTarj  LSPin  LSIDbank
                                 returning IsOk.

             Open I-O debitcard
             MOVE LSNumeroTarj  TO NumeroTarjeta
             MOVE LSPin         TO PIN
             MOVE LSIDbank      TO IDbank
             WRITE   debitcard-file
             END-WRITE .
             CLOSE debitcard.

             move "La tarjeta se guardo Correctamenet" to IsOk

       End Method GuardarTarjeta.
      *>----------------------------------------------



       end object.

       end class DebitCard.
