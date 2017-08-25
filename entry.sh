# https://stackoverflow.com/a/307735/2001966
#
: "${TOR_ORPORT:?TOR_ORPORT should be set.}"
: "${TOR_NICKNAME:?TOR_NICKNAME should be set.}"
: "${TOR_CONTACT:?TOR_CONTACT should be set.}"
: "${TOR_DIRPORT:?TOR_DIRPORT should be set.}"
#
cat torrc.template.ini | envsubst | tor -f -