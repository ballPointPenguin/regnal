-module(regnal_player).
-export([new_player/1, get_username/1]).

new_player(Username) ->
    % TODO - Return a new player
    {ok, #{username => Username}}.

get_username(Player) ->
    % error variable 'Username' is unbound
    Username = maps:get(username, Player),
    {ok, Username}.
