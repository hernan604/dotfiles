#!/usr/bin/env bash
source ~/.bashrc

i3status | while :
do
    read line
#   gmail=`perl gmail.pl`
    perl_version=`perl -e "print 'perl('.$^V.')'"`

    external_ip="$HOME/.external_ip"
    ip=$(cat $external_ip)

    temp_nvidia=$(nvidia-settings -q gpucoretemp |grep '):' | cut -d ' ' -f 6,6 | sed -e 's/.\{1\}$//')

    temp_tz0=$(sysctl hw.acpi.thermal.tz0.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+)$/$2/g; print $in')
    temp_tz1=$(sysctl hw.acpi.thermal.tz1.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+)$/$2/g; print $in')

    temp_cpu0=$(sysctl dev.cpu.0.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu1=$(sysctl dev.cpu.1.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu2=$(sysctl dev.cpu.2.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu3=$(sysctl dev.cpu.3.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu4=$(sysctl dev.cpu.4.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu5=$(sysctl dev.cpu.5.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu6=$(sysctl dev.cpu.6.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')
    temp_cpu7=$(sysctl dev.cpu.7.temperature | perl -e 'my $in = <>; $in =~ s/(.*): (.+).\dC$/$2/g; print $in')

    # list all the temperature variables from sysctl in freebsd: sysctl -a |grep temper
    #   hw.acpi.thermal.tz1.temperature: 29.8C
    #   hw.acpi.thermal.tz0.temperature: 27.8C
    #   dev.cpu.7.temperature: 68.0C
    #   dev.cpu.6.temperature: 68.0C
    #   dev.cpu.5.temperature: 65.0C
    #   dev.cpu.4.temperature: 64.0C
    #   dev.cpu.3.temperature: 60.0C
    #   dev.cpu.2.temperature: 60.0C
    #   dev.cpu.1.temperature: 67.0C
    #   dev.cpu.0.temperature: 67.0C

    echo "$perl_version | GPU $temp_nvidia | z0 $temp_tz0 $temp_tz1 | CPU $temp_cpu0 $temp_cpu1 $temp_cpu2 $temp_cpu3 $temp_cpu4 $temp_cpu5 $temp_cpu6 $temp_cpu7 C | $ip | $line" || exit 1
done

exit 2
