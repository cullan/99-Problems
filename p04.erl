-module(p04).
-export([my_length/1]).
-include("test.erl").

%% Find the number of elements in a list
my_length([]) ->
    0;
my_length([_X|Xs]) ->
    1 + my_length(Xs).

%% Tests
-ifdef(TEST).

p04_test_() ->
    [{"call my_length doesn't crash", ?_test(my_length([a, b]))},
     {"my_length returns correct length",
      [?_assertEqual(0, my_length([])),
       ?_assertEqual(1, my_length([a])),
       ?_assertEqual(2, my_length([a, b]))]}].

-endif. %end tests
