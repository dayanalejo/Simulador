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
           record key is Numaccounts.

       DATA DIVISION.
       FILE SECTION.
       FD Accounts.
       01 accounts-file.
           05  Numaccounts     PIC X(9).
           05  Montodisponible PIC 9(10).
           05  IdCustomer      PIC 9.
           05  IdDebitcard     PIC X(15).
           05  TipodeCueta     PIC 9.
               88  Ahorro      VALUE ZERO.
               88  Corriente   VALUE 1.


       Method-ID. GetMonto.
      *>----------------------------------------------
       Data Division.
        Local-Storage Section.
        Linkage Section.
           77 LSNumaccounts       PIC X(9).
           77 MontoAc  PIC X(10).



       Procedure Division using  LSNumaccounts
                                 returning MontoAc.

          OPEN I-O Accounts
          MOVE LSNumaccounts TO Numaccounts
            READ Accounts
              KEY IS  Numaccounts
              INVALID KEY DISPLAY "La cuenta no existe"
               MOVE 0 TO MontoAc
              NOT INVALID KEY
               DISPLAY  Montodisponible
               MOVE   Montodisponible TO  MontoAc
              END-READ
              CLOSE Accounts.

       End Method GetMonto.
      *>----------------------------------------------

      *>----------------------------------------------
       Method-ID. SetMonto.
      *>----------------------------------------------

       Data Division.
        Linkage Section.
           77 LSIdaccounts      PIC X(9).
           77 LSMontodisponible PIC 9(10).


       Procedure Division using  LSMontodisponible LSIdaccounts.


          OPEN I-O Accounts
            READ Accounts
               KEY IS Numaccounts
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
       77  LSNumaccounts       PIC 9(9).
       77  LSIdCustomer        PIC 9(9).
       77  LSIdDebitcard       PIC X(15).
       77  LSMontodisponible   PIC 9(10).
       01  LSTipodeCueta       PIC 9.
               88  LSAhorro    VALUE ZERO.
               88  LSCorriente VALUE 1.
       Procedure Division using  LSNumaccounts LSIdCustomer
                                 LSIdDebitcard
                                 LSTipodeCueta   LSMontodisponible.

             OPEN I-O  accounts
             MOVE LSNumaccounts     TO Numaccounts
             MOVE LSIdCustomer      TO IdCustomer
             MOVE LSMontodisponible TO Montodisponible
             MOVE LSIdDebitcard TO IdDebitcard
             MOVE LSTipodeCueta TO TipodeCueta
             WRITE   accounts-file
           END-WRITE.
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
