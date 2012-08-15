-module(p05).
-export([reverse/1]).
-include("test.hrl").

reverse(L) ->
    reverse(L, []).

reverse([], Acc) ->
    Acc;
reverse([H | T], Acc) ->
    reverse(T, [H | Acc]).

-ifdef(TEST).

p05_test_() ->
    [{"call reverse does not crash.", ?_test(reverse([a, b, c]))},
     {"reverse small list works.",    ?_test(?_assertEqual([c, b, a],
                                                           reverse([a, b, c])))},
     {"reverse empty list is empty.", ?_test(?_assertEqual([], reverse([])))}
    ].

-endif. %end tests
