       identification division.
       program-id. Main.

       object section.
       class-control.
           Administrador is class "administrador"
           Usuario is class "usuario".

           data division.
           working-storage section.
           77  seleccionMenu  pic 9.
           77  seleccionMenuAdmin pic 9.
           77  seleccionMenuUsu pic 9.
           01  obj-Admnistrador  object reference.
           01  obj-Usuario       object reference.

           procedure division.

            INVOKE Administrador "New"
            RETURNING obj-Admnistrador
            INVOKE Usuario "New"
            RETURNING obj-Usuario.


               modulo-principal.
               perform Menu.
           stop run.


              Menu.

               DISPLAY " ".
               DISPLAY " (1) Administrador"
               DISPLAY " (2) Usuario"
               DISPLAY "-->" no advancing.
               ACCEPT  seleccionMenu.

               EVALUATE seleccionMenu
               WHEN 1 perform MenuAdministrador
               WHEN 2 perform MenuUsuario
               WHEN OTHER move zero to seleccionMenu
               END-EVALUATE.

              MenuAdministrador.
               DISPLAY " ".
               DISPLAY " (1) Crear Cuenta"
               DISPLAY " (2) Actualizar Cuenta"
               DISPLAY " (3) Eliminar Cuenta "
               DISPLAY "-->" no advancing.
               ACCEPT  seleccionMenuAdmin.
               EVALUATE seleccionMenuAdmin
               WHEN 1 perform
                     INVOKE obj-Admnistrador
                                       "ConsultarDatosParaCrearCuenta"
               WHEN 2 perform MenuUsuario
               WHEN OTHER move zero to seleccionMenuAdmin
               END-EVALUATE.

              MenuUsuario.
               DISPLAY " ".
               DISPLAY "(1) Retirar"
               DISPLAY "(2) Transferencia"
               DISPLAY "-->" no advancing.
               ACCEPT  seleccionMenuUsu.
               EVALUATE seleccionMenuUsu
               WHEN 1 perform

                     INVOKE obj-Usuario
                                       "RealizarRetiroyTransation"


               WHEN 2 perform MenuUsuario
               WHEN OTHER move zero to seleccionMenuUsu
               END-EVALUATE.

