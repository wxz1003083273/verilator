#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2003-2009 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(dist => 1);

run(cmd => ["../bin/verilator_coverage",
            "--rank",
            "t/t_vlcov_data_a.dat",
            "t/t_vlcov_data_b.dat",
            "t/t_vlcov_data_c.dat",
            "t/t_vlcov_data_d.dat",
    ],
    logfile => "$Self->{obj_dir}/vlcov.log",
    tee => 0,
    );

files_identical("$Self->{obj_dir}/vlcov.log", "t/$Self->{name}.out");

ok(1);
1;
