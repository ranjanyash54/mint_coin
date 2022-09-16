-module(master).
-export([start/0]).

% found_coin() ->
%     receive
%         { Coin, Sender_id} ->
%             io:fwrite(" Mine minted ~p from miner ~p\n", [Coin, Sender_id]),
%             found_coin()
%     end.

wait_for_miner() ->
    receive %% waiting for a miner to connect
        { Sender_id_1 }-> 
            Sender_id_1 ! { 1000 }, %% sending back the start variable
            io:fwrite("Recived connection from ~p\n", [Sender_id_1]),
            wait_for_miner(); %% waiting for another miner

        { Coin, Sender_id_2} ->
            io:fwrite(" Minted ~p from miner ~p\n", [Coin, Sender_id_2]),
            wait_for_miner()
    end.
    

start() ->
    Pid = spawn(fun() -> wait_for_miner() end),
    register(master, Pid).