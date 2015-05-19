      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Administrador data is protected
                 inherits from Base.

       object section.
       class-control.
           accounts  is class "accounts"
           customer  is class "customer"
           debitcard is class "debitcard".

       procedure division.

       Method-ID. ConsultarDatosParaCrearCuenta.
       Data Division.
       Local-Storage Section.
         77  IdentificacionUsuario  PIC 9.
         77  IdDebitcard PIC 9.
         77  IdCustomer  PIC 9.
         77  istrue      PIC 9.
       DISPLAY  "Ingresar la Identificacion del Usuario"
       ACCEPT  IdentificacionUsuario


             INVOKE  "CrearUsuario" using IdentificacionUsuario
                                    returning IdCustomer
             INVOKE  "CrearTarjeta"  returning IdDebitcard
             INVOKE  "CrearNuevaCuenta" using IdCustomer IdDebitcard
                                       returning istrue

       DISPLAY  "La cuenta Fue Creada"
       ACCEPT   istrue

       End Method ConsultarDatosParaCrearCuenta.
      *>----------------------------------------------
       Method-ID. CrearTarjeta.
       Data Division.
       Local-Storage Section.
        77  NumeroTarjeta     PIC X(15).
        77  PINDebitcard      PIC 9(4).
        77  IDbank            PIC 9.
       01  obj-Debitcard   object reference.

       Linkage Section.
        77  LSIdDebitcard  PIC 9.

       Procedure Division Returning LSIdDebitcard.


       DISPLAY  "Ingrese los datos de la Nueva Tarjeta"
       DISPLAY  "Ingresar Numero de Tarjeta"
       ACCEPT  NumeroTarjeta
       DISPLAY  "Ingresar el PIN de la tarjeta"
       ACCEPT  PINDebitcard
      *----------------------
      *ID DEL BANCO
       MOVE 1 TO IDbank
      *----------------------
       INVOKE debitcard "New"
               RETURNING obj-Debitcard.

       INVOKE obj-Debitcard "GuardarTarjeta" using  NumeroTarjeta
                                                    PINDebitcard
                                                    IDbank
                                                    Returning
                                                    LSIdDebitcard

       End Method CrearTarjeta.
      *>----------------------------------------------
       Method-ID. CrearUsuario.
       Data Division.
       Local-Storage Section.
        77  nombreUsuario     PIC X(15).
        77  dirreccionUsuario PIC X(20).
        01  obj-customer   object reference.

       Linkage Section.
        77  Lsidentificacion PIC X(9).
        77  LSIDcustomer     PIC 9.
        77  Validar PIC 9.

       Procedure Division using  Lsidentificacion
                                 returning LSIDcustomer.

       DISPLAY  "Ingrese Datos del Usuario"
       DISPLAY  "Ingresar Nombre del Cliente"
       ACCEPT   nombreUsuario
       DISPLAY  "Ingresar Dirreccion del Cliente"
       ACCEPT   dirreccionUsuario

       INVOKE customer "New"
               RETURNING obj-customer.

       INVOKE obj-customer "BuscarCustomer" using Lsidentificacion
                                         returning Validar.



       End Method CrearUsuario.
      *>----------------------------------------------

       Method-ID. CrearNuevaCuenta.
      *>----------------------------------------------
       Data Division.
       Local-Storage Section.
         77  IDA               PIC 9.
         77  Montoinicial      PIC 9(9).
         01  TipodeCueta       PIC 9.
             88  Ahorro        VALUE ZERO.
             88  Corriente     VALUE 1.
       01  obj-accounts   object reference.

       Linkage Section.
           77  IdCustomer        PIC 9.
           77  IdDebitcard       PIC 9.

       Procedure Division using  IdCustomer IdDebitcard.

       DISPLAY "Ingrese Los Datos De La Cuenta"
       DISPLAY  "Ingresar TipodeCueta"
       ACCEPT   TipodeCueta
       DISPLAY "Monto inicial de la cuenta"
       ACCEPT   Montoinicial

       INVOKE accounts "New"
               RETURNING obj-accounts

       INVOKE obj-accounts "GuardarCuenta" using  IdCustomer
                                                  IdDebitcard
                                                  TipodeCueta
                                                  Montoinicial
                                                returning IDA
       DISPLAY "La Cuenta fue Creada"
       DISPLAY IDA

       End Method CrearNuevaCuenta.


       Method-ID. SeleccionarBanco.

       End Method SeleccionarBanco.
      *>----------------------------------------------



