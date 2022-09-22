-module(master).
-export([start/0]).
-import(string,[substr/3, right/3, concat/2]).

wait_for_miner(_, 100) ->
    ok;
wait_for_miner(Zcount, Numcoins) ->
    receive %% waiting for a miner to connect
        { Sender_id_1 }-> 
            Sender_id_1 ! { Zcount }, %% sending back the start string and number of zeros in hash
            io:fwrite("Recived connection from ~p\n", [Sender_id_1]),
            wait_for_miner(Zcount, Numcoins); %% waiting for another miner

        { Coin, Hashstring, Sender_id_2} ->
            io:fwrite(" ~p Minted ~p with string ~p from miner ~p\n", [Numcoins+1, Coin, Hashstring, Sender_id_2]),
            wait_for_miner(Zcount, Numcoins+1)
    end.

start() ->
    {ok, Zcount} = io:read("Number of 0s to mine: "),
    {ok, Minercount} = io:read("Number of miners to spawn "),
    Pid = spawn(fun() -> wait_for_miner(Zcount, 0) end),
    spawn_many(Pid, Zcount, Minercount),
    register(master, Pid).

spawn_many(_, _, 0) ->
    ok;
spawn_many(Pid, Zcount, Minercount) ->
    spawn(fun() -> start_mining(Pid, Zcount) end),
    spawn_many(Pid, Zcount, Minercount-1).

start_mining(Pid, Zcount) -> % start mining
    Name = "yashranjan;",
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
            Pid ! {Hash, Hashstring, self()};
        % io:fwrite(" Minted ~p with string ~p from server \n", [Hash, Hashstring]);
    true ->
        ok
    end,
    start_mining(Pid, Zcount).
