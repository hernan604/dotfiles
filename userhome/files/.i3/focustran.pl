#!/usr/bin/perl -w

# This script is written by Andrei Perhinschi
# and is licensed under the GNU GPL license
# http://www.gnu.org/licenses/gpl.html

# Much thanks goes to Daniel Forchheimer (http://www.forchheimer.se/)
# for creating transset and the eutotrans
# script from which this script gets its inspiration

# needs transset (pkg install transset)
# USAGE:
# sleep 2
# xcompmgr n &
# focustran.pl 0.65 0.95 0.2 &

if ( !defined $ARGV[0] || !defined $ARGV[1] || !defined $ARGV[2] ) {
die 'Usage: focustran <unfocused value> <focused value> <refresh value (secs)>\n';
}

# default values
$trans_val = $ARGV[0];
$opaque_val = $ARGV[1];
$sleep_val = $ARGV[2];

# grab all window IDs
@win_ids = `xwininfo -root -all`;
foreach my $win_id ( @win_ids ) {
	#unless ( $win_id =~ /has\ no\ name/ || $win_id !~ /0x/ || $win_id =~ /Desktop/ ) {
	unless ( $win_id =~ m#0x.+"# and $win_id !~ m#i3# ) {
		$win_id =~ /\ \"/;
		$win_id = "$`";
		$win_id =~ s/\s//g;
		warn "WINID: ".$win_id;
        $win_id =~ s#^(0x[a-f0-9A-F]+).*#\1#;
		warn "WINID2: ".$win_id;
		push @id_lines, hex($win_id) if $win_id =~ m#^0x#;
	}
}

print "ID_LINES:@id_lines\n";

# make all windows transparent
foreach my $win_id ( @id_lines ) {
    warn "transset –id $win_id $trans_val";
    `transset --id "$win_id" $trans_val >/dev/null`;
    warn $win_id;
}

$old_id = 0;
# get currently focused window’s ID
while ( 1 ) {
    my $active_id = `xprop -root  | grep "_NET_ACTIVE_WINDOW(WINDOW): window id # "`;
    $active_id =~ /\#\s/;
    $active_id = "$'";
    chomp $active_id;
    # set active window to opaque_val and old window to trans_val
    if ( $old_id ne $active_id ) {
    `transset --id $active_id $opaque_val >/dev/null`;
    `transset --id $old_id $trans_val >/dev/null`;
    }
    $old_id = $active_id;
    print "active_ID:$active_id\n";
    select ( undef, undef, undef, $sleep_val );
}
