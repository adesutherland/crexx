/* rexx tests */
parse arg interpreter
if interpreter='' then interpreter='rexx'
parse source source 1 system .
parse version rexx_version
suffix = '.exec'
if system='CMS' then
do
suffix = ''
interpreter = ''
"CP SPOOL CONS * START"
end
interpreter ' abbrev_'||suffix
interpreter ' abs_'||suffix
interpreter ' address_'||suffix
interpreter ' arg_'||suffix
interpreter ' bitand_'||suffix
interpreter ' bitor_'||suffix
interpreter ' bitxor_'||suffix
interpreter ' b2x_'||suffix
interpreter ' center_'||suffix
interpreter ' changes_'||suffix
interpreter ' charin_'||suffix
interpreter ' charout_'||suffix
interpreter ' chars_'||suffix
interpreter ' compare_'||suffix
interpreter ' conditi_'||suffix
interpreter ' copies_'||suffix
interpreter ' countst_'||suffix
interpreter ' c2d_'||suffix
interpreter ' c2x_'||suffix
interpreter ' datatyp_'||suffix
interpreter ' date_'||suffix
interpreter ' delstr_'||suffix
interpreter ' delword_'||suffix
interpreter ' digits_'||suffix
interpreter ' d2c_'||suffix
interpreter ' d2x_'||suffix
interpreter ' errorte_'||suffix
interpreter ' form_'||suffix
interpreter ' format_'||suffix
interpreter ' fuzz_'||suffix
interpreter ' insert_'||suffix
interpreter ' lastpos_'||suffix
interpreter ' left_'||suffix
interpreter ' length_'||suffix
interpreter ' linein_'||suffix
interpreter ' lineout_'||suffix
interpreter ' lines_'||suffix
interpreter ' max_'||suffix
interpreter ' min_'||suffix
interpreter ' overlay_'||suffix
interpreter ' pos_'||suffix
interpreter ' qualify_'||suffix
interpreter ' queued_'||suffix
interpreter ' random_'||suffix
interpreter ' reverse_'||suffix
interpreter ' right_'||suffix
interpreter ' sign_'||suffix
interpreter ' sourcel_'||suffix
interpreter ' space_'||suffix
interpreter ' stream_'||suffix
interpreter ' strip_'||suffix
interpreter ' substr_'||suffix
interpreter ' subword_'||suffix
interpreter ' symbol_'||suffix
interpreter ' time_'||suffix
interpreter ' trace_'||suffix
interpreter ' transla_'||suffix
interpreter ' trunc_'||suffix
interpreter ' value_'||suffix
interpreter ' verify_'||suffix
interpreter ' word_'||suffix
interpreter ' wordind_'||suffix
interpreter ' wordlen_'||suffix
interpreter ' wordpos_'||suffix
interpreter ' words_'||suffix
interpreter ' xrange_'||suffix
interpreter ' x2b_'||suffix
interpreter ' x2c_'||suffix
interpreter ' x2d_'||suffix
interpreter ' testexc'||suffix
interpreter ' maths_'||suffix

if system='CMS' then "CP SPOOL CONS STOP CLOSE"
