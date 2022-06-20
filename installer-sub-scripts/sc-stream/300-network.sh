# ------------------------------------------------------------------------------
# NETWORK.SH
# ------------------------------------------------------------------------------
set -e
source $INSTALLER/000-source

# ------------------------------------------------------------------------------
# ENVIRONMENT
# ------------------------------------------------------------------------------
MACH="eb-stream-host"
cd $MACHINES/$MACH

# ------------------------------------------------------------------------------
# INIT
# ------------------------------------------------------------------------------
[[ "$DONT_RUN_NETWORK_INIT" = true ]] && exit

# ------------------------------------------------------------------------------
# NETWORK CONFIG
# ------------------------------------------------------------------------------
# changed/added system files
cp etc/dnsmasq.d/eb-stream /etc/dnsmasq.d/

# ------------------------------------------------------------------------------
# NETWORK RELATED SERVICES
# ------------------------------------------------------------------------------
# dnsmasq
systemctl stop dnsmasq.service
systemctl start dnsmasq.service
