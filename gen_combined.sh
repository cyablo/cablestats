#!/bin/bash

# Load configuration
source ./config.sh
# Constants
source ./constants.sh

for i in "${!TIMES[@]}"; do
    rrdtool graph ${BASE_DIR}/images/combined-${FILE_NAMES[$i]}.png \
    --title="${LOCATION} | All Channels | ${TIMES_NAMES[$i]}" \
    --vertical-label='kBit per Second' \
    -W "${HOST} @ $(date '+%F %T %Z')" \
    --start ${TIMES[$i]} \
    --slope-mode \
    -w 1301 -h 150 \
    -l 0 -u 667440 \
    --color BACK#ededed \
    --color ARROW#000000 \
    DEF:b546min=${BASE_DIR}/546000000.rrd:bandwidth:MIN \
    DEF:b546avg=${BASE_DIR}/546000000.rrd:bandwidth:AVERAGE \
    DEF:b546max=${BASE_DIR}/546000000.rrd:bandwidth:MAX \
    DEF:b546last=${BASE_DIR}/546000000.rrd:bandwidth:LAST \
    DEF:b554min=${BASE_DIR}/554000000.rrd:bandwidth:MIN \
    DEF:b554avg=${BASE_DIR}/554000000.rrd:bandwidth:AVERAGE \
    DEF:b554max=${BASE_DIR}/554000000.rrd:bandwidth:MAX \
    DEF:b554last=${BASE_DIR}/554000000.rrd:bandwidth:LAST \
    DEF:b562min=${BASE_DIR}/562000000.rrd:bandwidth:MIN \
    DEF:b562avg=${BASE_DIR}/562000000.rrd:bandwidth:AVERAGE \
    DEF:b562max=${BASE_DIR}/562000000.rrd:bandwidth:MAX \
    DEF:b562last=${BASE_DIR}/562000000.rrd:bandwidth:LAST \
    DEF:b570min=${BASE_DIR}/570000000.rrd:bandwidth:MIN \
    DEF:b570avg=${BASE_DIR}/570000000.rrd:bandwidth:AVERAGE \
    DEF:b570max=${BASE_DIR}/570000000.rrd:bandwidth:MAX \
    DEF:b570last=${BASE_DIR}/570000000.rrd:bandwidth:LAST \
    DEF:b578min=${BASE_DIR}/578000000.rrd:bandwidth:MIN \
    DEF:b578avg=${BASE_DIR}/578000000.rrd:bandwidth:AVERAGE \
    DEF:b578max=${BASE_DIR}/578000000.rrd:bandwidth:MAX \
    DEF:b578last=${BASE_DIR}/578000000.rrd:bandwidth:LAST \
    DEF:b586min=${BASE_DIR}/586000000.rrd:bandwidth:MIN \
    DEF:b586avg=${BASE_DIR}/586000000.rrd:bandwidth:AVERAGE \
    DEF:b586max=${BASE_DIR}/586000000.rrd:bandwidth:MAX \
    DEF:b586last=${BASE_DIR}/586000000.rrd:bandwidth:LAST \
    DEF:b594min=${BASE_DIR}/594000000.rrd:bandwidth:MIN \
    DEF:b594avg=${BASE_DIR}/594000000.rrd:bandwidth:AVERAGE \
    DEF:b594max=${BASE_DIR}/594000000.rrd:bandwidth:MAX \
    DEF:b594last=${BASE_DIR}/594000000.rrd:bandwidth:LAST \
    DEF:b602min=${BASE_DIR}/602000000.rrd:bandwidth:MIN \
    DEF:b602avg=${BASE_DIR}/602000000.rrd:bandwidth:AVERAGE \
    DEF:b602max=${BASE_DIR}/602000000.rrd:bandwidth:MAX \
    DEF:b602last=${BASE_DIR}/602000000.rrd:bandwidth:LAST \
    DEF:b666min=${BASE_DIR}/666000000.rrd:bandwidth:MIN \
    DEF:b666avg=${BASE_DIR}/666000000.rrd:bandwidth:AVERAGE \
    DEF:b666max=${BASE_DIR}/666000000.rrd:bandwidth:MAX \
    DEF:b666last=${BASE_DIR}/666000000.rrd:bandwidth:LAST \
    DEF:b674min=${BASE_DIR}/674000000.rrd:bandwidth:MIN \
    DEF:b674avg=${BASE_DIR}/674000000.rrd:bandwidth:AVERAGE \
    DEF:b674max=${BASE_DIR}/674000000.rrd:bandwidth:MAX \
    DEF:b674last=${BASE_DIR}/674000000.rrd:bandwidth:LAST \
    DEF:b682min=${BASE_DIR}/682000000.rrd:bandwidth:MIN \
    DEF:b682avg=${BASE_DIR}/682000000.rrd:bandwidth:AVERAGE \
    DEF:b682max=${BASE_DIR}/682000000.rrd:bandwidth:MAX \
    DEF:b682last=${BASE_DIR}/682000000.rrd:bandwidth:LAST \
    DEF:b690min=${BASE_DIR}/690000000.rrd:bandwidth:MIN \
    DEF:b690avg=${BASE_DIR}/690000000.rrd:bandwidth:AVERAGE \
    DEF:b690max=${BASE_DIR}/690000000.rrd:bandwidth:MAX \
    DEF:b690last=${BASE_DIR}/690000000.rrd:bandwidth:LAST \
    CDEF:bmin=b546min,b554min,b562min,b570min,b578min,b586min,b594min,b602min,b666min,b674min,b682min,b690min,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN \
    CDEF:bavg=b546avg,b554avg,b562avg,b570avg,b578avg,b586avg,b594avg,b602avg,b666avg,b674avg,b682avg,b690avg,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN \
    CDEF:bmax=b546max,b554max,b562max,b570max,b578max,b586max,b594max,b602max,b666max,b674max,b682max,b690max,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN \
    CDEF:blast=b546last,b554last,b562last,b570last,b578last,b586last,b594last,b602last,b666last,b674last,b682last,b690last,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN,ADDNAN \
    AREA:667440#c9feb8 \
    STACK:55040#feb8b8 \
    COMMENT:"Separate Channel Statistics\n" \
    AREA:b546avg#fffc00:'546 Mhz      ' \
    GPRINT:b546avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b546min:MIN:"Min %5.2lf %s   " \
    GPRINT:b546max:MAX:"Max %5.2lf %s" \
    GPRINT:b546last:LAST:"  Last %5.2lf %s\n" \
    STACK:b554avg#ffc600:'554 Mhz      ' \
    GPRINT:b554avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b554min:MIN:"Min %5.2lf %s   " \
    GPRINT:b554max:MAX:"Max %5.2lf %s" \
    GPRINT:b554last:LAST:"  Last %5.2lf %s\n" \
    STACK:b562avg#ffa200:'562 Mhz      ' \
    GPRINT:b562avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b562min:MIN:"Min %5.2lf %s   " \
    GPRINT:b562max:MAX:"Max %5.2lf %s" \
    GPRINT:b562last:LAST:"  Last %5.2lf %s\n" \
    STACK:b570avg#ff6c00:'570 Mhz      ' \
    GPRINT:b570avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b570min:MIN:"Min %5.2lf %s   " \
    GPRINT:b570max:MAX:"Max %5.2lf %s" \
    GPRINT:b570last:LAST:"  Last %5.2lf %s\n" \
    STACK:b578avg#00c6ff:'578 Mhz      ' \
    GPRINT:b578avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b578min:MIN:"Min %5.2lf %s   " \
    GPRINT:b578max:MAX:"Max %5.2lf %s" \
    GPRINT:b578last:LAST:"  Last %5.2lf %s\n" \
    STACK:b586avg#0090ff:'586 Mhz      ' \
    GPRINT:b586avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b586min:MIN:"Min %5.2lf %s   " \
    GPRINT:b586max:MAX:"Max %5.2lf %s" \
    GPRINT:b586last:LAST:"  Last %5.2lf %s\n" \
    STACK:b594avg#0066ff:'594 Mhz      ' \
    GPRINT:b594avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b594min:MIN:"Min %5.2lf %s   " \
    GPRINT:b594max:MAX:"Max %5.2lf %s" \
    GPRINT:b594last:LAST:"  Last %5.2lf %s\n" \
    STACK:b602avg#0042ff:'602 Mhz      ' \
    GPRINT:b602avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b602min:MIN:"Min %5.2lf %s   " \
    GPRINT:b602max:MAX:"Max %5.2lf %s" \
    GPRINT:b602last:LAST:"  Last %5.2lf %s\n" \
    STACK:b666avg#c600ff:'666 Mhz      ' \
    GPRINT:b666avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b666min:MIN:"Min %5.2lf %s   " \
    GPRINT:b666max:MAX:"Max %5.2lf %s" \
    GPRINT:b666last:LAST:"  Last %5.2lf %s\n" \
    STACK:b674avg#9000ff:'674 Mhz      ' \
    GPRINT:b674avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b674min:MIN:"Min %5.2lf %s   " \
    GPRINT:b674max:MAX:"Max %5.2lf %s" \
    GPRINT:b674last:LAST:"  Last %5.2lf %s\n" \
    STACK:b682avg#6600ff:'682 Mhz      ' \
    GPRINT:b682avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b682min:MIN:"Min %5.2lf %s   " \
    GPRINT:b682max:MAX:"Max %5.2lf %s" \
    GPRINT:b682last:LAST:"  Last %5.2lf %s\n" \
    STACK:b690avg#4200ff:'690 Mhz      ' \
    GPRINT:b690avg:AVERAGE:"Avg %5.2lf %s   " \
    GPRINT:b690min:MIN:"Min %5.2lf %s   " \
    GPRINT:b690max:MAX:"Max %5.2lf %s" \
    GPRINT:b690last:LAST:"  Last %5.2lf %s\n" \
    COMMENT:"Overall Channel Statistics\n" \
    GPRINT:bavg:AVERAGE:"                 Avg %5.2lf %s" \
    GPRINT:bmin:MIN:"   Min %5.2lf %s" \
    GPRINT:bmax:MAX:"   Max %5.2lf %s" \
    GPRINT:blast:LAST:"  Last %5.2lf %s\n" \
    HRULE:667440#000000:'CAP (667.44 Mbit/s)':dashes=5 \
    LINE1:bmax#5f5f5f:"Peak-Bandwidth"
    echo ""
done