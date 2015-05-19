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
        77  nombreUsuario     PIC X(15).
        77  dirreccionUsuario PIC X(20).
        01  obj-accounts      object reference.
        01  obj-transacition  object reference.

        Linkage Section.

           77  LSMontoRetiro   PIC 9(9).
           77  Lsidentificacion  PIC X(9).
           77  LSRetiroRealizado PIC 9.
           77  LSMonto      PIC 9(9).
           77  TransOk      PIC 9.
       Procedure Division using  LSMontoRetiro Lsidentificacion
                                 returning LSRetiroRealizado.

       INVOKE accounts "New"
               RETURNING obj-accounts.

       INVOKE obj-accounts "GetMonto" using Lsidentificacion
                                         returning LSMonto.

       COMPUTE LSMonto = LSMonto -  LSRetiroRealizado.

       INVOKE obj-accounts "SetMonto" using Lsidentificacion LSMonto.

      *REGISTRAR UNA TRANSACION
       INVOKE obj-transacition "CrearTransancion"
                                           using "1" "Retiro"
                                                 returning TransOk.



       End Method registrarRetiro.
      *>----------------------------------------------

       end class Retiro.

