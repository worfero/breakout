function CollisionRisingEdge(collider, collision, RsEdge)
    if(collider:collidesWith(collision) and not RsEdge) then
        RsEdge = true
        return true
    elseif(not collider:collidesWith(collision) and RsEdge) then
        RsEdge = false
        return false
    elseif(collider:collidesWith(collision) and RsEdge) then
        return false
    end
end