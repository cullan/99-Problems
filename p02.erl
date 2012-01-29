-module(p02).
-export([last_two/1]).
-include("test.erl").

last_two([]) ->
    error(last_two_of_empty_list);
last_two([_]) ->
    error(last_two_of_list_of_one);
last_two([A, B| []]) ->
    [A, B];
last_two([_X|Xs]) ->
    last_two(Xs).

%% Tests
-ifdef(TEST).

p02_test_() ->
    [{"call last_two doesn't crash",
      ?_test(last_two([a, b, c]))},
     {"last_two with two few args is an error",
      [?_assertError(last_two_of_empty_list,  last_two([])),
       ?_assertError(last_two_of_list_of_one, last_two([a]))]},
     {"last_two(L) returns last two items",
      [?_assertEqual([b,c], last_two([a,b,c])),
       ?_assertEqual([c,d], last_two([a,b,c,d]))]}].

-endif. %end tests
