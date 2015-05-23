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
           Retiro        is class "retiro".



       procedure division.

       Method-ID. registrarRetiro.
      *>----------------------------------------------
       Data Division.
       Local-Storage Section.
        01  obj-accounts      object reference.
        01  obj-transacition  object reference.
        77  Montoactual      PIC 9(10).

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



       INVOKE obj-accounts "GetMonto" using LsNumaccounts
                                         returning MontoActual.

       COMPUTE MontoActual = MontoActual -  LSMontoRetiro.


       INVOKE obj-accounts "SetMonto" using LsNumaccounts MontoActual.

      *REGISTRAR UNA TRANSACION
       INVOKE obj-transacition "CrearTransancion"
                                           using "1" "Retiro"
                                                 returning RetiroOk.
      *VALIDAR QUE EL RETIRO FUE HECHO (FALTA)
         MOVE 1 to RetiroOk

       End Method registrarRetiro.
      *>----------------------------------------------

       end class Retiro.

