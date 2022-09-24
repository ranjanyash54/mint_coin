# mint_coin


# Project 1 : Mint_Coin Miner On Erlang
Mint_Coin Miner on Erlang using Distributed Operating System Approach

### Implementation
Group Members:

* Yash Ranjan ; yashranjan@ufl.edu ;UFID: 80764190 <br /> 
* Piyush Singh ; piyushsingh@ufl.edu ; UFID: 5092-7342 <br /> 



### Usage

1. Commands to run the program
* To run Server(master.erl) instance: ‘erl -name {serverName}@{ipAddress} -setcookie {cookieName}’ <br /> 
* e.g.: ‘erl -name master@127.0.0.1 -setcookie project1’ <br /> 
* Compile master.erl using c(master). <br /> 
* Compile miner.erl using c(miner). <br /> 
* once you have entered the erl shell, to start the server: ‘server:start().’ <br /> 
* Next ‘Enter number of 0s to mine for mintcoin : ’ <br /> 
* Next ‘Enter number of miners to spawn : ’ <br /> 
* master(server) can mine coins without any active miner(client) nodes <br /> 


2. Distributed Implementation of the Project: 
* Start the server using the above steps, then create worker nodes. <br />
* To create Worker(miner.erl) node: ‘erl -name {minerName}@{ipAddress} -setcookie {cookieName}’ <br />
* e.g.: ‘erl -name miner@127.0.0.1 -setcookie project1’ <br />
* Once you have entered the erl shell, to start the miner(client): ‘miner:start(“{ip_address_of_master}”).’ <br />

### Work Unit Generation
The string generation in our project for mintcoin(BITCOIN) mining is an iterative approach where we are generating a workload of infinitely many strings for each process on the machine. Each process will be provided a start number and then it will start generating strings consecutively until 100 such mintcoins are mined. The process will then return the cpu and run time ratios to check the parallelism of the program.

### Server(master) work unit metrics
Here we have defined the number of processes to run as = No.of Cores * 4. This ensures that all the cores are used efficiently to mine mintcoins in a faster manner.

### Client(miner) work unit metrics
Here we have defined the number of processes to run as one when the miner connect to the server. We can extend it to have multiple process on the same miner.

### Client(master) Server(miner) Architecture
When we run the code as server we run No.of Cores 8 ^ 4 on the server to ensure that all the cores are utilised completely to mine mintcoins based on the K values passed. Since we have a fixed workload, when a process in the server completes a given workload, it send a requests to server for the new workload. The server then allocates the new workload for this process. This mechanism repeats itself until the user manually kills the server.

When the client joins the server,it requests the server for ipAddress and the k value. Based on the workload and the k value, it allocates a single process for the mintcoin mining in the client.

When the master or miner get a mintcoin, they send the value of the random string and its hash value back to the master to be printed on the console.
The master and the miners spawned mine the desired amount of coins which is 100 parallely and onece the achieve the amount it prints the the hash values and the strings.
The program also outputs the CPU and Run time ratios as  mentioned in the question. <br />

Note: For every input of number of miners to spawn we delete the queue that stores the mintcoin for specific leading zeroes.


![](images/Screen%20Shot%202022-09-24%20at%204.04.45%20PM.png)

![](images/Screen%20Shot%202022-09-24%20at%204.04.59%20PM.png)


## Assignment Details
1. Size of the work unit that you determined results in the best performance for your implementation and an explanation of how you determined it. The size of the work unit refers to the number of sub-problems that a worker gets in a single request from the boss.
* Solution:

