function CollisionRisingEdge(col, RsEdge)
    if(col and not RsEdge) then
        RsEdge = true
        return true
    elseif(not col and RsEdge) then
        RsEdge = false
        return false
    elseif(col and RsEdge) then
        return false
    end
end