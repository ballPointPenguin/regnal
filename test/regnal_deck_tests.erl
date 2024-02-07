-module(regnal_deck_tests).
-include_lib("eunit/include/eunit.hrl").

create_deck_test() ->
    Deck = regnal_deck:create_deck(),
    ?assertEqual(52, length(Deck)),
    ?assert(lists:all(fun({Rank, Suit}) ->
        lists:member(Rank, [2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace]) andalso
        lists:member(Suit, [spades, hearts, diamonds, clubs])
    end, Deck)).

shuffle_test() ->
    Deck = regnal_deck:create_deck(),
    ShuffledDeck = regnal_deck:shuffle(Deck),
    ?assertNotEqual(Deck, ShuffledDeck),
    ?assertEqual(52, length(ShuffledDeck)),
    ?assert(is_equal_stack(Deck, ShuffledDeck)).

split_deck_test() ->
    Deck = regnal_deck:create_deck(),
    ShuffledDeck = regnal_deck:shuffle(Deck),
    {Player1Stack, Player2Stack} = regnal_deck:split_deck(ShuffledDeck),
    ?assertEqual(26, length(Player1Stack)),
    ?assertEqual(26, length(Player2Stack)),
    ?assert(is_equal_stack(Deck, Player1Stack ++ Player2Stack)).

draw_card_test() ->
    Deck = regnal_deck:create_deck(),
    {TopCard, Rest} = regnal_deck:draw_card(Deck),
    ?assertEqual(51, length(Rest)),
    ?assertEqual(Deck, [TopCard | Rest]),
    ?assert(is_tuple(TopCard)).

%% Helper function that compares two lists for equality
is_equal_stack(Stack1, Stack2) ->
    lists:sort(Stack1) =:= lists:sort(Stack2).