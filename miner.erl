-module(miner).
-import(string,[substr/3, right/3, concat/2]).
-export([start/1]).

start_mining(Count, Zcount, Masteraddress) -> % start mining
    Name = "shubhamagiwal92;",
    String = integer_to_list(Count),
    Hashstring = concat(Name, String),
    Hash = io_lib:format("~64.16.0b", [binary:decode_unsigned(crypto:hash(sha256, Hashstring))]),
    Zerostring = right("", Zcount, $0),
    Maxzerostring = right("", Zcount+1, $0),
    Substring = substr(Hash, 1, Zcount),
    Maxsubstring = substr(Hash, 1, Zcount+1),
    if
        (Zerostring == Substring) and (Maxzerostring =/= Maxsubstring)->
            {master, Masteraddress} ! {Hash, Count, self()};
    true ->
        io:fwrite("")
    end,
    start_mining(Count+1, Zcount, Masteraddress).

connect_to_master(Ipaddress) ->
    Masteraddress = list_to_atom(concat("master", concat("@", Ipaddress))),
    {master, Masteraddress} ! {self()},
    receive
        { String, Zcount } -> start_mining(String, Zcount, Masteraddress)
    end.


start(Ipaddress) ->
    spawn(fun() -> connect_to_master(Ipaddress) end).