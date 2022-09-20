-module(master).
-export([start/0]).

wait_for_miner(Zcount) ->
    receive %% waiting for a miner to connect
        { Sender_id_1 }-> 
            Sender_id_1 ! { Zcount }, %% sending back the start string and number of zeros in hash
            io:fwrite("Recived connection from ~p\n", [Sender_id_1]),
            wait_for_miner(Zcount); %% waiting for another miner

        { Coin, Hashstring, Sender_id_2} ->
            io:fwrite(" Minted ~p with string ~p from miner ~p\n", [Coin, Hashstring, Sender_id_2]),
            wait_for_miner(Zcount)
    end.
    

start() ->
    {ok, Zcount} = io:read("Number of 0s to mine: "),
    Pid = spawn(fun() -> wait_for_miner(Zcount) end),
    register(master, Pid).