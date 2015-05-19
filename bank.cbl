      $set PreserveCase

      *>-----------------------------------------------------------
      *> Class description
      *>-----------------------------------------------------------
       class-id. Bank data is protected
                 inherits from Base.

       object section.
       class-control.
           bank is class "bank".

       working-storage section.

       object.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Bank ASSIGN TO "SimuladorDeBanco/bank.dat"
           organization is indexed
           access is dynamic
           record key is IDB.

       DATA DIVISION.
       FILE SECTION.
       FD Bank.
       01 registro.
           05  IDB           PIC 9.
           05  codigo        PIC X(9).
           05  nombre        PIC X(15).
           05  dirreccion    PIC X(20).

       object-storage section.
       77  Codigo            PIC X(9).
       77  Nombre            PIC X(15).
       77  Dirreccion        PIC X(20).

      *>----------------------------------------------
       Method-ID. GetCodigo.
      *>----------------------------------------------
       End Method GetCodigo.
      *>----------------------------------------------
       Method-ID. SetCodigo.
      *>----------------------------------------------
       End Method SetCodigo.

      *>----------------------------------------------
       Method-ID. GetNombre.
      *>----------------------------------------------
       End Method GetNombre.

      *>----------------------------------------------

       Method-ID. GetDirreccion.
      *>----------------------------------------------
       End Method GetDirreccion.
      *>----------------------------------------------

       Method-ID. GuardarBanco.
      *>----------------------------------------------
       End Method GuardarBanco.
      *>----------------------------------------------

       Method-ID. ActualizarBanco.
      *>----------------------------------------------
       End Method ActualizarBanco.
      *>----------------------------------------------

       Method-ID. BuscarBanco.
      *>----------------------------------------------
       End Method BuscarBanco.
      *>----------------------------------------------

       Method-ID. EliminarBanco.
      *>----------------------------------------------
       End Method EliminarBanco.
      *>----------------------------------------------


       end object.
       end class bank.
