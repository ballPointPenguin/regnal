%%%-------------------------------------------------------------------
%% @doc regnal public API
%% @end
%%%-------------------------------------------------------------------

-module(regnal_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    regnal_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
