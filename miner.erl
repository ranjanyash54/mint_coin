-module(miner).
-export([start/0]).

start_mining(Num) -> % start mining
    io:fwrite("Started mining from ~p\n", [Num]),
    master ! {Num, self()}.

    % start_mining(Num).    Keep mining

connect_to_master() ->
    master ! {self()},
    receive
        { Num } -> start_mining(Num)
    end.


start() ->
    spawn(fun() -> connect_to_master() end).