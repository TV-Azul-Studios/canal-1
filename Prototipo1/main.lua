require"player"
require"mundo"
camera={}
camera.x=0
camera.y=0
sistema={}
sistema.tempo=0
sistema.f=0
sistema.se=0
sistema.so=0

ok = true

function love.load()
	vini.img=love.graphics.newImage(vini.imagem)
	vini2.img=love.graphics.newImage(vini2.imagem)
end

function love.update(dt)
	if(triller=="michael") then
		if(love.keyboard.isDown("up") or love.keyboard.isDown("down") or love.keyboard.isDown("right") or love.keyboard.isDown("left")) then
			sistema.tempo = sistema.tempo + (dt/2)
			sistema.f = sistema.f + (dt/2)
			sistema.se = sistema.se + (dt/2)
			sistema.so = sistema.so + (dt/2)
		end

		if(sistema.tempo >= 24)then
			sistema.tempo = 0
		end
		if(sistema.f > 3) then

			vini.fome = vini.fome + 1
			sistema.f = 0

		end
		if(sistema.se > 3) then

			vini.sede = vini.sede + 1
			sistema.se = 0

		end
		if(sistema.so > 5) then

			vini.sono = vini.sono + 1
			sistema.so = 0

		end

		if(love.keyboard.isDown("up"))	then
				vini:walk(0,-vini.velY*dt)
		elseif(love.keyboard.isDown("down"))	then
				vini:walk(0,vini.velY*dt)
		end

		if(love.keyboard.isDown("right"))	then
				vini:walk(vini.velX*dt,0)
		elseif(love.keyboard.isDown("left"))	then
				vini:walk(-vini.velX*dt,0)
		end
		if(vini.x > 800+camera.x) then
			camera.x=camera.x + 800
		end
		if(vini.y > 600+camera.y) then
			camera.y=camera.y + 600
		end
		if(vini.x < camera.x) then
			camera.x = camera.x-800
		end
		if(vini.y < camera.y) then
			camera.y=camera.y - 600
		end
		if (vini.y >=200 and vini.y <= 300)then
			if(vini.x >= 300 and vini.x <350)then
				vini2.x=20
				triller="jackson"
			elseif(vini.x >=350 and vini.x<400)then
				vini2.x=750
				triller="jackson"
			end
		end
	else
		if(love.keyboard.isDown("right"))	then
				vini2:walk(vini.velX*dt)
		elseif(love.keyboard.isDown("left"))	then
				vini2:walk(-vini.velX*dt)
		end

		

		if(vini2.x < 0 )then
			vini.x = vini.x-100
			triller="michael"
		elseif(vini2.x > 800)then
			vini.x = vini.x +100 
			triller="michael"
		end
	end

end
noc=0
function love.draw()
	if(triller=="michael") then
		love.graphics.translate(-camera.x,-camera.y)
		love.graphics.draw(vini.img,vini.x,vini.y,0,vini.largura,vini.altura)

		love.graphics.draw(vini2.img,300,200,45,1/5,1/5)

		love.graphics.print("Hora: " .. sistema.tempo, camera.x + 719, camera.y + 0)
		love.graphics.print("Fome: " .. vini.fome, camera.x + 719, camera.y + 10)
		love.graphics.print("Sede: " .. vini.sede, camera.x + 719, camera.y + 20)
		love.graphics.print("Sono: " .. vini.sono, camera.x + 719, camera.y + 30)
	else
		love.graphics.draw(vini2.img,vini2.x,vini2.y,0,vini2.largura,vini2.altura)
	end
end
