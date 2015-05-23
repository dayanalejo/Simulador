      $set PreserveCase

       identification division.

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Retiro as "retiro"
                 inherits from base.
       
       object section.
       class-control.
           transacition  is class "transacition"
           accounts      is class "accounts"
           Retiro        is class "retiro"
           Main          is class "Main".



       procedure division.

       Method-ID. registrarRetiro.
      *>----------------------------------------------
       Data Division.
       Local-Storage Section.
        01  obj-accounts      object reference.
        01  obj-transacition  object reference.
        01  obj-main  object reference.

        77  Montoactual      PIC X(10).
        77 montoactualnumer PIC 9(10).
        01 CurrentDate.
            02  CurrentYear     PIC 9(4).
            02  CurrentMonth   PIC 99.
            02  CurrentDay      PIC 99.

        01 CurrentTime.
            02  CurrentHour      PIC 99.
            02  CurrentMinute   PIC 99.

          Linkage Section.

           77  LSMontoRetiro  PIC 9(10).
           77  LsNumaccounts  PIC X(9).
           77  LsPINaccounts  PIC 9(4).
           77  RetiroOk      PIC  9.
       Procedure Division using  LSMontoRetiro LsNumaccounts
                                               LsPINaccounts
                                               returning RetiroOk.
       INVOKE accounts "New"
               RETURNING obj-accounts.

       INVOKE transacition "New"
               RETURNING obj-transacition.

       INVOKE Main "New"
               RETURNING obj-main.



       INVOKE obj-accounts "GetMonto" using LsNumaccounts
                                         returning MontoActual.

         IF MontoActual =0   THEN
            DISPLAY "La cuenta no Existe"
      *     REPITA EL MENU DE USUARIO

          ELSE
           MOVE Montoactual TO montoactualnumer
           COMPUTE montoactualnumer = montoactualnumer -  LSMontoRetiro
           INVOKE obj-accounts "SetMonto" using
                                       montoactualnumer LsNumaccounts
      *REGISTRAR UNA TRANSACION
           ACCEPT  CurrentDate FROM DATE YYYYMMDD
           ACCEPT  CurrentTime FROM TIME
           INVOKE obj-transacition "CrearTransancion"
                                           using CurrentDate CurrentTime
                                               "Retiro"
                                               LsNumaccounts
                                               montoactualnumer

       DISPLAY "La transaccion se registro correctamente"
           END-IF.
       End Method registrarRetiro.
      *>----------------------------------------------

       end class Retiro.

