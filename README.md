# mint_coin

```
erl -name master@127.0.0.1 -setcookie project1 // This is loopback address, if master and miner are running on diff
                                               // machines, then start it on the interface ip.
erl -name miner@127.0.0.1 -setcookie project1

(master@127.0.0.1)2> c(master).
{ok,master}
(master@127.0.0.1)3> master:start().
Number of 0s to mine: 4.

(miner@127.0.0.1)2> miner:start("127.0.0.1").
<0.93.0>

Recived connection from <8702.93.0>
 Minted "00001b322ad8857ccac2e71fb3654a3ebc3d6c3b901983dbe20af001bc6b8dc6" with count 36675 from miner <8702.93.0>
 Minted "0000b530759801d767fd6f82d9803281730e71dda621e879c129aed84bb682ca" with count 108771 from miner <8702.93.0>
 .
 .

```
