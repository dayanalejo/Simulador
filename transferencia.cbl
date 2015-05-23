      $set PreserveCase

       identification division.

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Transferencia as "transferencia" 
                
                 inherits from base.

       object section.
       class-control.
           transacition  is class "transacition"
           accounts      is class "accounts"
           tranferencia        is class "transferencia"
           Main          is class "Main".



       procedure division.

       Method-ID. registrarTranferencia.
      *>----------------------------------------------
       Data Division.
       Local-Storage Section.
        01  obj-accounts      object reference.
        01  obj-transacition  object reference.
        01  obj-main  object reference.

        77  Montoactualdueno      PIC X(10).
        77  montoactualnumerdueno PIC 9(10).
        77  Montoactualotro      PIC X(10).
        77  montoactualnumerotro PIC 9(10).

        01 CurrentDate.
            02  CurrentYear     PIC 9(4).
            02  CurrentMonth   PIC 99.
            02  CurrentDay      PIC 99.

        01 CurrentTime.
            02  CurrentHour      PIC 99.
            02  CurrentMinute   PIC 99.

          Linkage Section.

           77  LSMontoTranferencia  PIC 9(10).
           77  LsNumaccountsdueno  PIC X(9).
           77  LsNumaccountsotro  PIC X(9).
           77  LsPINaccounts  PIC 9(4).
           77  tranferOk      PIC  9.
       Procedure Division using  LSMontoTranferencia LsNumaccountsdueno
                                 LsNumaccountsotro
                                 LsPINaccounts
                                 returning tranferOk.
       INVOKE accounts "New"
               RETURNING obj-accounts.

       INVOKE transacition "New"
               RETURNING obj-transacition.

       INVOKE Main "New"
               RETURNING obj-main.



       INVOKE obj-accounts "GetMonto" using LsNumaccountsdueno
                                         returning MontoActualdueno.

         IF MontoActualdueno =0   THEN
            DISPLAY "La cuenta no Existe o no tiene fondos"
      *     REPITA EL MENU DE USUARIO

          ELSE
           MOVE Montoactualdueno TO montoactualnumerdueno
           COMPUTE montoactualnumerdueno
           = montoactualnumerdueno -  LSMontoTranferencia
           INVOKE obj-accounts "SetMonto" using
                                       montoactualnumerdueno
                                       LsNumaccountsdueno
      *TRAER MONTO DE LA CUENTA A TRANSFERIR

       INVOKE obj-accounts "GetMonto" using LsNumaccountsotro
                                         returning MontoActualotro

           MOVE MontoActualotro TO montoactualnumerotro
          COMPUTE montoactualnumerotro
           = montoactualnumerotro +  LSMontoTranferencia
           INVOKE obj-accounts "SetMonto" using
                                       montoactualnumerotro
                                       LsNumaccountsotro



      *REGISTRAR UNA TRANSACION DUEÑO
           ACCEPT  CurrentDate FROM DATE YYYYMMDD
           ACCEPT  CurrentTime FROM TIME
           INVOKE obj-transacition "CrearTransancion"
                                           using CurrentDate CurrentTime
                                               "Transferencia"
                                               LsNumaccountsdueno
                                               montoactualnumerdueno

      *REGISTRAR UNA TRANSACION OTRO
           INVOKE obj-transacition "CrearTransancion"
                                           using CurrentDate CurrentTime
                                               "Deposito"
                                               LsNumaccountsotro
                                               montoactualnumerotro



       DISPLAY "La transaccion de Transferencia"
       DISPLAY "se registro correctamente"

           END-IF.
       End Method registrarTranferencia.
      *>----------------------------------------------

       end class Transferencia.

       
