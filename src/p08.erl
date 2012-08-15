-module(p08).
-export([dedup/1]).
-include("test.hrl").

%Eliminate consecutive duplicates of list elements.
dedup(L) when is_list(L) ->
    dedup(L, []).

dedup([], Acc) ->
    lists:reverse(Acc);
dedup([H | T], []) ->
    dedup(T, [H]);
dedup([_H | T], Acc = [_H | _]) ->
    dedup(T, Acc);
dedup([H | T], Acc = [_Last | _]) ->
    dedup(T, [H | Acc]).

-ifdef(TEST).
p08_test_() ->
    [{"call dedup doesn't crash", ?_test(dedup([]))},
     {"dedup returns correct answer",
      [?_assertEqual([a, b], dedup([a, a, b])),
       ?_assertEqual([a, b, c, a, d, e],
                     dedup([a, a, a, a, b, c, c, a, a, d, e, e, e, e]))]}].

-endif. %end tests
