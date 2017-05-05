BASE_URL=smb://WIN-NTNU-NO/followprint.win.ntnu.no/

echo "Finding appropriate driver"

FOOMATIC_DRIVERS=$(lpinfo --make-and-model 'Generic PostScript Printer' -m)
if echo "$FOOMATIC_DRIVERS" | grep -q 'recommended' ; then
    DRIVER=$(echo "$FOOMATIC_DRIVERS" | grep 'recommended' | head -1 | awk '{ print $1 }')
else
    DRIVER=$(echo "$FOOMATIC_DRIVERS" | head -1 | awk '{ print $1 }')
fi

echo "Installing printers"

DEFAULT_OPTIONS="-o Duplex=DuplexNoTumble -o PageSize=A4"

lpadmin -p IT-bygget $DEFAULT_OPTIONS -v "$BASE_URL"ntnuprint-ricoh -m $DRIVER -D "IT-bygget" -L "Skrivere på IT-bygget (printhost-ricoh)" -E
lpadmin -p P15 $DEFAULT_OPTIONS -v "$BASE_URL"ntnu-datasal-hp -m $DRIVER -D "P15" -L "Skrivere på P15 (ntnu-datasal-hp)" -E

echo "Done. Start printing!"
