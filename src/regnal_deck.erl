-module(regnal_deck).
-export([create_deck/0, shuffle/1, split_deck/1, draw_card/1]).

create_deck() ->
    Suits = [spades, hearts, diamonds, clubs],
    Ranks = [2, 3, 4, 5, 6, 7, 8, 9, 10, jack, queen, king, ace],
    [{Rank, Suit } || Suit <- Suits, Rank <- Ranks].

% Shuffles the deck using the rand module
shuffle(Deck) ->
    shuffle(Deck, rand:seed_s(exsplus, {erlang:monotonic_time(), erlang:unique_integer(), erlang:monotonic_time()}), []).

shuffle([], _Seed, Acc) ->
    Acc;
shuffle(Deck, Seed, Acc) ->
    {RandomIndex, NewSeed} = rand:uniform_s(length(Deck), Seed),
    {Card, RemainingDeck} = pick_card(Deck, RandomIndex),
    shuffle(RemainingDeck, NewSeed, [Card | Acc]).

% Split the deck into two equal stacks
split_deck(Deck) ->
    {Player1Stack, Player2Stack} = lists:split(length(Deck) div 2, Deck),
    {Player1Stack, Player2Stack}.

% Draws the top card from a stack
draw_card(Stack) ->
    [Card | Rest] = Stack,
    {Card, Rest}.

% Picks a card from the deck at the given index
pick_card(Deck, Index) ->
    Card = lists:nth(Index, Deck),
    {Card, lists:delete(Card, Deck)}.
