BASE_URL=http://printhost.idi.ntnu.no:631/printers/

echo "Finding appropriate drivers"

FOOMATIC_DRIVERS=$(lpinfo --make-and-model 'Generic PostScript Printer' -m)
if echo "$FOOMATIC_DRIVERS" | grep -q 'recommended' ; then
    FOOMATIC=$(echo "$FOOMATIC_DRIVERS" | grep 'recommended' | head -1 | awk '{ print $1 }')
else
    FOOMATIC=$(echo "$FOOMATIC_DRIVERS" | head -1 | awk '{ print $1 }')
fi

RICOH_DRIVERS=$(lpinfo --make-and-model 'RICOH AficioSG3110DNw PXL' -m)
if echo "$RICOH_DRIVERS" | grep -q 'recommended' ; then
    RICOH=$(echo "$RICOH_DRIVERS" | grep 'recommended' | head -1 | awk '{ print $1 }')
else
    RICOH=$(echo "$RICOH_DRIVERS" | head -1 | awk '{ print $1 }')
fi

echo "Installing printers"

lpadmin -p its008 -v "$BASE_URL"its008 -m $FOOMATIC -D "its008" -L "its008" -E
lpadmin -p its119 -v "$BASE_URL"its119 -m $FOOMATIC -D "its119" -L "Drivhuset (ITS-119)" -E
lpadmin -p itv000 -v "$BASE_URL"itv000 -m $FOOMATIC -D "itv000, laserskriver, it vest" -L "it vest, sokkeletasje, oasen" -E
lpadmin -p itv002 -v "$BASE_URL"itv002 -m $FOOMATIC -D "itv002, laserskriver, it vest" -L "it vest, sokkeletasje, rom 002" -E
lpadmin -p itv122 -v "$BASE_URL"itv122 -m $FOOMATIC -D "itv122, laserskriver, it vest" -L "it vest, 1. etg, rom 122, studentekspedisjonen" -E
lpadmin -p itv146b -v "$BASE_URL"itv146b -m $FOOMATIC -D "itv146b, laserskriver, it vest " -L " it vest, 1. etg, rom 122" -E
lpadmin -p itv154 -v "$BASE_URL"itv154 -m $FOOMATIC -D "itv154, laserskriver, it vest" -L "it vest, 1. etg, rom 154, kopirom" -E
lpadmin -p itv164farge -v "$BASE_URL"itv164farge -m $RICOH -D "RICOH AficioSG3110DNw" -L "it vest, 1. etg, rom 164" -E
lpadmin -p itv226 -v "$BASE_URL"itv226 -m $FOOMATIC -D "itv226, laserskriver, it vest" -L "it vest, 2. etg, administrasjonen" -E
lpadmin -p itv254 -v "$BASE_URL"itv254 -m $FOOMATIC -D "itv254, laserskriver, it vest" -L "it vest, 2. etg, rom 254, postrommet" -E
lpadmin -p itv258 -v "$BASE_URL"itv258 -m $FOOMATIC -D "itv258, laserskriver, it vest" -L "it-vest,2.etg rom 258, administrasjonen" -E
lpadmin -p itv346b -v "$BASE_URL"itv346b -m $FOOMATIC -D "itv346b, laserskriver, it vest" -L "it vest, 3. etg , rom itv346b" -E
lpadmin -p itv360b -v "$BASE_URL"itv360b -m $FOOMATIC -D "itv360b, laserskriver, it vest" -L "it vest, 3. etg, rom itv360b" -E
lpadmin -p itv443b -v "$BASE_URL"itv443b -m $FOOMATIC -D "itv443b, laserskriver, it vest" -L "it vest, 4. etg, rom 443b" -E
lpadmin -p itv443bfarge -v "$BASE_URL"itv443bfarge -m $FOOMATIC -D "itv443bfarge, fargeskriver, it vest" -L "it vest, 4. etg, rom 443b" -E
lpadmin -p itv462 -v "$BASE_URL"itv462 -m $FOOMATIC -D "itv462, laserskriver, it vest" -L "it vest, 4. etg, rom 462" -E

echo "Done. Start printing!"
