state("7DFPS-HideAndSeek-Fei")
{
    int gameState : "7DFPS-HideAndSeek-Fei.exe", 0x92C620;
}

init
{
    vars.prevState = -1;  // previous gameState
}
start
{
    // Game just started
    return current.gameState == 0 && old.gameState != 0;
}

reset
{
    // Game reset / back to lobby
    return current.gameState == 2 && old.gameState != 2;
}

split
{
    // Split when round ends / you win
    if (current.gameState == 1 && old.gameState != 1)
    {
        return true;
    }

    return false;
}
