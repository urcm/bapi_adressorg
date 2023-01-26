*"*"Local Interface:
*"  IMPORTING
*"     VALUE(OBJ_TYPE) LIKE  BAPI4001_1-OBJTYPE
*"     VALUE(OBJ_ID) LIKE  BAPI4001_1-OBJKEY
*"     VALUE(OBJ_ID_EXT) LIKE  BAPI4001_1-EXTENSION DEFAULT SPACE
*"     VALUE(CONTEXT) LIKE  BAPI4001_1-CONTEXT DEFAULT 1
*"     VALUE(ACCEPT_ERROR) LIKE  BAPI4001_1-ACCEPT_ERR DEFAULT SPACE
*"     VALUE(SAVE_ADDRESS) LIKE  BAPI4001_1-SAVE_ADDR DEFAULT 'X'
*"     VALUE(IV_CHECK_ADDRESS) LIKE  BAPI4001_1-CHECK_ADDR DEFAULT 'X'
*"     VALUE(IV_TIME_DEPENDENT_COMM_DATA) LIKE  BAPI4001_1-TIMEDEPCOM
*"       DEFAULT SPACE
*"  EXPORTING
*"     VALUE(ADDRESS_NUMBER) LIKE  BAPI4001_1-ADDR_NO
*"  TABLES
*"      BAPIAD1VL STRUCTURE  BAPIAD1VL OPTIONAL
*"      BAPIADTEL STRUCTURE  BAPIADTEL OPTIONAL
*"      BAPIADFAX STRUCTURE  BAPIADFAX OPTIONAL
*"      BAPIADTTX STRUCTURE  BAPIADTTX OPTIONAL
*"      BAPIADTLX STRUCTURE  BAPIADTLX OPTIONAL
*"      BAPIADSMTP STRUCTURE  BAPIADSMTP OPTIONAL
*"      BAPIADRML STRUCTURE  BAPIADRML OPTIONAL
*"      BAPIADX400 STRUCTURE  BAPIADX400 OPTIONAL
*"      BAPIADRFC STRUCTURE  BAPIADRFC OPTIONAL
*"      BAPIADPRT STRUCTURE  BAPIADPRT OPTIONAL
*"      BAPIADSSF STRUCTURE  BAPIADSSF OPTIONAL
*"      BAPIADURI STRUCTURE  BAPIADURI OPTIONAL
*"      BAPIADPAG STRUCTURE  BAPIADPAG OPTIONAL
*"      BAPIAD_REM STRUCTURE  BAPIAD_REM OPTIONAL
*"      BAPICOMREM STRUCTURE  BAPICOMREM OPTIONAL
*"      BAPIADUSE STRUCTURE  BAPIADUSE OPTIONAL
*"      BAPIAD1VL_X STRUCTURE  BAPIAD1VLX OPTIONAL
*"      BAPIADTEL_X STRUCTURE  BAPIADTELX OPTIONAL
*"      BAPIADFAX_X STRUCTURE  BAPIADFAXX OPTIONAL
*"      BAPIADTTX_X STRUCTURE  BAPIADTTXX OPTIONAL
*"      BAPIADTLX_X STRUCTURE  BAPIADTLXX OPTIONAL
*"      BAPIADSMT_X STRUCTURE  BAPIADSMTX OPTIONAL
*"      BAPIADRML_X STRUCTURE  BAPIADRMLX OPTIONAL
*"      BAPIADX40_X STRUCTURE  BAPIADX40X OPTIONAL
*"      BAPIADRFC_X STRUCTURE  BAPIADRFCX OPTIONAL
*"      BAPIADPRT_X STRUCTURE  BAPIADPRTX OPTIONAL
*"      BAPIADSSF_X STRUCTURE  BAPIADSSFX OPTIONAL
*"      BAPIADURI_X STRUCTURE  BAPIADURIX OPTIONAL
*"      BAPIADPAG_X STRUCTURE  BAPIADPAGX OPTIONAL
*"      BAPIAD_RE_X STRUCTURE  BAPIAD_REX OPTIONAL
*"      BAPICOMRE_X STRUCTURE  BAPICOMREX OPTIONAL
*"      BAPIADUSE_X STRUCTURE  BAPIADUSEX OPTIONAL
*"      RETURN STRUCTURE  BAPIRET2 OPTIONAL
*"----------------------------------------------------------------------

data: gv_obj_type      like  bapi4001_1-objtype,
      gv_obj_id        like  bapi4001_1-objkey,
      gv_adress_number like adrc-addrnumber.

