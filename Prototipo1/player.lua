vini={}
vini.imagem='imagem/vini.png'
vini.x=25
vini.y=30
vini.img=nil
vini.altura=1/5
vini.largura=1/5
vini.velX = 400
vini.velY = 400
vini.fome = 0
vini.sede = 0
vini.sono = 0
function vini:walk(x,y)

	vini.x = vini.x + x
	vini.y = vini.y + y

end

vini2={}
vini2.imagem ='imagem/mario.png'
vini2.x=25
vini2.y=550
vini2.img=nil
vini2.altura=1/5
vini2.largura=1/5
vini2.velX = 400
vini2.velY = 400
vini2.gravidade=100

function vini2:pulo(y,dt)
	vini2.y=vini2.y + (y*dt)
end

function vini2:walk(x)

	self.x = self.x + x

end
