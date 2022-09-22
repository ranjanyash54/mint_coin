-module(miner).
-import(string,[substr/3, right/3, concat/2]).
-export([start/1]).

start_mining(Zcount, Masteraddress) -> % start mining
    Name = "yashranjan;",
    % String = integer_to_list(Count),
    String = base64:encode_to_string(crypto:strong_rand_bytes(10)),
    Hashstring = concat(Name, String),
    Hash = io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256, Hashstring))]),
    Zerostring = right("", Zcount, $0),
    Maxzerostring = right("", Zcount+1, $0),
    Substring = substr(Hash, 1, Zcount),
    Maxsubstring = substr(Hash, 1, Zcount+1),
    if
        (Zerostring == Substring) and (Maxzerostring =/= Maxsubstring)->
            {master, Masteraddress} ! {Hash, Hashstring, self()};
    true ->
        io:fwrite("")
    end,
    start_mining(Zcount, Masteraddress).

connect_to_master(Ipaddress) ->
    Masteraddress = list_to_atom(concat("master", concat("@", Ipaddress))),
    {master, Masteraddress} ! {self()},
    receive
        { Zcount } -> start_mining(Zcount, Masteraddress)
    end.


start(Ipaddress) ->
    spawn(fun() -> connect_to_master(Ipaddress) end).