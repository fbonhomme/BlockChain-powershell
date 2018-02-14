# BlockChain-powershell

PS C:\data\site10> . .\BlockChain.ps1
PS C:\data\site10> $block = [block]::new
PS C:\data\site10> $block = [block]::new()
01/01/0001 00:00:000
14/02/2018 18:03:570
PS C:\data\site10> $block

timestamp           data hash                             previousHash
---------           ---- ----                             ------------
14/02/2018 18:03:57      7cb7b34f28f9ac8cda0d683ca9eae596


PS C:\data\site10> $block | gm


   TypeName: block

Name          MemberType Definition
----          ---------- ----------
calculatehash Method     string calculatehash()
Equals        Method     bool Equals(System.Object obj)
GetHashCode   Method     int GetHashCode()
GetType       Method     type GetType()
mineBlock     Method     void mineBlock(int difficulty)
ToString      Method     string ToString()
data          Property   hashtable data {get;set;}
hash          Property   System.Object hash {get;set;}
previousHash  Property   string previousHash {get;set;}
timestamp     Property   datetime timestamp {get;set;}


PS C:\data\site10> $block | gm -force


   TypeName: block

Name             MemberType   Definition
----             ----------   ----------
pstypenames      CodeProperty System.Collections.ObjectModel.Collection`1[[System.String, System.Private.CoreLib, Version=...
psadapted        MemberSet    psadapted {timestamp, data, hash, previousHash, get_timestamp, set_timestamp, get_data, set_...
psbase           MemberSet    psbase {timestamp, data, hash, previousHash, get_timestamp, set_timestamp, get_data, set_dat...
psextended       MemberSet    psextended {}
psobject         MemberSet    psobject {Members, Properties, Methods, ImmediateBaseObject, BaseObject, TypeNames, get_Memb...
calculatehash    Method       string calculatehash()
Equals           Method       bool Equals(System.Object obj)
GetHashCode      Method       int GetHashCode()
GetType          Method       type GetType()
get_data         Method       hashtable get_data()
get_hash         Method       System.Object get_hash()
get_nonce        Method       int get_nonce()
get_previousHash Method       string get_previousHash()
get_timestamp    Method       datetime get_timestamp()
mineBlock        Method       void mineBlock(int difficulty)
set_data         Method       void set_data(hashtable )
set_hash         Method       void set_hash(System.Object )
set_nonce        Method       void set_nonce(int )
set_previousHash Method       void set_previousHash(string )
set_timestamp    Method       void set_timestamp(datetime )
ToString         Method       string ToString()
data             Property     hashtable data {get;set;}
hash             Property     System.Object hash {get;set;}
nonce            Property     int nonce {get;set;}
previousHash     Property     string previousHash {get;set;}
timestamp        Property     datetime timestamp {get;set;}


PS C:\data\site10> $block.mineBlock(1)
14/02/2018 18:03:571
Block mined 5e2f1be94639e650ed622e2583afe735 -- 1
14/02/2018 18:03:572
Block mined 0718569e69b85c22ac6a9f0c86e8237e -- 2
PS C:\data\site10> $block.mineBlock(2) | out-null
14/02/2018 18:03:573
Block mined eb7fffb7c070655c503ec8ee4b816287 -- 3
14/02/2018 18:03:574
Block mined 7174af3fa02c2fbcce780c6eecf3fce1 -- 4
14/02/2018 18:03:575
Block mined 0030e2437a2b8be033f42bdfb275f0c2 -- 5
PS C:\data\site10> CommandInvocation(Out-Null): "Out-Null"
PS C:\data\site10> $block.mineBlock(3)
14/02/2018 18:03:576
Block mined 1423825e9b066724ff237a7ff693a76f -- 6
14/02/2018 18:03:577
Block mined cdac6dd44aeadc57f5232a65658d5b5a -- 7
14/02/2018 18:03:578
Block mined 2695d5b584f86dddba7af53a4579c5e6 -- 8
14/02/2018 18:03:579
Block mined cb9d62578140d5f0ee939a5cce9fe1fa -- 9
14/02/2018 18:03:5710
Block mined e2a47be37b38950964c01326ffcaffe1 -- 10
##############################

14/02/2018 18:03:573497
Block mined 8cf339fbae9c15b3b7026107eb5ddce3 -- 3497
14/02/2018 18:03:573498
Block mined 000071ddfc46c6048c0e3dd234a41045 -- 3498
PS C:\data\site10> $block

timestamp           data hash                             previousHash
---------           ---- ----                             ------------
14/02/2018 18:03:57      000071ddfc46c6048c0e3dd234a41045


PS C:\data\site10> $block.data = @{"nom"="durant"}
PS C:\data\site10> $block

timestamp           data  hash                             previousHash
---------           ----  ----                             ------------
14/02/2018 18:03:57 {nom} 000071ddfc46c6048c0e3dd234a41045

PS C:\data\site10> $block.data

Name                           Value
----                           -----
nom                            durant

PS C:\data\site10> $block.data += @{"nom"="durant"}
PS C:\data\site10> $block.data

Name                           Value
----                           -----
nom                            durant
Prenom                         Jean


PS C:\data\site10> $block

timestamp           data          hash                             previousHash
---------           ----          ----                             ------------
14/02/2018 18:03:57 {nom, Prenom} 000071ddfc46c6048c0e3dd234a41045



PS C:\data\site10> $blockchain = [blockchain]::new()
01/01/0001 00:00:000
01/01/2018 00:00:00createorgBlockorigine0
PS C:\data\site10> $blockchain

chain
-----
{block}


PS C:\data\site10> $blockchain.chain

timestamp           data             hash                             previousHash
---------           ----             ----                             ------------
01/01/2018 00:00:00 {createorgBlock} dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $blockchain.chain.data

Name                           Value
----                           -----
createorgBlock                 origine


PS C:\data\site10> $blockchain | gm


   TypeName: blockchain

Name            MemberType Definition
----            ---------- ----------
addBlock        Method     void addBlock(), void addBlock(block newBlock)
createorigBlock Method     block createorigBlock()
Equals          Method     bool Equals(System.Object obj)
GetHashCode     Method     int GetHashCode()
getLatesBlock   Method     block getLatesBlock()
GetType         Method     type GetType()
isChainValid    Method     bool isChainValid()
Tocjson         Method     string Tocjson()
ToString        Method     string ToString()
chain           Property   System.Object chain {get;set;}


PS C:\data\site10> $blockchain.addBlock($block)
PS C:\data\site10> $blockchain

chain
-----
{block, block}


PS C:\data\site10> $blockchain.chain

timestamp           data             hash                             previousHash
---------           ----             ----                             ------------
01/01/2018 00:00:00 {createorgBlock} dd11cbf8534dd6d7ca272eda4956efef
14/02/2018 18:03:57 {nom, Prenom}    000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $blockchain.Tocjson()
[
  {
    "timestamp": "2018-01-01T00:00:00",
    "data": {
      "createorgBlock": "origine"
    },
    "hash": "dd11cbf8534dd6d7ca272eda4956efef",
    "previousHash": null,
    "nonce": 0
  },
  {
    "timestamp": "2018-02-14T18:03:57.1986512+01:00",
    "data": {
      "nom": "durant",
      "Prenom": "Jean"
    },
    "hash": "000071ddfc46c6048c0e3dd234a41045",
    "previousHash": "dd11cbf8534dd6d7ca272eda4956efef",
    "nonce": 3498
  }
]
PS C:\data\site10> $blockchain.isChainValid()
14/02/2018 18:03:57nom Prenomdurant Jean3498
False
PS C:\data\site10> $blockchain.chain

timestamp           data             hash                             previousHash
---------           ----             ----                             ------------
01/01/2018 00:00:00 {createorgBlock} dd11cbf8534dd6d7ca272eda4956efef
14/02/2018 18:03:57 {nom, Prenom}    000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $blockchain.chain[1]

timestamp           data          hash                             previousHash
---------           ----          ----                             ------------
14/02/2018 18:03:57 {nom, Prenom} 000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $blockchain.chain[1].calculatehash()
14/02/2018 18:03:57nom Prenomdurant Jean3498
f6588e07288667cf4ef601c45091c402
PS C:\data\site10> $blockchain.chain[1]

timestamp           data          hash                             previousHash
---------           ----          ----                             ------------
14/02/2018 18:03:57 {nom, Prenom} 000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $block

timestamp           data          hash                             previousHash
---------           ----          ----                             ------------
14/02/2018 18:03:57 {nom, Prenom} 000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $block.calculatehash()
14/02/2018 18:03:57nom Prenomdurant Jean3498
f6588e07288667cf4ef601c45091c402
PS C:\data\site10> $block

timestamp           data          hash                             previousHash
---------           ----          ----                             ------------
14/02/2018 18:03:57 {nom, Prenom} 000071ddfc46c6048c0e3dd234a41045 dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $block1 =[block]::new("02/04/2015",@{"nom"="fan"})
01/01/0001 00:00:000
04/02/2015 00:00:00nomfan0
PS C:\data\site10> $block1

timestamp           data  hash                             previousHash
---------           ----  ----                             ------------
04/02/2015 00:00:00 {nom} ae7e7d40e7e1cfc172557b4cb80e1a57


PS C:\data\site10> $block1.calculatehash()
04/02/2015 00:00:00nomfan0
ae7e7d40e7e1cfc172557b4cb80e1a57
PS C:\data\site10> $blockchain1 = [blockchain]::new()
01/01/0001 00:00:000
01/01/2018 00:00:00createorgBlockorigine0
PS C:\data\site10> $blockchain1.addBlock($block1)
04/02/2015 00:00:00nomfan1
Block mined 512eb3a6c6f074833945448d74410dc1 -- 1
04/02/2015 00:00:00nomfan2
Block mined c07906f29eb641985bf8bb38cec37544 -- 2
04/02/2015 00:00:00nomfan3
Block mined b404995c45ec048230f107f94d7390b5 -- 3
04/02/2015 00:00:00nomfan4
Block mined cf759c7913e6ca47bd0b82289728e52f -- 4
04/02/2015 00:00:00nomfan5
Block mined bfd0fd589271439a6cc03c1ae1e5e1ce -- 5
04/02/2015 00:00:00nomfan6
Block mined 0fb9639db43162a8287a39d8904ea47a -- 6
PS C:\data\site10> $blockchain1

chain
-----
{block, block}


PS C:\data\site10> $blockchain1.chain

timestamp           data             hash                             previousHash
---------           ----             ----                             ------------
01/01/2018 00:00:00 {createorgBlock} dd11cbf8534dd6d7ca272eda4956efef
04/02/2015 00:00:00 {nom}            0fb9639db43162a8287a39d8904ea47a dd11cbf8534dd6d7ca272eda4956efef


PS C:\data\site10> $blockchain1.Tocjson()
[
  {
    "timestamp": "2018-01-01T00:00:00",
    "data": {
      "createorgBlock": "origine"
    },
    "hash": "dd11cbf8534dd6d7ca272eda4956efef",
    "previousHash": null,
    "nonce": 0
  },
  {
    "timestamp": "2015-02-04T00:00:00",
    "data": {
      "nom": "fan"
    },
    "hash": "0fb9639db43162a8287a39d8904ea47a",
    "previousHash": "dd11cbf8534dd6d7ca272eda4956efef",
    "nonce": 6
  }
]
PS C:\data\site10> $blockchain1.isChainValid()
04/02/2015 00:00:00nomfan6
True
