      $set PreserveCase

       identification division.

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Retiro as "Retiro"
                
                 inherits from base.
       
       object section.
       class-control.
           transacition  is class "transacition"
           accounts  is class "accounts".


       procedure division.

       Method-ID. registrarRetiro.
      *>----------------------------------------------
       Data Division.
       Local-Storage Section.
        01  obj-accounts      object reference.
        01  obj-transacition  object reference.
        77  Montoactual      PIC 9(9).

        Linkage Section.

           77  LSMontoRetiro  PIC 9(9).
           77  LsNumaccounts  PIC X(9).
           77  IsTransTrue    PIC 9.
           77  RetiroOk      PIC  X(9).
       Procedure Division using  LSMontoRetiro LsNumaccounts
                                 returning RetiroOk.

       INVOKE accounts "New"
               RETURNING obj-accounts.

       INVOKE obj-accounts "GetMonto" using LsNumaccounts
                                         returning MontoActual.

       COMPUTE MontoActual = MontoActual -  LSMontoRetiro.

       INVOKE obj-accounts "SetMonto" using LsNumaccounts MontoActual.

      *REGISTRAR UNA TRANSACION
       INVOKE obj-transacition "CrearTransancion"
                                           using "1" "Retiro"
                                                 returning IsTransTrue.

         MOVE "Retiro Realizado" to RetiroOk

       End Method registrarRetiro.
      *>----------------------------------------------

       end class Retiro.