data: gt_bapiad1vl   like bapiad1vl occurs 0 with header line,
      gt_bapiadtel   like bapiad1vl occurs 0 with header line,
      gt_bapiadtel_x like bapiad1vl occurs 0 with header line,
      gt_bapiad1vl_x like bapiad1vlx occurs 0 with header line,
      gt_return      type table of bapiret2.


gv_obj_type = 'KNA1'.
gv_obj_id = '0000000032'.


call function 'BAPI_ADDRESSORG_GETDETAIL'
  exporting
    obj_type       = gv_obj_type
    obj_id         = gv_obj_id
*   OBJ_ID_EXT     = ' '
*   CONTEXT        = 1
*   IV_CURRENT_COMM_DATA       = 'X'
  importing
    address_number = gv_adress_number
  tables
    bapiad1vl      = gt_bapiad1vl
*   bapiadtel      = gt_bapiadtel
*   BAPIADFAX      =
*   BAPIADTTX      =
*   BAPIADTLX      =
*   BAPIADSMTP     =
*   BAPIADRML      =
*   BAPIADX400     =
*   BAPIADRFC      =
*   BAPIADPRT      =
*   BAPIADSSF      =
*   BAPIADURI      =
*   BAPIADPAG      =
*   BAPIAD_REM     =
*   BAPICOMREM     =
*   BAPIADUSE      =
    return         = gt_return.


loop at gt_bapiad1vl.

  clear: gt_bapiad1vl, gt_bapiad1vl_x.
  gt_bapiad1vl-name = 'NEW CUST'.
  gt_bapiad1vl_x-name = 'X'.
  gt_bapiad1vl-name_2 = ' '.
  gt_bapiad1vl_x-name_2 = 'X'.
  gt_bapiad1vl-city = 'München'.
  gt_bapiad1vl_x-city = 'X'.
  gt_bapiad1vl-country = 'DE'.
  gt_bapiad1vl_x-country = 'X'.
  gt_bapiad1vl-langu = 'DE'.
  gt_bapiad1vl_x-langu = 'DE'.
  gt_bapiad1vl-postl_cod1 = '83420'.
  gt_bapiad1vl_x-postl_cod1 = 'X'.
  gt_bapiad1vl-street = 'Münchener Str.'.
  gt_bapiad1vl_x-street = 'X'.
  gt_bapiad1vl-street_no = '59A'.
  gt_bapiad1vl_x-street_no = 'X'.
  gt_bapiad1vl-addr_group = 'BC01'.
  gt_bapiad1vl_x-addr_group = 'X'.
  gt_bapiad1vl_x-updateflag = 'U'. " Eintrag aktualisieren
*  gt_bapiad1vl_x-updateflag = 'D'. " Eintrag entfernen
*  gt_bapiad1vl_x-updateflag = 'I'. " Eintrag einfügen

  append:  gt_bapiad1vl_x. ", gt_bapiad1vl.
  modify:  gt_bapiad1vl.

endloop.


call function 'BAPI_ADDRESSORG_CHANGE'
  exporting
    obj_type       = gv_obj_type
    obj_id         = gv_obj_id
    obj_id_ext     = ' '
    context        = '001'
*   ACCEPT_ERROR   = ' '
*   save_address   = 'X'
*   IV_CHECK_ADDRESS                  = 'X'
*   IV_TIME_DEPENDENT_COMM_DATA       = ' '
  importing
    address_number = gv_adress_number
  tables
    bapiad1vl      = gt_bapiad1vl
*   BAPIADTEL      =
*   BAPIADFAX      =
*   BAPIADTTX      =
*   BAPIADTLX      =
*   BAPIADSMTP     =
*   BAPIADRML      =
*   BAPIADX400     =
*   BAPIADRFC      =
*   BAPIADPRT      =
*   BAPIADSSF      =
*   BAPIADURI      =
*   BAPIADPAG      =
*   BAPIAD_REM     =
*   BAPICOMREM     =
*   BAPIADUSE      =
    bapiad1vl_x    = gt_bapiad1vl_x
*   BAPIADTEL_X    =
*   BAPIADFAX_X    =
*   BAPIADTTX_X    =
*   BAPIADTLX_X    =
*   BAPIADSMT_X    =
*   BAPIADRML_X    =
*   BAPIADX40_X    =
*   BAPIADRFC_X    =
*   BAPIADPRT_X    =
*   BAPIADSSF_X    =
*   BAPIADURI_X    =
*   BAPIADPAG_X    =
*   BAPIAD_RE_X    =
*   BAPICOMRE_X    =
*   BAPIADUSE_X    =
    return         = gt_return.

call function 'BAPI_TRANSACTION_COMMIT'.


cl_demo_output=>display( gt_bapiad1vl ).
