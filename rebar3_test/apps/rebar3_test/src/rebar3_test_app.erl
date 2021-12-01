%%%-------------------------------------------------------------------
%% @doc rebar3_test public API
%% @end
%%%-------------------------------------------------------------------

-module(rebar3_test_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", toppage_h, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8088}], #{
        env => #{dispatch => Dispatch}
    }),
    rebar3_test_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
