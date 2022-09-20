-module(master).
-export([start/0]).
-import(string,[substr/3, right/3, concat/2]).

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
    start_mining(Zcount),
    register(master, Pid).


start_mining(Zcount) -> % start mining
    Name = "shubhamagiwal92;",
    % String = integer_to_list(Count),
    String = base64:encode_to_string(crypto:strong_rand_bytes(100)),
    Hashstring = concat(Name, String),
    Hash = io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256, Hashstring))]),
    Zerostring = right("", Zcount, $0),
    Maxzerostring = right("", Zcount+1, $0),
    Substring = substr(Hash, 1, Zcount),
    Maxsubstring = substr(Hash, 1, Zcount+1),
    if
        (Zerostring == Substring) and (Maxzerostring =/= Maxsubstring)->
        io:fwrite(" Minted ~p with string ~p from server \n", [Hash, Hashstring]);
    true ->
        ok
    end,
    start_mining(Zcount).
