      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Customer as "customer" 
                  inherits from Base.
       
       object section.
       class-control.
           customer is class "customer".

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
           05  identificacion PIC X(9).
           05  nombre         PIC X(15).
           05  dirreccion     PIC X(20).



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
        Linkage Section.
           77  IDC                 PIC 9.
           77  LSidentificacion    PIC X(9).
           77  LSnombre            PIC X(15).
           77  LSdirreccion        PIC X(20).

       Procedure Division using  LSidentificacion  LSnombre
                                 LSdirreccion
                                 returning IDC.

             OPEN I-O Customer
             MOVE 1                 TO IDC
             MOVE LSidentificacion  TO identificacion
             MOVE LSnombre          TO nombre
             MOVE LSdirreccion      TO dirreccion
             WRITE   customer-file
             END-WRITE .
           CLOSE Customer.


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
        Linkage Section.
           77 IdentificacionUser PIC X(9).
           77 existe PIC 9.


       Procedure Division using  IdentificacionUser
                                 returning existe.

          OPEN I-O Customer.
            MOVE 1 TO IdentificacionUser.

            READ Customer
              KEY IS identificacion
              INVALID KEY DISPLAY "KEY IS NOT EXISTING"
              END-READ
       END Method BuscarCustomer.
      *>----------------------------------------------



       end object.

       end class Customer.
