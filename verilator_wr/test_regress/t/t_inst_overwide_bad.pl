#!/usr/bin/perl
if (!$::Driver) { use FindBin; exec("$FindBin::Bin/bootstrap.pl", @ARGV, $0); die; }
# DESCRIPTION: Verilator: Verilog Test driver/expect definition
#
# Copyright 2004 by Wilson Snyder. This program is free software; you can
# redistribute it and/or modify it under the terms of either the GNU
# Lesser General Public License Version 3 or the Perl Artistic License
# Version 2.0.

scenarios(simulator => 1);

top_filename("t/t_inst_overwide.v");

compile(
    v_flags2 => ["--lint-only"],
    verilator_flags => [qw(-cc)],
    verilator_make_gcc => 0,
    make_top_shell => 0,
    make_main => 0,
    fails => $Self->{vlt_all},
    expect_filename => $Self->{golden_filename},
    );

ok(1);
1;
