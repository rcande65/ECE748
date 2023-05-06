xml2ucdb -format Excel ./lc3_test_plan.xml ./lc3_test_plan.ucdb
vcover merge -stats=none -strip 0 -totals merged.ucdb ./*.ucdb
quit -f
add testbrowser ./*.ucdb
