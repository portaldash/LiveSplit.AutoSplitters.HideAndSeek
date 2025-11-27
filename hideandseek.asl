state("7DFPS-HideAndSeek-Fei")
{
    int gameState : "7DFPS-HideAndSeek-Fei.exe", 0x92C620;

    // itemsLeft pointer with reversed offsets
    int itemsLeft : "7DFPS-HideAndSeek-Fei.exe", 0x0095D15C, 0x0, 0x40, 0xB4, 0x38, 0x70, 0x24, 0x14;
}

init
{
    vars.prevItems = -1;
}

start
{
    return current.gameState == 0 && old.gameState != 0;
}

reset
{
    return current.gameState == 2 && old.gameState != 2;
}

split
{
    // Round-end split
    if (current.gameState == 1 && old.gameState != 1)
        return true;

    // Split when itemsLeft decreases
    if (vars.prevItems != -1 && current.itemsLeft < vars.prevItems)
    {
        vars.prevItems = current.itemsLeft;
        return true;
    }

    vars.prevItems = current.itemsLeft;
    return false;
}
