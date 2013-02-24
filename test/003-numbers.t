#! /usr/bin/env escript
% This file is part of Jiffy released under the MIT license.
% See the LICENSE file for more information.

main([]) ->
    code:add_pathz("ebin"),
    code:add_pathz("test"),

    etap:plan(59),
    util:test_good(good()),
    util:test_errors(errors()),
    etap:end_tests().

good() ->
    [
        {<<"0">>, 0},
        {<<"-0">>, 0, <<"0">>},
        {<<"1">>, 1},
        {<<"12">>, 12},
        {<<"-3">>, -3},
        {<<"1234567890123456789012345">>, 1234567890123456789012345},
        {<<"1310050760199">>, 1310050760199},
        {
            <<"1234567890123456789012345.0">>,
            1.23456789012345678e24,
            <<"1.2345678901234568e+24">>
        },
        {
            <<"1234567890123456789012345.0E3">>,
            1.2345678901234569e27,
            <<"1.2345678901234569e+27">>
        },
        {
            <<"1234567890123456789012345012">>,
            1234567890123456789012345012,
            <<"1234567890123456789012345012">>
        },
        {<<"1.0">>, 1.0},
        {
            <<"0.000000000000000000000000000000000001">>,
            1.0E-36,
            <<"1e-36">>
        },
        {<<"0.75">>, 0.75},
        {<<"2.0123456789">>, 2.0123456789, <<"2.0123456789">>},
        {<<"2.4234324E24">>, 2.4234324E24, <<"2.4234324e+24">>},
        {<<"-3.1416">>, -3.1416, <<"-3.1416">>},
        {<<"1E4">>, 10000.0, <<"10000.0">>},
        {<<"1.0E+01">>, 10.0, <<"10.0">>},
        {<<"1e1">>, 10.0, <<"10.0">>},
        {<<"3.0E2">>, 300.0, <<"300.0">>},
        {<<"0E3">>, 0.0, <<"0.0">>},
        {<<"1.5E3">>, 1500.0, <<"1500.0">>},
        {<<"2.5E-1">>, 0.25, <<"0.25">>},
        {<<"-0.325E+2">>, -32.5, <<"-32.5">>}
    ].

errors() ->
    [
        <<"02">>,
        <<"-01">>,
        <<"+12">>,
        <<"-">>,
        <<"1.">>,
        <<".1">>,
        <<"1.-1">>,
        <<"1E">>,
        <<"1-E2">>,
        <<"2E +3">>,
        <<"1EA">>
    ].
