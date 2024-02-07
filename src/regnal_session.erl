-module(regnal_session).
-export([create_session/2, join_session/2, get_state/1, play_turn/2]).

create_session(Player1, Player2) ->
    % TODO - Return a new session
    {ok, #{player1 => Player1, player2 => Player2, state => waiting}}.
    % {ok, #{player1=Player1, player2=Player2, state=waiting}}.

join_session(_SessionId, _Player2) ->
    % do something
    {ok, #{}}.

get_state(Session) ->
    State = maps:get(state, Session),
    {ok, State}.

play_turn(Session, _Turn) ->
    % do something
    {ok, Session}.
