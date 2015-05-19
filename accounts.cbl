      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Accounts data is protected
                 inherits from Base.

       object section.
       class-control.
           accounts is class "accounts".

       working-storage section.

       object.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Accounts ASSIGN TO "accounts.dat"
           organization is indexed
           access is dynamic
           record key is IDA.

       DATA DIVISION.
       FILE SECTION.
       FD Accounts.
       01 accounts-file.
           05  IDA             PIC 9.
           05  Montodisponible PIC 9(9).
           05  IdCustomer      PIC 9.
           05  IdDebitcard     PIC X(15).
           05  TipodeCueta     PIC 9.
               88  Ahorro      VALUE ZERO.
               88  Corriente   VALUE 1.


       Method-ID. GetMonto.
      *>----------------------------------------------
       Data Division.
        Linkage Section.
           77 LSIdCustomer      PIC X(9).
           77 LSMontodisponible PIC 9.


       Procedure Division using  LSIdCustomer
                                 returning LSMontodisponible.

          OPEN I-O Accounts.
            MOVE 1 TO IDA.

            READ Accounts
              KEY IS  IDA
              INVALID KEY DISPLAY "KEY IS NOT EXISTING"
              END-READ
              DISPLAY "Monto actual del usuario"
              DISPLAY Montodisponible
              MOVE LSMontodisponible TO Montodisponible


       End Method GetMonto.
      *>----------------------------------------------

      *>----------------------------------------------
       Method-ID. SetMonto.
      *>----------------------------------------------

       Data Division.
        Linkage Section.
           77 LSIdCustomer      PIC X(9).
           77 LSMontodisponible PIC 9.


       Procedure Division using  LSMontodisponible LSIdCustomer .


          OPEN I-O Accounts
            MOVE 1 TO IDA
            READ Accounts
               KEY IS IDA
               INVALID KEY DISPLAY "KEY IS NOT EXISTING"
            END-READ.

          MOVE  LSMontodisponible TO Montodisponible.
          REWRITE Accounts-file
           END-REWRITE.
          CLOSE Accounts.

       End Method SetMonto.
      *>----------------------------------------------

       Method-ID. SetIdDebitcard.
      *>----------------------------------------------
       End Method SetIdDebitcard.
      *>----------------------------------------------

       Method-ID. GuardarCuenta.
      *>----------------------------------------------
       Data Division.
        Linkage Section.
       77  LSIDA               PIC 9.
       77  LSIdCustomer        PIC 9.
       77  LSIdDebitcard       PIC 9.
       77  LSMontodisponible   PIC 9(9).
       01  LSTipodeCueta       PIC 9.
               88  LSAhorro    VALUE ZERO.
               88  LSCorriente VALUE 1.
       Procedure Division using  LSIdCustomer  LSIdDebitcard
                                 LSTipodeCueta   LSMontodisponible
                                 returning LSIDA.
             OPEN I-O  accounts
             MOVE 2                 TO IDA
             MOVE 2                 TO LSIDA
             MOVE LSIdCustomer      TO IdCustomer
             MOVE LSMontodisponible TO Montodisponible
             MOVE LSIdDebitcard TO IdDebitcard
             MOVE LSTipodeCueta TO TipodeCueta
             WRITE   accounts-file
           END-WRITE .
           CLOSE accounts.


       End Method GuardarCuenta.
      *>----------------------------------------------

       Method-ID. ActualizarBanco.
      *>----------------------------------------------
       End Method ActualizarBanco.
      *>----------------------------------------------

       Method-ID. BuscarBanco.
      *>----------------------------------------------
       End Method BuscarBanco.
      *>----------------------------------------------

       Method-ID. EliminarBanco.
      *>----------------------------------------------
       End Method EliminarBanco.
      *>----------------------------------------------


       end object.
       end class accounts.
