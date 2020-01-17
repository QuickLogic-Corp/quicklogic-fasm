#!/bin/bash

DEV=ql732b
SCRIPT=./quicklogic/convert_csv_to_db.py
CSVLOCDIR=./ql732b/csv

CSVLOC=${CSVLOCDIR%/}

if [[ -z "${1:-}" ]]; then
   echo "Usage: $0 <out_dir>"
   exit 1
fi

OUTDIR=${1%/}

python3 $SCRIPT $CSVLOC/DeviceMacroCoord_$DEV.csv $OUTDIR/macro.db \
   --include \
       $CSVLOC/macroTable_$DEV.csv \
       $CSVLOC/macro_clkTable_$DEV.csv \
       $CSVLOC/macro_gclkTable_$DEV.csv \
       $CSVLOC/macro_interfaceTable_$DEV.csv \
       $CSVLOC/macro_interface_topTable_$DEV.csv \
       $CSVLOC/macro_interface_top_rightTable_$DEV.csv \
       $CSVLOC/macro_interface_top_leftTable_$DEV.csv \
       $CSVLOC/macro_interface_rightTable_$DEV.csv \
       $CSVLOC/macro_interface_leftTable_$DEV.csv \
   --macro-names \
       macro \
       macro_clk \
       macro_gclk \
       macro_interface \
       macro_interface_top \
       macro_interface_top_right \
       macro_interface_top_left \
       macro_interface_right \
       macro_interface_left

python3 $SCRIPT $CSVLOC/ColClk_$DEV.csv $OUTDIR/colclk.db
python3 $SCRIPT $CSVLOC/TestMacro_$DEV.csv $OUTDIR/testmacro.db
