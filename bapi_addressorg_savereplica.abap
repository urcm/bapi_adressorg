
data: gv_objid          type  bapi4001_1-objkey,
      gs_return         type bapiret2,
      gv_address_number type bapi4001_1-addr_no,
      gv_kunnr          type kunnr.

data: gt_bapiad1vl  type table of bapiad1vl,
      gs_bapiad1vl  like line of gt_bapiad1vl,
      gt_bapiadtel  type table of bapiadtel,
      gs_bapiadtel  like line of gt_bapiadtel,
      gt_bapiadfax  type table of bapiadfax,
      gs_bapiadfax  type bapiadfax,
      gt_bapiadsmtp type table of bapiadsmtp,
      gs_bapiadsmtp type bapiadsmtp.


* BAPI-Structure Company Address (w/o. Comm. Data)
gs_bapiad1vl-name = 'NEWCUST'.
gs_bapiad1vl-city = 'München'.
gs_bapiad1vl-country = 'DE'.
gs_bapiad1vl-addr_group = 'BF'.
gs_bapiad1vl-langu = 'DE'.
gs_bapiad1vl-street = 'Münchener Str.'.
gs_bapiad1vl-street_no = '59'.
append gs_bapiad1vl to gt_bapiad1vl.
clear: gs_bapiad1vl.

* BAPI structure telephone numbers
gs_bapiadtel-country = 'DE'.
gs_bapiadtel-telephone = '049179874521'.
gs_bapiadtel-extension = '49'.
append gs_bapiadtel to gt_bapiadtel.
clear: gs_bapiadtel.

* API structure fax numbers
gs_bapiadfax-country = 'DE'.
gs_bapiadfax-fax = '049179874520'.
gs_bapiadfax-extension = '49'.
append gs_bapiadfax to gt_bapiadfax.
clear gs_bapiadfax.

* BAPI Structure Internet Addresses
gs_bapiadsmtp-e_mail = 'info@newcust.com'.
append gs_bapiadsmtp to gt_bapiadsmtp.
clear: gs_bapiadsmtp.

gv_kunnr = '32'.

call function 'CONVERSION_EXIT_ALPHA_INPUT'
  exporting
    input  = gv_kunnr
  importing
    output = gv_kunnr.

gv_objid = gv_kunnr.

call function 'BAPI_ADDRESSORG_SAVEREPLICA'
  exporting
    obj_type       = 'KNA1'
    obj_id         = gv_objid
*   obj_id_ext     = space
*   iv_check_address = 'X'
*   context        = 1
  importing
    return         = gs_return
    address_number = gv_address_number
  tables
    bapiad1vl      = gt_bapiad1vl
    bapiadtel      = gt_bapiadtel
    bapiadfax      = gt_bapiadfax
    bapiadsmtp     = gt_bapiadsmtp.

call function 'BAPI_TRANSACTION_COMMIT'.

cl_demo_output=>display( gt_bapiad1vl ).
write :/ gv_address_number.