2. The result of running your program for input 4?
* Solution:
 ```
 
Eshell V13.0.4  (abort with ^G)
1> c(master).
{ok,master}
2> c(miner).
{ok,miner}
3> master:start().
Number of 0s to mine: 4.
Number of miners to spawn 50.
 1 Minted "0000a11438d9f78aab24680155965572e9c37b759b2b77ed3be1b81b61b4dbec" with string "yashranjan;4UlSeWmdkC9taebROrYm4NvZIEOMUwIBarrUhZCRPcDpnpeZMrXsLT7ue2dC1ZqDH9ENiEFMTuLwlIp8AQEMi//nhoe/Z4uJ6+QJPaStEbvA5kffnEtFVM1pg4WSkqq1iBnBuQ==" from miner <0.122.0>
 2 Minted "0000185ccabf2c47f143f297d8398cb4c706e48069eca1a89f980831fbd9d129" with string "yashranjan;ZjS64j6iOTdb9NWJTObvRjOpOnngLvaoa2i6Bod4jzw0zvN4uFqhnbhMA6fOY2389ru1ZKw6PAh4/aCgA7k3TUfouLuaQKxvvTkGoql9zGFIhJQf+9sjr3uC4vX85coCSn0OjA==" from miner <0.112.0>
 3 Minted "000035457127c4270de652ca6550cefb74f95b01666f33edff6c999a649e35ee" with string "yashranjan;gWIoMKd7UR6gjuKk05bbK4Dph1MndhfCL0keQxySICNqCm60dsY7Y20L0hMyDCGSj7XaqqHBiLv3PLn055XR9YoYxDtMxF4ivalxEIVW3ThT+Nt4bsBBxpKmz59c4obOIiNFog==" from miner <0.97.0>
 4 Minted "00008091e0b77d255f586120850d6d6e6cedf56a38bce8f32871cbde0f786a41" with string "yashranjan;iHAxxKx0JyOL1x+oD7BIG3GUSvqTlOmN6XAvJbe47jh8mu/ez6hJp4wo1VlJcr2SikKOcBGspYjmHl76hjxbX4Yy1xGVPxNG2QcKpUXaUpnwFbxHiKvNAPv32kr7Cw/WWOniuQ==" from miner <0.95.0>
 5 Minted "00002cdbc8adc53b186bb4e7d3313a24fa358f94de31819e4ca5ec394a27b7a3" with string "yashranjan;2HaoyE0YP+DNWoiEFcgIiMwe41dTjI05fqRN7CI0Q695lL5SRcVZfPAvlzm0T+WpNBKskBdC99l02rozzW6tlr6l7AoAm6Cw1MFdqGR/gcN1kCcWVEOl2lqP4W7iBjEtBgwEdA==" from miner <0.132.0>
 6 Minted "00004c78e6f2a364aa972838ee515a6ed7147998d8d8121e95f5c77c9a4631e2" with string "yashranjan;OP8p946v9IT4UCKdiyz3MemJp5pR/Kfkoyog6fGQhGrLKaegxSJznHPu/SHfPT7Thz0ppjUxw8cZdb5SP/da9CwXqNDYMbuCv5+lFqha3oIEwfTwR2NwVSEjtbW06iUSqwn3gg==" from miner <0.127.0>
 7 Minted "0000d1a794c78dff9644e1ac8001d63c6ec6b2b5e2bdf8f786a17b6248ba33ef" with string "yashranjan;KhwMCCY/jErsR4CRPjUfFNqglVOTiKJAN9BZQ85f66+XK65ahHqTK17HRaxrBNM5u0OklTRDf2PZsoENz8455tieYaW1N+Y+ipqlTujLweyEEPgZGQhHGqgsgK6pTCeDAqi7Bg==" from miner <0.134.0>
 8 Minted "0000f0efa87159c87236510d74b3a4cce9f358e1479dc9b9e82528f91a3120fe" with string "yashranjan;0vZnCase5f6bjEVYOsyQEoQoD16XqimJgsKzpcfVM2N1fkKlYrbMouP97XvZ4xINC9VRKbU8RGHuX/LYObWQrFUloj2KXzt/xh2AFjwG71O5RK6BFdoyma7tYjFl776/TVrOBg==" from miner <0.99.0>
 9 Minted "000094e0ffadd5b4d40b4399913796c3b841c3c6518e7e8110779549638dfc17" with string "yashranjan;PSuzzzc0PTwZR/5zzROKPd6Ho+5kfABG3AN8sDSqHeMEl97618Tm+BvDGdQuOIV37zM1VVQoYNos3UbALciACIxG5+How6HZQNaOnoaLkozCsis7+mxS/oJtqF/j5dwP/YNPrA==" from miner <0.100.0>
 10 Minted "0000532a4fad9d92a3b54cdb92302e67b10217af42591d36fce52ff15fbdbb35" with string "yashranjan;e/e6OMXAlVBZhM4DX8DTeViJATbcHbQXTr78ANgueyp3nG/WAQUPzaf8F4zanHqZ/+KX8PBRfCJxnnOHBGcpsgBrL4L3LRFGptoL+mucNuto37WqWyfryvm8BxwAh+dtYaCcKg==" from miner <0.109.0>
 11 Minted "0000882621beeaea3bd6921edfa18958a51a74e8c1281a532d0c8d7bc2623927" with string "yashranjan;eGeNlVxiUFP9a6VIVqy3YRgf1tNbpMwPkZh05DbvsCTsmlUu5P+/9pJR1zss09Elm5LeIAHYRv2fDHSCi5E8AyZzRXj043+cUr5J+IKpFQTZUCpiksqeB/3YyiWQUpJtPRdlUg==" from miner <0.126.0>
 12 Minted "00006a589c34f0828c0524db409a1cf1d2042f508fa81d8bac82e200551b4a3a" with string "yashranjan;ksNQITyVHk9M6PtUDRPBCzEeqvCBdcM8GmlwDrJvTyquRh3mKiCm6gzphoco/htG/clQeTnFnO1zU0QbJKUmCfm3Ir4VIrjdY03I7phqu8/NbG5BOMzFJKgZiFfur2WG9LjOkw==" from miner <0.131.0>
 13 Minted "00005d062588ef77b0b0b1752114d881bf7d009f5841ea470ae883cb9835c4cf" with string "yashranjan;VyaVekj7XqnrfgpjGJLhhRgQHAjhyegtlzKXEeLTDh7wDu8HPmPha0iYvtulB2cf8PhhhrnU3ShIdwKKhNUf2FBA5OMH282Pk6ezkLU0tGKqSHoZbGBT12CVZbsbAVPw7tpi6A==" from miner <0.109.0>
 14 Minted "00005be617e54940486c448f0fb4e33a9e1937063f34d9af593933945887a78e" with string "yashranjan;boD5AgcW5Shp7qdVh3rQuV6i4wkXuq+xpIPpKfTH7liBC/wfkfyp2c4TF40mN36+V1bmBDzJBFet+VOeFK1bG+7K2BDd/9H6SNsREeTLBQFN7s0xk7BcJlWyGv6S+HaRWwUbQQ==" from miner <0.94.0>
 15 Minted "000071d8bd432a666e32fbe0bd1b0dc000b21df3feb3e8db9670c091433bee4d" with string "yashranjan;AHx1aPkcydqITpJfxwHhltFimXSVXYRdt76k5+Gtbl4sb9QTXoRpOLg8ZjKzGXtUV9w4xPjCQQY6mT73wRMBSLQWHKzJlXIb5UHE7w11cQcoTMKlkcyVBsuUdWUZ0wuE3Bcy1A==" from miner <0.120.0>
 16 Minted "0000faeaa8fc0709a93d19a61ab2527804b719e69b15d0bc9f532babce0ae948" with string "yashranjan;wkZNzjiCCWRuu4mPFMqRDlv2r/DPQOLjNOv08F8/kLNou9dHaBb+b8uQNCC+dQTr4BIXF4H79IDO4Q3pu7zTBF5U3Y2031AMf601UIAReIFMIfJCCV/XXJ1dznCgMo3zDHb1Vg==" from miner <0.125.0>
 17 Minted "0000fcf909d098ba29b0b45ac99ff3a80074db9b8c28af5e4dc465099adab1ca" with string "yashranjan;21D1eHISEux675DxSskxVoN/HXBri/6Jk6ROpCe66XKuPSLor3T7xETMcJG3m6/JsNJB38o/Wv01XoewlqvrSFRF6bg0+4S0nuOF3H3tjK0UgXnCv4aWXOOWbb8iMwjYRme2Kw==" from miner <0.115.0>
 18 Minted "00007bb45df58ab013bc3c7c6daf11c34cb924342d1d5c80f316b39e7dda4d61" with string "yashranjan;MS6oZcwA9Vyb8GVmzR1n85RPk2cL23P0vj0b2skeppR8w7vMhz+iu7c9mSPwl/HAxWqJfKlSEIIWvvCr+g94EnjRTiS4B63V5wmm7XsbEeWka/gcwLPaQxvZnuhzLlrF1EszpA==" from miner <0.119.0>
 19 Minted "0000c5210bc6f52f7e631b4621e9ae401c6fc3d7e7da79dde04703ad05b5546c" with string "yashranjan;kSuAk9Cgj1O99bkRI73XlLjrCZRCwpqTRn0+HuUJLZNOTo8aO/v6wDhG1lhrffIokRRyr/EIdKJwVRWPwGNI2G7zgKKSfXSmOIc76rqDfO4VQjt3b9oLZPwE+f1VjckO+XX8Ww==" from miner <0.128.0>
 20 Minted "0000dc8d589f2249eecea9fb55942c8c920f3d4064fbdad45d721e879f943d34" with string "yashranjan;ZFvCKsSFmdmoPc9H6DH//40U3OurRH22MwmqFwpwp71iskn/DHFdNJBwHpo2IV1gFud3HOKdttshF7NYHQUh3qUzehCIkUWKRjBqyTamywbh6YcBQMXtxKAz4ubLd93ZXFuqIg==" from miner <0.125.0>
 21 Minted "00003760971f5db61c9f2762715108f27e158d2f050bb27666986f94673169ad" with string "yashranjan;5jTg5pepzDm3ESbCVPeqsQfKmdT9fBfG/eb9nUJpFUrGY/g1x0ZoNIXe/tiLjeC+8wYmJaNGcxEGs9EU9DvcyVPQQGUJ95ogG9v9bQlsk6euF7BUQ2DLy4FJQqMIFkgfonNb7A==" from miner <0.133.0>
 22 Minted "0000bd9457c5a02e17871fe536018dccd8267b9e8837964c6ebfd1c7afee57dd" with string "yashranjan;0prgB49/oG8iF0e3kP/yzFWqUw6Mf1wMCOTBx7smRHh60914UhKdcoezE2FjvWY0IDKESFphtOs47sDGSlf5f/I7C/ehFUNZEzgZ0jpiowiFgXB4n5yfCULaM+2k5R1/6W5aZw==" from miner <0.110.0>
 23 Minted "00008d9eb30353a982941659acbf5197b05112faa177ad62356d1763c8c8adee" with string "yashranjan;qa3F6T/yJOZJOsB5YNk0J8VRMNyRIeF+/HJlHV6yyqkDntxTP1vVwyAtea6zIyNG/isVjkxCIMM7+azPd/FUJ/D6hGVZegsd8ROMKGndJX7rT2rEgKGnGPfBotuTLI6kY5VspQ==" from miner <0.141.0>
 24 Minted "0000ba290c643cf43e4fc2654132983f2da74db08ca1e0967ec590903eec8c55" with string "yashranjan;5J1YVAEWXJneoxBOLCBD5zvQVJgp4ET0oalLSmFOyAylpMCrlM6J40kq4FOKHR2d3oEvjMR+UadFHFAzI7+ctNQoKDvsvkDeBmGQ6ec/rQ/ohyE5QW24z9OMMx6bIv8MtGCDEQ==" from miner <0.100.0>
 25 Minted "000055e041a5adc5b12f7d2f8abf725a7449bc7cbbd01bf2150de4f28eb8855f" with string "yashranjan;nZZJucaDI3Vw7DL2aCfK9xcJPo0fG9xqnCz1icPmkhT1kZc7KHdbExA4X+34/y4wzGnKTxDUU2oM7l8nucTZw+Lfpd48FvNsU/Korq7icG3EPz1zp+FItogAPUZTierqx5KlMQ==" from miner <0.99.0>
 26 Minted "000069cda741436316dd22d6b306503ba5e341265ef686574641f522cadaf6b8" with string "yashranjan;CJnEml5Yn87rUGbN8xQ7QOfFMw4oX01DXXQSsvQI2rmMl+u4ZONgefHexGg5Blqx6DqQ69HMico67O5/X42YC+iMEFqcl2A4m3JHcgrqUCZV7IDl5Qid9fwXmQxd0shfwcixkg==" from miner <0.108.0>
 27 Minted "0000a8d9d69585f2231820f22cc3578ab175c4300e90992debabd4bd62e49160" with string "yashranjan;/qwTI1ETXFfJH8OAJBgM7i9I7ZbMSfqDXkCp/NwQV6aGWUdjicMhGtwlbnoZTTrKmAA/xxNgrSiq8vMDiJ3a+8Aj4Y/mYFV0/ktUN7Dtrigx69XTaU68zs8oNaACFoamSFNO0A==" from miner <0.127.0>
 28 Minted "000061cbc4908ba044eba35c4a4fed4132bfa4b7924e65f3ea633ba481352be7" with string "yashranjan;kxkM6GIiUeyQE8Xl8zr+bdpu+ZjEeT3dOtFhyhBXbjOYixgPmRiFnOSIJ6E4vlORwQs5OQ2o3406DXzrsM2gLLNME3H2fWmd6dT+mxgXk0R2cDi4sS8dNEVer8YUjGcJAQZCmA==" from miner <0.136.0>
 29 Minted "0000b9b8beae76090b9db6c0a60eebc4b2c148b06f6f0fc4eec9557d06462fb5" with string "yashranjan;f7Pwcze0eGo0mIqj121lTB0MO4K/GG2MMb1HaiOVltrHlgMaizXLhAJnelboXQZaZ1LpM38hcv2N53JPnEOz8GQPVzenciMNm3b9CB2Mu4zHggAJ+1ySGPznVEK0xOdjC/VG6A==" from miner <0.117.0>
 30 Minted "0000494cba5577c327853ddc799fdda5ff81ab1901615809f8e75e53c22b9398" with string "yashranjan;C8PuuGD7xabhW3zQeIIyyb8XKQsZTnJyKKFmvsE2J1aGUCqtO705p41uRq15XJOSSBNbJ/lk4ogfLJKtdn2AX8WlCSHFmKPII0SQlmPHJmNYz0ivmhbBtN2MW11I2bBUD0vLuw==" from miner <0.123.0>
 31 Minted "00009ead5f115f86f3f0af44481943201855418dc70523704b04e32157836f1c" with string "yashranjan;mVdtT73EQo/9BrXzPPjB8wT5bukKglockPp+gRRv5CrV7eyNacR4IHGkyH/MCNxK26f4OUCiB+zyRBvOaPYK3y2BtyjHqlx2eIWtMBa8p1iIs5xv/5+Eew7dTQ2VheRKdb7p2g==" from miner <0.94.0>
 32 Minted "0000feb165c02e4777b26e6bf25c7c319e625651e37d9c515a5b9ea1c4994537" with string "yashranjan;tTlMB+PsKrVDOY4gCzFigBW2pcBDSSzAkcgd6atOH6UXzCmFs0jaxWYEvevrhyiTC92k1drMH1NXHcd3xlK1H8VG60Zx5TmFR6BVBf/WuurRIjtYEf4dWDs4PJOoVsn+CQRuQw==" from miner <0.102.0>
 33 Minted "0000ff1777cb247ee37bf5894a50a0f29a1720d73b0334b036a3f945a21b9c94" with string "yashranjan;3DEz+iBLsb1E70Miozdoz84xh2wD443yMHNlKJeTDMzmJuVc/vcTTKx6e+/Qf6b4lP4AGGRM2iLelQY2+Gc9h5gBgafgp9cCMtYzbqeYTDreECeldd9/1n7S2Jx7OoGsmAuQmw==" from miner <0.140.0>
 34 Minted "0000e2d6a8945edf091dd2581098b3a6bbfa9d1f8da628d46c79d194f0b30179" with string "yashranjan;hOggCOcpGcSYdHutJ3y9cn9qfT1MN4fT1+cPyPS7kD0uvlvcZn42nv+3nk74CxzpmCJHzFYJzK0pzo308IHbEz3tyJb+HrnXOWgNWkKuQtkeKVJOHWQVYKYRNEvV14E4beR12g==" from miner <0.133.0>
 35 Minted "0000b2fb643ae615acf907377ba7eebe20902e3ddbfa8949d66ac5b3bf2a7403" with string "yashranjan;ZCwFVDzBchYwQOYtc9veBZGvidSjAOXtETEoIVCU8v7ROETTlMvXuLTN/ONGtoh5Zny5zIoqxfvqvnuV5PqBhd0VrJ0h8OleIkXyClObCUlrGX5Cfn/munlMpc3dlZjO0HN3pg==" from miner <0.119.0>
 36 Minted "00001e47448034154f2c04b71d9f78069257f6f30c04c5c91a9427162f911489" with string "yashranjan;xWsP2cFeSpy0UBp+5UNBL6cvMlakKGO8jH/fBR7qc088M0HfvHtMi+cb98lC4nz9YVCZ9HwNb7yxK4xLi4LcZbNG4/q3DKijlQ+qsvPu/kRJOC2ZLFBhCfW3B/UY11cV8mVtbw==" from miner <0.99.0>
 37 Minted "00008a3b60ca120d1a742300ace6374a4a57495dff871e11e9abd6fe91a0fbc6" with string "yashranjan;lAGc+0V9YKUBP5baHeKzKQYGhFO/Z5uQz6EFm2vOfsBChtZMrpbEuDwt5SmiunLUDj1La8TMVz661tgz8CTS2wdkHcix8B13WvprG0zSAp1rVase/Lzy76SuAmgqaWyhdPjoWg==" from miner <0.119.0>
 38 Minted "0000bd5adc9f57ce0ac0e5b96b66c7e715bba28cef0fe38aeee7447215ff64fa" with string "yashranjan;U7s74sUtlZv0L7uos+kPjgDU4xN3nwPHQyPtv4XWIs4tdZ+nsOq83WwCFNhKtEUGNRpERYwDbTCfRIo2g5MjfCRxQPzF2DUmdAHqhyiX8e5heLhK4Y794QAOlA3XjpRwTV9SOA==" from miner <0.113.0>
 39 Minted "0000f8e967a26eee0b59446bd3244e1d094cc62879546eb6487c983242ccc7f4" with string "yashranjan;xOwC7CiNVYaOATL9zZL0ksIJxTrC+DDJ/EiBXWhkOJQEv2FLMs9cRMCMVDxOpVYeHz6b46ERWFU+1p/muug7ik/BDzW1Pvtt+jjAvrVyvPTE1+C08dNcEBvS3BtF+mW8pkStKA==" from miner <0.113.0>
 40 Minted "0000c8bd52ab55d38e3ced4d60ff6f6527e9f1d8f2d970e343fcc3af1606d992" with string "yashranjan;2Ww8biCVhwkgf4NBOBIaaM8Q+ibieo7Dn6U/fW08xi5B5a429uqxsDNap16Htg1nBNezIDXFTKrUQw56cKKFGE0oMnkBX7UWcfMEwZ2LFnKfKaArqJXIKNX1QI5wmy6kezaPwQ==" from miner <0.96.0>
 41 Minted "0000956f60c1ed8d5858216c1e87e5c16e496ac57be916fd824ff91109759281" with string "yashranjan;uJoqgYvtDQ3Urhuh5g6sR9sSODftKrol7H8O+g9G9Ed3CgrMt2ukBKDodIvPIQj54376wgJL+QH4xopOefrI8e84qojy0hnPSFdJjR2SsV7PtEC4uZ+lDNSg8Ome2sIxKRzYvA==" from miner <0.129.0>
 42 Minted "0000dcf30d5c4849d915fbf29eaa9f01bf9498140161a9d6b196219c42f12b0f" with string "yashranjan;Pv4LHMI7OLJ6hi4iB1WhHddFKolo8sEE/zmzWLiSjl4LyVD7HIIiQUK576goeeDum1t7UDn/bN/U2fTLsnjWYq1+hyJTmnTfdDGwaFmupj7qeXvhYqlWq/F3o95d5QXtdGyXCA==" from miner <0.95.0>
 43 Minted "00001c08c1c4a00e1bd2e8cc78d3ccd32a1c90280c22d183e8151fddc8029c4f" with string "yashranjan;+gQjz4XDAOWii4Tganyvw/oIinWzUkJYVTR+hjB7vR83C3Dgmrj8MXJ/14I30qKNc89xdp3AYyOGt2TznZff1LFSDiup5Bt/cdgrQJhvlQRgmmIk1Pe4Q4RXjH8Zqbuvrhimdw==" from miner <0.122.0>
 44 Minted "00008af3430c0494e8a94f8b2ad4fefdf4b9542ca7fa6697a436787f502ec45a" with string "yashranjan;k6pAk9UMmm3CIc0m5cecrqkjFTht8RAd5Oixd4YDiLwivZVB5WYDE+Va+a7GNEsjjTeCt/kAXO8aPQpOzjEgUjGlm7YVebOoprlfv6vs5XEP7oRpZqKcLnx9uNnyeaxiuyNCDw==" from miner <0.136.0>
 45 Minted "0000856ae5f0bfe5f2083e80500437dc771ea677593c6a8b3668a246c372f783" with string "yashranjan;mMUsH6iUFhBtle8PBMFZKOUbVS01Ix+w3a9Y1brmSD1ofqCgwK0c/zHfgwM545RV7/zKG40OPr82wAnvXRlv38+FWNzi5eSnYD7xEjzsp0stRInJjKedd6bdCD/GeS37iOoRSg==" from miner <0.135.0>
 46 Minted "0000d315341158dbc4a6b882d65be09c327b7dcf2221d714621f33a0e7f95018" with string "yashranjan;MbFr4HDG8BMFrGTnBqzLcw2pgsLAnV9LbjBGzW862WYpbPsRKpab9Qw74JXUX9biTvXSAwdQDTrb1/PL4zM4uRyWiowNJ59blgqdTa/jX6ixS2InBCdwrZeg8tRP2Zvm4cIdlw==" from miner <0.135.0>
 47 Minted "00006e15e2481d20fc722cd03d5563c34360c1bdfe3e05f2adc9253b88ef2cc2" with string "yashranjan;DcUbTDndtw+qbJVhLNzavqX8bDosERJz0Xs/cvGvtUq1iAmSCc5BaVnIm1FOP7yRVMxdC5gQfsfgib64p6MsWbf+0/XnDbc1IC71bfyaznlkv7cOb+eJiHdx0IMWFmdrFo5TSw==" from miner <0.122.0>
 48 Minted "0000cb67ad31a43e1cabf4207fc3ad941c221eedc309c8b2867ba48432ff70d5" with string "yashranjan;IAPGgTkGOPRFwS8YVLC1fkA5b0nuyrhzCBp4/CjCguGUSscxjI9nvo3DPncpkUCl0fWJ+4dZY8bd8Oedo4szCeE4Ms2gYfsFjrZvIsqfri/VcU0MOyrd+sylgedIduCRZSnynw==" from miner <0.110.0>
 49 Minted "0000ab205fed01ed4a4b961549307a59c1d4740e2f3b304bcdb861ecf1c7d209" with string "yashranjan;lYi2UxudL96YxrRwCcPtQroc/DbbmKnnbtvLzcLI56l36zwlo3K8TGXwBtriZ9tVkN5uem4mZo1NdB5FeEuWI2IyJeilLMXLpuCA4KCTd3+07l86F5mAOHKiMbgKLTyZj6O0gw==" from miner <0.131.0>
 50 Minted "0000b399b9696131d27ef93788871e259429756d9e4d6349747b0c0af41e517d" with string "yashranjan;354Tuyemq2Gl8dLzN36lO/j8C7a2vkhdNKMIbIlc7kH4+AHgvSzwS+pRx4urKEcEDZlmhtvowqvpTG8yoHOob+BkWGshLwKQ9l8GDjcf+3b7v3uieAvrEv/jcngVjOXFo/X6yA==" from miner <0.111.0>
 51 Minted "00003d03a3ed8cdc42edc85701e0b181d476f7a7fe0809a68502cb1f1f524580" with string "yashranjan;GFXulhBxeoaDPiu0m8elSEXVIy5c79+4zceHqfyeogkrz5Xwcq/Y4e9pZOYeKaYd42nTqpyf2UZiH8DUx3odjYyMtUkDDUdlSfMfxTjyJ4b/yrPel+ZLFgLEHvEwY4ZR5Inx9A==" from miner <0.115.0>
 52 Minted "0000c7296e889a793c7a33656cc70e9cd8e9f5482e7bfc9494bf7cb73cb9798a" with string "yashranjan;5J2VWF+NN0HN12SxqyRQwS9L3Ag59Ew7NUuQO5tqBs6BfgaA7wx13lJSpvr2L2JYC6r43S+exruB+laSxu1UPUfZuc8N4tllCz9kd3NS7sHafxF2cUxPJNkVDhYdgVI3DN3Pkg==" from miner <0.132.0>
 53 Minted "000060368ca1a455f26e7f94acf6b2d7fe513a4cd644b8e4b146ea2709f916cb" with string "yashranjan;V7V04hp82LDJRTv7IU7+8IBFRgLSUIzCi5R1nHxTO5mbZISk0nx6G6B5wN3TD/wNwcB+MVbGimb0W/ltWY+f8DHSKhwvu9CfimSgzBc/nNJ7y8GhIvPnxFUs10ZCb7RUpSgGyA==" from miner <0.101.0>
 54 Minted "00009f1af5eaf01e31c9498409138b3043759cd6c6da1b73b2843740b9199c6c" with string "yashranjan;1GxAg4dCaHHkmXTLBU+T0bAbooZRtbcHLdz/JXE1+LTprJpn4qw25qgzf6eaU6L79RxTOwqlp0Aq7ry96mzWaRK0I+H9wIkomA9UoN88BEjjaS0OxlOp52GEZCoKYNTAZj66XA==" from miner <0.117.0>
 55 Minted "00006636396d9cd8b4ef674fb66927351b5d789c28b2a9e3cc804f2e231207f5" with string "yashranjan;qtIkEm+PI754yqtw9BaEkbS/UkL/C6B2Konfaa5ILIVPqjcNOTLdjo58FQPQF6blHLaVhK5Fgo3btIm422ypoIKL7QoRNZCtoBM/X5kFvX6EUZ20Rc3f8sGslw9/S/sF6Uex8g==" from miner <0.125.0>
 56 Minted "0000188ebf3ed1b968c1cf0ae0da078bf73feb89f28267bd209f075ee5d45545" with string "yashranjan;Wa54PPioXeUPF6hxJjq7aSvLWy53kvZFn0Ex3DRSOC1O8SQnG0GJj9QSQX1URvpreQ7klT1NEp2S5W3flzGzTXlfnREtncqfjvTZ5jH9vTSZhBlw+M12HBy8g/QyoHN0RTHW7Q==" from miner <0.125.0>
 57 Minted "00004bdcaa3a6b12cd0c38399c369fc9783e4e0e84b1e54d85f63ab8f5f11d98" with string "yashranjan;t2XQIwcraHU4NfIa9iAAhIh5AK8GnxEq5ToQA8hST3TMNfo6BgtYJVNK1m8t4hMibvQLaXAX4mtBsz7p0Sq0rdg2HM3+RnJRBPepCR28BrZEIVql0MqDP5qQPQrnsbJcLbhTDg==" from miner <0.130.0>
 58 Minted "000053cd636448aa72c859aa0b94c1ca8bb3726a42356af9a564de122d907c39" with string "yashranjan;nFdJCrIi15H0XTsMkp9VL/m62mMNqBO7QVC6/UTtRX9zOZt5axCMVWnCDUnzIkM01ZW4moXO1Rlw09Kc93lKtaQ/2mKEbeS6QvBjH0Rs0ySrdNzj1U89ImrXvzUHVYigX3AM8w==" from miner <0.108.0>
 59 Minted "000072a7ce6eb6c9e1c6017c4f744e4265a213221268b59a4a9edd5556741bfd" with string "yashranjan;0vZziaioX0eyNcZv8BAwGUVRybju3nU44Ak7NAUgwWhhAGYj0kkKjD+dK3fyR5K19E8YXF6jMNTSFRVJt4SnA16Xv0id+VKPfFNuycOJIGd1GAgRIWGcgcNxMgF/kue+QCu3/w==" from miner <0.104.0>
 60 Minted "00009478bdf35e6bf20f1f404267e8f90e087d140f30b9011dd81a4dcd810cfe" with string "yashranjan;JMigig88L4+jmc+ncq+e5c4Idpxvq+CeIIOupaWN94B/OtqppXz6ou0wVFGh+0dPmUcukBOYWNEKakw2tUz7gAAftsPUvJOYzTTTvc4pvoHvtMwcNGh+jgKcmAsz2c7KlrAhxg==" from miner <0.136.0>
 61 Minted "00002d229545d364c7f764ee17ecd37501a1eeb91365ea7fa7e3cbffd3f6213d" with string "yashranjan;rTE+1L6QvQbLqp7RuxXE4luZy/cegTd2dmuspXHHL+UlAO+DZQYuS1mTHjqVoquhSCwy19Vnljjo4dax6bTSb4NTnHpI9kXPDlR8pwsVHfIFf4o9ImyYDO3rKtVAKto052h2dg==" from miner <0.135.0>
 62 Minted "0000d37ceb7b2eb65253f811c8304b1af26dd1904c1e24792ff848a872c3b223" with string "yashranjan;CIbR35FaozD21xT4P1/ZxRHxcq46dbx4p20Y47OHJAOzne5G7btkdMp7qZXciQRE5nCbnjlIi/CQPTguy29FT0FY4Q+GNvWgQxe+LKG9ou/JNS0M/WGwvY2+XpDa+BDQk12pbA==" from miner <0.96.0>
 63 Minted "000041b7d64c9cb8f43223f64facd0b333e7ede17c0721299938fa297bc5d2cf" with string "yashranjan;ZB9A8S9HoCqO6gCnXjlAUskrI0jCNG/vNyUBB5yBCQuDgZtqRTu00HzDg1TW82DnYrh294IgslLqxxlAtNGdGrA6jjqAXWi1VtaQfVfA++hTv8QlFsPQ83qIMBlSBiak5l7xSg==" from miner <0.101.0>
 64 Minted "0000169836cb2786720dc6636431bd7e61c1ce395fd14afa8ecf32ee590b756f" with string "yashranjan;4FSQbXknFZiQOs45SWcvElnQVVCOW5pM2kVB0QQCBDWo70pm6gD4aP+3z5DT+TlGUGSd9ZeQsJESTPMYhj7B3DoOc3QDXroE6PiA4q05xsFcgcn0mgSMY0v/mP5BkuBVLjqHiQ==" from miner <0.132.0>
 65 Minted "0000a14a4428a33fc738ce7acea3d9cb512d3b213b56e30947ec8af668294c70" with string "yashranjan;NRQykg5FaOwFwk7nJp54yeRvDfv/fFLY/TJb34TfdSBTO/LWmf5qpwcXWhdW9Jl1jwCp6YTkqDP5r0MskO25fO07B7/RZo8E0h9b2b38VX1UPJKcASf8CsCf4UxDDXqx+0uknw==" from miner <0.105.0>
 66 Minted "00009e9d100fc1130503dc6ce8b10000294ffe3177141e17f3044b34429aff78" with string "yashranjan;xKDIsAT2gPTdy4oeMxE6zbTUqEkgWdrydH9tmJeRlboLhpGDvNIS1DiO1DRm0q1EHiTSzsxLpQD46SEJsovtoPDoSU0bDTqU/BOyY6vxPXm6LCIo81Hjp2S8VPsjoa4H8mjmkQ==" from miner <0.93.0>
 67 Minted "000085a4c4af1c98610c4de97cee0425466b24e8ca7bad52b47197309c9cbb45" with string "yashranjan;cA8VIL9qydzONPj0PzeEpwfk+QphJYWhmpf0P/SCQivkKOUXZ2cOx4tmjvoC6/0eyqlNnRn4/q2GHuii29A9XBpuPpZ9vKpAEtLEsBK7vcLgznhG/ruLtdQWML3vlIWt6y//Fg==" from miner <0.130.0>
 68 Minted "00008a91e064bdb63551fb210af215f072ca34857155266a1e703cafd3323d51" with string "yashranjan;SbrTUkGRkXPtFlQ3EFhYQZCumXqn22vSYQYJClJn1PFZcbF4Wlem9lzMNO/5vKcreyTcU8Lzdb46jErBp34tUmtcHkNEk5jp462iu7ElJlynDKXNapxiHxlb6xu32U3FRQhCPw==" from miner <0.110.0>
 69 Minted "00005c2a66b61876ede20bb991deda54a3bc40e4629a70569d14698bbbc6a047" with string "yashranjan;kMI3whju7DexI+0D18XMf4ZM4rACHECK2ZKj+h2F94F4Mzbrw5tVTe5NZfAICOCrA9OC+93r6FvHnukxWYt9c++4jfiZ6tsg/OEyHhL7qE0slDqdCvQSG7siw7Fji0AOKY2ZMw==" from miner <0.107.0>
 70 Minted "0000fcecfc324ad64abbb3974d6210baf2505bbb794596ddd5dec9092ebbcc36" with string "yashranjan;Tl0dSTnhkjQJvZln3vqjQtNpkVyBYfjBWix+rbjf/MhTx7PvuZRFaJso59wihsSzuC/rO85yM21UJ7aY6v9Z7mSmEMOfYmn5C3xACLAzzILp2tzEp3ZisztC70B8i7MERO1Row==" from miner <0.111.0>
 71 Minted "00007109e6933b7cab65545889a60654bb313539c7fb5614bfe4571d2643a3de" with string "yashranjan;SDujwZBjZyhvDjLoF8ho//rVitBQSHzaelZSHjXnRfF4g4lhkxCn6lvqy9qxhtoQZOu/S/CvcSVMtCIhGX2mwhpLIDrxZt74ICghJYV3CvVsxm+ard6CGuoNLcySUj0yjJ+m+g==" from miner <0.101.0>
 72 Minted "0000f21d98f246f3ac9fc6a520bc1a6a38ed04921d38891d78b014246f78a5dc" with string "yashranjan;fd/uDvfelDPJjnGWh9M1psWbLuLyPZ+M7gmMI7j0pw6mxVnYvpXpg9mOmghtXTN/ZhYJUXkrzynqwmCrA+fJtjOgeODlkTitsGgl9jiFXY8sDs8LIURaeEos56f8tTok1IAQbQ==" from miner <0.128.0>
 73 Minted "00004f501102afb07058d2c26ed39f6cc5dfbd6d80c7839365e8fc47cd458fab" with string "yashranjan;ButiGCLkDcLRKUG7wafpT1BKhg5Ho1QapjngjwQwuy8qo5DbN/unX4PKx3SMK/X0k7dpn46GzX1sq7VcOQD4Zpzjgjp9WHrGFkFheYZr4+tm9aINu0aT+YzWzHj8MXUVmJLcgA==" from miner <0.122.0>
 74 Minted "000087b179de3789e0a6d9ba7de8b5706b232456f01f3e3a1c7b6275ed6e0c8e" with string "yashranjan;zkyGG8wJA5GI2umf31aPmfn66mgPaZoGfYLlynMN+evEQSbhHbvM5eFFdJAfo1JmYY+uGQkTrhDo4CP+1r+sEd/NA0PG2Oy51iasH3C6/QPZVPxKECNjItUTg7N6pBAtgGek2g==" from miner <0.140.0>
 75 Minted "000065924d79104c4b3c6e9eca25d99acf2b1bfa76078c8ea13e95fb7c26fe5f" with string "yashranjan;Lo/xwA5SG3AH6Le+lHtMiecYGIRrgtj6Mzvv65UEkw0I/WmfaOQ216sqfxJhQIEkLFAQ9oulujXkTUs0qadA3zwPVuDwKs3eABUHY0lomTXosKL+354XpFvP7XLhcNL9MBPhpA==" from miner <0.121.0>
 76 Minted "00007d0c4f7fef283e31070479f55f1b3b0ba8780364a92c1957f7243422d645" with string "yashranjan;qgaK6ypE2SRZZHnXkadhRDg6bDrnaF2n9/00k5XvfkxCsWpPwqv0K7e4EEMK+Ld4wmMDGl9wVZqo3FIG4D/BlHzCaIsJB8tzyVauadpCAR77wpNrUmYcWzyx9+ErI/MTy1fAwQ==" from miner <0.140.0>
 77 Minted "00005906f90f393ccf935d5305784b8c9a287e4428847e9f7ffbedda946d1355" with string "yashranjan;fNu9unkZvePCXJqPZhRExcyXX6+F7EfCI8ziClcgU2IK6tbHJ1GfIc4d8lttJI+hoH/isvKl6tER9xqQdTYbJW1ZaUy5ayQ4nhaU78pGGmsaCiL8H3q9SKQrfoMlR1pF7v/elQ==" from miner <0.93.0>
 78 Minted "000049c5f7ae39a93d4fd1d51ecc56222dc3d5c7d80d9841c6189e7661b47df6" with string "yashranjan;B3AVz98lTCccIMHN7CCU6MnMn4bb5fSvYTne0u2vmDQEHpKeVw4Rvw7nsbScPNfO0bTFw8VGtKDIZonm/fjUWJgFGHNSkOfIjg+8Dvei4E2zG2QwySTk1WpvH/RkBMIrZS0rRA==" from miner <0.135.0>
 79 Minted "0000505b38c98c11dcf251b0d9c80cea28253a5b5393f561dfd865e3b13822a1" with string "yashranjan;lsBb20hCdRUYJRjFeahBawmFPr+MXCb4dxbt+tnNSv8E8OyxqNCODCMoLfTpppHrmT/45hW7GdnUUoAB/TuVbd7WCw10+mZIGrBmgXTRSFr8ASXtJZx38A3pR9h7Ci3T03yEeA==" from miner <0.138.0>
 80 Minted "00005d896d80258c26e78de1f5758c2090bcb42e724739501d72e352db5d2bd7" with string "yashranjan;1TNzqDVrLGs6H899hPuBagAyu91z4l3RlBlws95FnAJ6RlyTimO+Pu8Uu0PRjUlPScFO+jlkX6MH0HV9FxcJtUSorcS/CB3nhjcvnHUeky2XJIWACpAyJPAmqV5HJPNQFZa/Wg==" from miner <0.139.0>
 81 Minted "0000d66a16abbe5b449fe85dfad38b3ffbe8707ca88bad5ae683b3f68a14ffad" with string "yashranjan;A2BIvyb6BlOIz6sj0qB8xyxISVleoixtEVwlG+6G1TY/vF0PfWKT4133MzKrEFfl+C3r6+JS4mgqaOmlE+kqgfmFns2+EIsLA2t6kNSmy4uN9Afx2GMSadq1JSswAtaHaxeEug==" from miner <0.123.0>
 82 Minted "0000158842d6d38884275413ef5dc4c52602c458e613405bd72105dfc66ca05b" with string "yashranjan;DMMJmxBzCrPGezf5YdNDn/Tlcl1MCoEeBQZsOcKmnfJg94Pm3vbBOw/c8P+Yard87AU9L6WTN/JAxqh6o8MeU8UbOWDk2qmIlYeppbDh4zLPl6fpnqCyh96cmjUVZnFMcehA5A==" from miner <0.107.0>
 83 Minted "0000ded6f0f06ef102180ff2c81e2369eae701f3fff03514f98b5d837bcd42f9" with string "yashranjan;QNw4B620wwA8QedspPZk45VCQTmdtlwANQmHIDHLhNbX/7kAsRo11QZNuEuzLOG34vT10PMGM5qazT1pg+48USL+xg02PRIZO6AdCpQQ34Wpjk+9mwmsB7GrTQYqc15EnRjKcw==" from miner <0.117.0>
 84 Minted "00002affbc4edd5f943e555560b9940520ce86416f33e7d94b6d281f32ac3233" with string "yashranjan;B0gGvVEaOElDeCchU6UO83l1ljU3c4FSUxy8d49YnAkygDpWI/40EX4JKKf3Q2oZUcJCyD33NWHPjwuq0BDKMPQoN5Kz1sNJSdhWzNT3MjBIfty83ybNMdYb0OFyVNq+Lk1gmQ==" from miner <0.93.0>
 85 Minted "0000bce7346f59dea714957f24e6c3482880b3a856b713f6061d526cd945bb01" with string "yashranjan;v3CH6sIuurV4JfGWmB1QVtYtDjgCQs1m3MOgn+aJrzAxV0DJljpDtp1kPImf+l0Ye09S7fXY3XW9f6owAU/mEFDZc1KyMosW4BlMRJ3ybVetS36sLfoeKNAQCgdEx6ApYm9gRw==" from miner <0.119.0>
 86 Minted "0000c14ebe03d780f7ab29994de630dbe48436c340d1314f5f9b8ca3f02e38b2" with string "yashranjan;CVtS/oSN1ua2Krdi74yByDpeaPml4dG06GvmCkaTL55gUbVsNiiOPNQMK46DjSwyraKUT6D+2dq4MyDVYR02tbyYXJfHMWZIqMa/xp021pijBto9qduTdWKJlAaWHG16NNazDg==" from miner <0.109.0>
 87 Minted "00004be9bcc0b45ecce0a769000b822f964bebb40299b371bcf32f2fc397732c" with string "yashranjan;+RydZ9OECph1oWYzBhsUZJ6aUEvyD/Y3Aa1oZbRSlrW2KLDusGL/uUrQisHkx2eS+d8WQW/6qtUCVTsfjwJ0j+Avw+hfIuifDogky+CRrYWEN4463ialO7J6lCFP/F9o8ROIlg==" from miner <0.131.0>
 88 Minted "0000e3c30530c5187be98616c116dea5563c33280bb87505c53441435f7e47b3" with string "yashranjan;QDfAzI/bWQ8AlwTgkiupphudbmicShctRi0EJJ6fqceP1Alh5n+jFDysmrkAxIs4tleF5kHVQeSUnl5wW5lTdqOazHZr0VsFWfrtIW/KC2y3bZ1ZVONxpMegQ02LJpE//pD8bQ==" from miner <0.134.0>
 89 Minted "000048f1dac79270a9a9663a726ed88419b8bd1ecdccd2acead75a02f5e17bd4" with string "yashranjan;4tNFBjvhSkEOt394pPLBRDCey0Qrv2PRLk2XPEcDcMcVg9Kljc2mS9o9Uv5C42Xn29PHo29SYyd9PNY1nldbQRAm2vHdh2KIXxpdyQbsO6FrsVzsNS0k9rrHhFa+HJNCLWCPCw==" from miner <0.119.0>
 90 Minted "00001c6913127f070d2ccd653398b05613d3aa482ea66e1ab8ec6e738558f37c" with string "yashranjan;AqCcGhTMiF7y14kY5nF55hkpHv9pmmwRljYDNxYR1MJp+W6Nn90rSpqqmi96j3xTDS6EKUQc3WUmOQ5fxi4bWfATLyxbJ0wuzji+vHDTa/9w3JPWAKIdmnS3udevZXYjIghStg==" from miner <0.103.0>
 91 Minted "0000357596abf0cc99c4be17c95398da7f6909ffff611142391d3ec53537d498" with string "yashranjan;RCwDYVwBiyHaTVA23EuGEg7mQLxbPEpZGFW0VoWDfQgU7G7iAeIBLagP8HvnBByeyMDjteEyDIAMRsUbVPm2aLS0a1yQcsTBmCb4pm/6O8gWg1KviwHuO+844iLGCO1Hq3/E7A==" from miner <0.126.0>
 92 Minted "0000e8e8562179ed63f989f4091e533ca07b6565243d8ebf68d2839f769eaa05" with string "yashranjan;IaywQEuPJYFyEwdt7GMumlmlwfnDGPykOfSOjSLsrnBA0UsfxqnMM3NGPcFmuk8lQ7PKqEBOctzbcWqSy3lP7xCEuNuiVsyohYeZchaAQ+qON9tDpBHHmoAaWXN2ybSGba8AsA==" from miner <0.108.0>
 93 Minted "0000f2c15d9797f3c32318f16650dfb123777b512cfbc14fe5fae6b24fa44c1b" with string "yashranjan;xuGiN9QbSx/ctIO2QX+n676XqP49sDODQDlMFnjmWQgCJcQmArh3+1utCSSBUWf2YwF3XRTqBYebB7Uw0Ho/yj6snl7JiuBD2+A+YKZkptPaFvuVbOPAbF9Dz6wfuJuyQ5Js9A==" from miner <0.131.0>
 94 Minted "0000c9637a439ebeedc03f042c4dcfd9d3a13dedf743d6f0f981ffdde730b0c4" with string "yashranjan;9hVObB99W481y4lLmINhkgiG9AkeVtac5BQLey6Z+nOYFYHR+5fgnMWg/BKDidot7xRQ+wv6z+v5yF7zZyw7UHfBjKdEmlVaJQ1S4OKjQRFt/8bjoMXeOQT8KlMRMGkJbYb9AQ==" from miner <0.121.0>
 95 Minted "00003cea410a5d4b717a9bc929ab454bfc64bfc277d1ec2767728d255e16a3e3" with string "yashranjan;qdaOGqZYvE7NFLJSDDMcEMMQjlvgtNYwkFZlXWcqS+tMElp64UDRaYs9CgUrvTdML5gRhQDzEEL7lnfJUL5K1gIAbiCNTajvDNA8DE9I/NHGQyqgf+ohAhBa8KSWEbUEyuisiw==" from miner <0.120.0>
 96 Minted "00009bea6832312ba864860db247b5361c6e201eea9f5b47e31e7c37b5853735" with string "yashranjan;rwfxQA97WiKzSe1yBPvgf/56gtFXy5u12tjztMxm9Or9d8IRREY+aHfA1cVEihtoy2Gg93KbZ1l76qEccKevk/U7Au8oeRt+85Q93bLZoJeN2D3J4ySRD6hrokgWiDp9dPjFsw==" from miner <0.127.0>
 97 Minted "00006817a2e0e3ea32ed9c3b9070f4aa513762cca669aa3d70e3d0ac8d8bbab2" with string "yashranjan;9LfmN7X/KbrFqg77szay2Z29SNkaP3j8+c5QmdKkfi5mRnuwlI2DKJgOBRlM4p9Gt1LrsFLoBizSG93nmUlHr69LeH0M9AL3OlQ7XTXvUtPob+68feGQWqiidYP5lN9ze1BGQg==" from miner <0.138.0>
 98 Minted "00008cb9b8475a05a3f966bc48b74b52c7f956fc822b56829ec338371100ece5" with string "yashranjan;jmr8F8s9ia5fZshXwOYn66/nSm1h+zdH6NEv+8EhNvd6+ohGFKfRiEFIXBEPo9FtfPxQTOlQC/R7yUJl0T1hf4GFl65WHcw4Sqco11rTXZfMgmG87XQJJZnRtKDt4aumsci41g==" from miner <0.127.0>
 99 Minted "00008e9bbbfebf9556cc84922b5109a04168048f9e9dc3ba74b1329bc714d1e9" with string "yashranjan;hCOLG+4sc2jSKGL0BKijWHCgSDLMH681Eftx5izv+BXdENyN1UfSJYTdahRIZGbU26LMyooxzhtpAx2c3JSv4jfO/WaYZAHOdFj2S9ymVmVHqYd7zxXUdXBhx7Uaqun/bd9Z0w==" from miner <0.109.0>
 100 Minted "0000e6ef87dd1b19334594282a4e9eae7cdf4c334dcf0ae858d003b68550b9df" with string "yashranjan;eO/6e942xICtLPRiQPn2822+sxEfHh92h90r0asqLujhICi8+ouVLSd4Ipfy+kRFmIGfhGQnAYn0jZ6LGDrQl6HBsd9IfU/RzONBc3UIVZ36fouAdrfHBcT+Q+Sfk5R5vbNF1g==" from miner <0.125.0>
Total clock time: 19761.4
Toal CPU time 44049
 CPU time/ Run Time 2.2290424767475985
true

 ```
 3. The running time for the above is reported by time for the above and report the time.  The ratio of CPU time to REAL TIME tells you how many cores were effectively used in the computation.  If you are close to 1 you have almost no parallelism (points will be subtracted).
 * Solution: For input of 4 leading Zeroes the ratio is: <br />
