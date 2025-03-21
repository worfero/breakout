function BallLost(self) -- reseta os parâmetros iniciais da bola ao perder o jogo
	table.remove(balls, indexOf(balls, self))
	if(tablelength(balls) <= 0) then
		player.lives = player.lives - 1
		balls[1] = Ball(screenWidth/2, screenHeight/2, 0, 1, 5)
	end
end

function NewBall(self)
	balls[tablelength(balls) + 1] = Ball(self.x, self.y, -self.vx, self.direction, self.vy)
	balls[tablelength(balls)].wait = 0
end