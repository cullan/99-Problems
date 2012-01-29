-module(p03).
-export([nth/2]).
-include("test.erl").

%% Find the Nth element of a list
nth(N, L) ->
    nth(N, L, 1).
nth(_N, [], _C) ->
    error(out_of_bounds);
nth(N, [X|_Xs], N) ->
    X;
nth(N, [_X|Xs], C) ->
    nth(N, Xs, C+1).

%% Tests
-ifdef(TEST).

p03_test_() ->
    [{"call nth doesn't crash", ?_test(nth(1, [a,b]))},
     {"nth of list with length < N is error",
      [?_assertError(out_of_bounds, nth(1, [])),
       ?_assertError(out_of_bounds, nth(2, [a])),
       ?_assertError(out_of_bounds, nth(3, [a, b]))]},
     {"nth item of list is returned",
      [?_assertEqual(a, nth(1, [a])),
       ?_assertEqual(a, nth(1, [a, b])),
       ?_assertEqual(b, nth(2, [a, b])),
       ?_assertEqual(d, nth(4, [a, b, c, d])),
       ?_assertEqual(b, nth(2, [a, b, c]))]}].

-endif. %end tests
