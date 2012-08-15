-module(p04).
-export([my_length/1, my_length_tr/1]).
-include("test.hrl").

%% Find the number of elements in a list.
my_length([]) ->
    0;
my_length([_X|Xs]) ->
    1 + my_length(Xs).

% Tail recursive version.
my_length_tr(L) when is_list(L) ->
    my_length_tr(L, 0).

my_length_tr([], Acc) ->
    Acc;
my_length_tr([_X|Xs], Acc) ->
    my_length_tr(Xs, Acc + 1).

%% Tests
-ifdef(TEST).

p04_test_() ->
    [{"call my_length doesn't crash", ?_test(my_length([a, b]))},
     {"my_length returns correct length",
      [?_assertEqual(0, my_length([])),
       ?_assertEqual(1, my_length([a])),
       ?_assertEqual(2, my_length([a, b]))]},
     {"call my_length_tr doesn't crash", ?_test(my_length_tr([a, b]))},
     {"my_length_tr returns correct length",
      [?_assertEqual(0, my_length_tr([])),
       ?_assertEqual(1, my_length_tr([a])),
       ?_assertEqual(2, my_length_tr([a, b]))]}].

-endif. %end tests
