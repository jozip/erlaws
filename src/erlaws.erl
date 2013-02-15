-module(erlaws).
-export([start/0, stop/0]).

ensure_started(App) ->
    case application:start(App) of
        ok ->
            ok;
        {error, {already_started, App}} ->
            ok
    end.

start() ->
    erlaws_deps:ensure(),
    ensure_started(sasl),
    ensure_started(crypto),
    ensure_started(inets),
    application:start(erlaws).

stop() ->
    application:stop(erlaws).

