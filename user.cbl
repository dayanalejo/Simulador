      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. User data is protected
                 inherits from Base.

       object section.
       class-control.
           obj-retiro  is class "Retiro" .


       procedure division.

       Method-ID. RealizarRetiroyTransation.
       Data Division.
       Local-Storage Section.
         77  Numaccount       PIC 9.
         77  MontoparaRetirar PIC 9(9).
         77  Mens             PIC X(9).
       DISPLAY  "Ingrese numero de cuenta para realizar el retiro"
       ACCEPT  Numaccount

       INVOKE obj-retiro "registrarRetiro" using  MontoparaRetirar
                                                  Numaccount
                                                  returning Mens

       DISPLAY Mens

       End Method RealizarRetiroyTransation.
