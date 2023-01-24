data: gv_obj_type             like bapi4001_1-objtype,
      gv_obj_id               like bapi4001_1-objkey,
      gv_obj_id_ext           like bapi4001_1-extension,
      gv_context              like bapi4001_1-context,
      gv_iv_current_comm_data like bapi4001_1-currentcom,
      gv_address_number       like bapi4001_1-addr_no.


data: gt_bapiad1vl  type table of bapiad1vl,
      gt_bapiadtel  type table of bapiadtel,
      gt_bapiadfax  type table of bapiadfax,
      gt_bapiadttx  type table of bapiadttx,
      gt_bapiadtlx  type table of bapiadtlx,
      gt_bapiadsmtp type table of bapiadsmtp,
      gt_bapiadrml  type table of bapiadrml,
      gt_bapiadx400 type table of bapiadx400,
      gt_bapiadrfc  type table of bapiadrfc,
      gt_bapiadprt  type table of bapiadprt,
      gt_bapiadssf  type table of bapiadssf,
      gt_bapiaduri  type table of bapiaduri,
      gt_bapiadpag  type table of bapiadpag,
      gt_bapiad_rem type table of bapiad_rem,
      gt_bapicomrem type table of bapicomrem,
      gt_bapiaduse  type table of bapiaduse,
      gt_return     type table of bapiret2.

gv_obj_type = 'KNA1'.
gv_obj_id = '0000900015'.

call function 'BAPI_ADDRESSORG_GETDETAIL'
  exporting
    obj_type       = gv_obj_type
    obj_id         = gv_obj_id
*   OBJ_ID_EXT     = ' '
*   CONTEXT        = 1
*   IV_CURRENT_COMM_DATA       = 'X'
  importing
    address_number = gv_address_number
  tables
    bapiad1vl      = gt_bapiad1vl
    bapiadtel      = gt_bapiadtel
    bapiadfax      = gt_bapiadfax
    bapiadttx      = gt_bapiadttx
    bapiadtlx      = gt_bapiadtlx
    bapiadsmtp     = gt_bapiadsmtp
    bapiadrml      = gt_bapiadrml
    bapiadx400     = gt_bapiadx400
    bapiadrfc      = gt_bapiadrfc
    bapiadprt      = gt_bapiadprt
    bapiadssf      = gt_bapiadssf
    bapiaduri      = gt_bapiaduri
    bapiadpag      = gt_bapiadpag
    bapiad_rem     = gt_bapiad_rem
    bapicomrem     = gt_bapicomrem
    bapiaduse      = gt_bapiaduse
    return         = gt_return.


cl_demo_output=>display( gt_bapiad1vl ).
