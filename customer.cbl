      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Customer as "customer" 
                  inherits from Base.
       
       object section.
       class-control.
           Customer is class "customer".


       working-storage section.
       object.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT customer ASSIGN TO "customer.dat"
           organization is indexed
           access is dynamic
           record key is identificacion.

       DATA DIVISION.
       FILE SECTION.
       FD Customer.
       01 customer-file.
           05  identificacion PIC 9(9).
           05  nombre         PIC X(15).
           05  dirreccion     PIC X(20).

       procedure division.

       Method-ID. GetIdentificacion.
      *>----------------------------------------------
       End Method GetIdentificacion.
      *>----------------------------------------------

       Method-ID. SetIdentificacion.
      *>----------------------------------------------
       End Method SetIdentificacion.

      *>----------------------------------------------
       Method-ID. GetNombre.
      *>----------------------------------------------
       End Method GetNombre.
      *>----------------------------------------------

       Method-ID. SetNombre.
      *>----------------------------------------------
       End Method SetNombre.
      *>----------------------------------------------


       Method-ID. SetDirreccion.
      *>----------------------------------------------
       End Method SetDirreccion.
      *>----------------------------------------------

       Method-ID. GuardarCustomer.
      *>----------------------------------------------
       Data Division.

        Local-Storage Section.
        Linkage Section.

           77  LSidentificacion    PIC 9(9).
           77  LSnombre            PIC X(15).
           77  LSdirreccion        PIC X(20).
           77  ISOk                PIC X(15).


       Procedure Division using  LSidentificacion  LSnombre
                                 LSdirreccion.


             OPEN I-O Customer
             MOVE LSidentificacion  TO identificacion
             MOVE LSnombre          TO nombre
             MOVE LSdirreccion      TO dirreccion
             WRITE   customer-file
             END-WRITE .
           CLOSE Customer.

            DISPLAY "cliente Creado".

       End Method GuardarCustomer.
      *>----------------------------------------------

       Method-ID. ActualizarCustomer.
      *>----------------------------------------------
       End Method ActualizarCustomer.
      *>----------------------------------------------

       Method-ID. EliminarCustomer.
      *>----------------------------------------------
       End Method EliminarCustomer.
      *>----------------------------------------------

       Method-ID. BuscarCustomer.
      *>----------------------------------------------
       Data Division.

        Local-Storage Section.
           77 mover PIC 9.

        Linkage Section.
           77 IdentificacionUser PIC 9(9).
           77 existe PIC 9.


       Procedure Division using  IdentificacionUser
                                 returning existe.

          OPEN I-O Customer.
            MOVE IdentificacionUser TO identificacion
            READ Customer
              KEY IS identificacion
              INVALID KEY MOVE 0 TO existe
              NOT INVALID KEY  MOVE 1 TO existe
             END-READ
             CLOSE Customer.

       END Method BuscarCustomer.
      *>----------------------------------------------


       end object.

       end class customer.



