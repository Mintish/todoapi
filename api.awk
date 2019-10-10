/^GET/ { split($2,fields,"/"); print (fields[2] == "" ? "," : fields[2]) "pn\nq"; }
/^PUT/ { split($2,fields,"/"); print fields[2] "c\n" fields[3] "\n.\nw\nq"; }
/^POST/ { split($2,fields,"/"); print "a\n" fields[2] "\n.\nw\nq"; }
/^DELETE/ { split($2,fields,"/"); print fields[2] "d\nw\nq"; }
