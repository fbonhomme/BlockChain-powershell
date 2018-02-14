class block{
    [datetime]$timestamp
    [Hashtable]$data
    $hash = $this.calculatehash()
    [string]$previousHash
    hidden [int]$nonce = 0

    block(
        [datetime]$timestamp,
        [Hashtable]$data
        )
        {
            $this.timestamp= $timestamp
            $this.data=$data
            $this.hash = $this.calculatehash()
        }
    block()
    {
        $this.timestamp = $(get-date)
        $this.hash = $this.calculatehash()
    }

    [string] calculatehash()
        {
            $md5 = new-object -TypeName System.Security.Cryptography.MD5CryptoServiceProvider
            $utf8 = new-object -TypeName System.Text.UTF8Encoding
            $mycode = $this.timestamp.tostring() + $this.data.keys + $this.data.values +$this.nonce.tostring()
            write-host $mycode -ForegroundColor Green
            $hash0 = [System.BitConverter]::ToString($md5.ComputeHash($utf8.GetBytes($mycode)))
            $hash0 = $hash0.ToLower() -replace '-', ''
            #write-host $hash0 -ForegroundColor red
            return  $hash0
        }
    [void]mineBlock([int]$difficulty)
        {
            while($this.hash.substring(0,$difficulty) -ne ("0"*$difficulty) )
            {   $this.nonce ++
                $this.hash = $this.calculatehash()
                write-host "Block mined $($this.hash) -- $($this.nonce)" -ForegroundColor Green
            }
            return
        }
}

class blockchain
{
    hidden [int]$difficulty = 1
    $chain = @($this.createorigBlock())

    [block]createorigBlock()
            {
                return [block]::new("01/01/2018 00:00:00", @{"createorgBlock"="origine"})
            }
    [block]getLatesBlock()
            {
                return $this.chain[$this.chain.length -1]
            }
    [void]addBlock(){
             Write-host "You won't see this message"
        Return
            }
    [string]Tocjson(){
                return $this.chain | ConvertTo-Json
            }

   addBlock([block]$newBlock)
            {
                $newBlock.previousHash = $this.getLatesBlock().hash
                #write-host "dif: $($this.difficulty)"
                $newBlock.mineBlock($this.difficulty)
                $this.chain = $this.chain + $newBlock
            }

  blockchain()
        {

        }
    [Boolean]isChainValid()
    {
            for($i=1;$i -lt $this.chain.length;$i++)
                {
                    $currentBlock = $this.chain[$i]
                    $previousBlock = $this.chain[$i-1]
                    if( $currentBlock.hash -ne $currentBlock.calculatehash())
                        {return $false}
                    if($currentBlock.previousHash -ne $previousBlock.hash)
                        {return $false}
            }
        return $true
    }

}

#$save = [blockchain]::new()
#$save.addBlock([block]::new("06/01/2018 00:00:00", @{"test"=4}))
#$save.addBlock([block]::new("04/01/2018 00:00:00", @{"test1"=10}))
#$save.chain
#$save | gm -force
