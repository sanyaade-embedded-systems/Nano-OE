# Sigh, if PV has SRCREV/SRCPV, this causes the world to explode at update_data time, it seems
#OVERRIDES .= ":${PV}"

python () {
    pv = d.getVar("PV", True)

    # Allow version-specific checksums
    for flag in ("md5sum", "sha256sum"):
        hash = d.getVarFlag("SRC_URI_%s" % pv, flag)
        if hash:
            d.setVarFlag("SRC_URI", flag, hash)
            break

    pref = d.getVar("DEFAULT_PREFERENCE_%s" % pv, True)
    if pref:
        d.setVar("DEFAULT_PREFERENCE", pref)
}