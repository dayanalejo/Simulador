      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. usuario data is protected
                 inherits from Base.

       object section.
       class-control.
           Retiro is class  "retiro"
           usuario is class "usuario".



       procedure division.


       Method-ID. RealizarRetiroyTransation.
       Data Division.
       Local-Storage Section.
         01  obj-retiro       object reference.
         77  Numaccount       PIC X(9).
         77  Pinaccount       PIC 9(4).
         77  MontoparaRetirar PIC 9(10).
         77  Mens             PIC 9.


         INVOKE Retiro "New"
                     RETURNING obj-Retiro

       DISPLAY "Ingrese numero de cuenta para realizar el retiro"
       ACCEPT  Numaccount
       DISPLAY "Ingrese el PIN de su cuenta"
       ACCEPT  Pinaccount
       DISPLAY "Ingrese el Monto que desea Retirar"
       ACCEPT  MontoparaRetirar

       INVOKE obj-retiro "registrarRetiro" using  MontoparaRetirar
                                                  Numaccount
                                                  Pinaccount
                                                  returning Mens

       DISPLAY Mens

       End Method RealizarRetiroyTransation.

