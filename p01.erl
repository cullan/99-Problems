-module(p01).
-export([last/1]).
-include("test.erl").

last([]) ->
    error(last_of_empty_list);
last([X]) ->
    X;
last([_X|Xs]) ->
    last(Xs).

%% Tests
-ifdef(TEST).

p01_test_() ->
    [{"call last doesn't crash",     ?_test(last([a, b, c]))},
     {"last of empty list is error", ?_assertError(last_of_empty_list,
						   last([]))},
     {"last returns last item",     [?_assertEqual(d, last([a, b, c, d])),
				     ?_assertEqual(a, last([a]))]}].
-endif. %end tests