```
Total clock time: 19761.4 <br />
Toal CPU time 44049 <br />
CPU time/ Run Time 2.2290424767475985 <br />
```

4. The coin with the most 0s you managed to find.
* Solution: 7 leading Zeroes
```
Erlang/OTP 25 [erts-13.0.4] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [jit] [dtrace]

Eshell V13.0.4  (abort with ^G)
1> c(master).
{ok,master}
2> c(miner).
{ok,miner}
3> master:start().
Number of 0s to mine: 7.
Number of miners to spawn 50.
 1 Minted "000000045d8719f0e85cd66ebcf10e53f94abd19dc71be10361f5bc5f7ba3a04" with string "yashranjan;XgndsAHXo15kvy5eyDP0lWTiIYqG+tTFOHzawKCvaARHBAqkNdj7RVyuun1GUuvcjRhEgIwl7ir7dmdSYWtbpKf6VqI5pAFBDHQ9PG8pcHPeAtUO3JW+Q6IwXOZp5vvWoOeJEQ==" from miner <0.92.0>
 2 Minted "0000000e0532513a4d1e94c954d61c1cdfaa92a2db0a2513b58fa909d6d850ca" with string "yashranjan;/cp/wpY5dyLN26Ea5LE34CtiDnNu18Nxzyd7i9Uok4lf4GcJPeio8mS44uh97ocCXEjSbcp+8CGZlqiUPh61fmZ23leuagLN1Jv8Yt8iuTDGdUABwcsl7nhXvEH5GkxheJ7tog==" from miner <0.106.0>
 3 Minted "0000000ffb61d7f9a89b4b6c89f81f6cf1e2d663b683df7b37eca92baf384a46" with string "yashranjan;+iN3Y+97/LOMnkKQT6zPYktWbk7bbBjCb9tCjankB9YQqq19/aoH3Z78hkOQnNWAi1MtN0oDF5dRgYDHJJZR62IDt/y3kWmUfLy9sqO7U6URn/ETJYrhGcZ3GhCFu37F4XIX4A==" from miner <0.100.0>
 4 Minted "0000000ed61b100b5091bf081273c27a646c5b783270938de6d2eaeaaf1c453b" with string "yashranjan;5lyV1IvROtkdFqbToHE6S+JntXMGRYZ22A9TZ83Hi2o2hwh4ZjNmLJFnt6pvAC9HxAY8sW3LPSYKcijIq0y6UyeqwYLrQ2KFcUmO7L7Vynl6VonbljfuDidmZROEHIHfg4bnwA==" from miner <0.119.0>
 5 Minted "000000081455adba9fcf3851045a7f723eb172578a8b6377d4137dd1062b6bb9" with string "yashranjan;98KPdDefrdMW75D1Sv5gBmxW3T6EB8CqA/eQibwM8Vy8jNToFqWD6sqZ5sYiBXrJxyl39b4/1jg7cUsfUSxj6YgmRhAWg0fOgy4w9ANk/vS9qVXGCKHZJWMnSVdyjqFf1av0rA==" from miner <0.131.0>
 6 Minted "0000000dfd7562799a8928850606e85fc7d71cd320139c9ea52b84c03597d32f" with string "yashranjan;lYngzIsidXqhk+sxPvG5Ma71ZWl1ShFwao7UmzDhI2X4jpVS/s/GSFBbQiGZ6+chwK7c4HRp38iaCAr2ffWZyLtIfKcXxYbJ4G3WVKkbnWAsI4W2J0kUnMjBGx/redIW0stZFQ==" from miner <0.130.0>

```
5. The largest number of working machines you were able to run your code with?
* Solution:  <br />
 The largest number of working machines that we were able to work on a miner and master on distributed principles are 4.
 
 ![](images/Screen%20Shot%202022-09-24%20at%203.53.44%20PM.png)
 












